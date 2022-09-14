- gem 'wicked_pdf'

```ruby
gem "wicked_pdf"
gem "wkhtmltopdf-binary"

# bundle install
# bundle exec rails generate wicked_pdf

```

```html
<!-- touch app/views/layouts/pdf.html.erb -->

<!DOCTYPE html>
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  </head>
  <style>
    .flexrow {
      display: -webkit-box;
      display: -webkit-flex;
      display: flex;
    }

    .flexrow > div {
      -webkit-box-flex: 1;
      -webkit-flex: 1;
      flex: 1;
    }

    .flexrow > div:last-child {
      margin-right: 0;
    }
  </style>
  <body onload="number_pages">
    <div id="header"></div>
    <div id="content"><%= yield %></div>
  </body>
</html>

```

### report route
```ruby
# routes.rb
resources :tasks, except: %i[new edit], param: :slug do
  collection do
    resource :report, only: %i[create], module: :tasks do
      get :download, on: :collection
    end
  end
end

```

### PDF generation worker
- ApplicationController.renderer.render template: "..."
- allows us to render arbitrary templates without requirement of being in controller actions
```ruby
# touch app/workers/reports_worker.rb
class ReportsWorker
  include Sidekiq::Worker

  def perform(user_id, report_path)
    tasks = Task.accessible_to(user_id)
    content = ApplicationController.render(
      assigns: {
        tasks: tasks
      },
      template: "tasks/report/download",
      layout: "pdf"
    )
    pdf_blob = WickedPdf.new.pdf_from_string content
    File.open(report_path, "wb") do |f|
      f.write(pdf_blob)
    end
  end
end

# Task model
scope :accessible_to, ->(user_id) { where("task_owner_id = ? OR assigned_user_id = ?", user_id, user_id) }

###  PDF content view

# mkdir -p app/views/tasks/report/
# touch app/views/tasks/report/download.html.erb

<div class="mb-4 font-bold">Your tasks:</div>
<div class="p-4 mb-8 bg-white neeto-ui-shadow-s rounded">
  <% @tasks.each do |task| %>
  <div class="flexrow w-full mb-4">
    <span>
      <% if task.completed? %>
      <input type="checkbox" checked />
      <% else %>
      <input type="checkbox" />
      <% end %>
    </span>
    <div class="ml-4">
      <div class="mb-1">
        <div class="text-gray-500"><%= task.title %></div>
      </div>
    </div>
  </div>
  <% end %>
</div>

```


### Add the reporting controllers

```ruby
# bundle exec rails g controller "tasks/reports" create download --skip-routes --no-helper --no-assets --no-template-engine --no-test-framework
class Tasks::ReportsController < ApplicationController
  def create
    ReportsWorker.perform_async(current_user.id, report_path)
    respond_with_success(t("in_progress", action: "Report generation"))
  end

  def download
    if File.exist?(report_path)
      send_file(
        report_path,
        type: "application/pdf",
        filename: pdf_file_name,
        disposition: "attachment"
      )
    else
      respond_with_error(t("not_found", entity: "report"), :not_found)
    end
  end

  private

    def report_path
      @_report_path ||= Rails.root.join("tmp/#{pdf_file_name}")
    end

    def pdf_file_name
      "granite_task_report.pdf"
    end
end
```

## Frontend logic


### for downloading a file

```jsx
// App.jsx:
import DownloadReport from "components/Tasks/DownloadReport";
...
<Route exact path="/tasks/report" component={DownloadReport} />;
```
```jsx
// apis/tasks
const generatePdf = () => axios.post("/tasks/report", {});
const download = () =>
  axios.get("/tasks/report/download", { responseType: "blob" });


// touch app/javascript/src/components/Tasks/DownloadReport.jsx

import React, { useState } from "react";

import tasksApi from "apis/tasks";
import Toastr from "components/Common/Toastr";
import Container from "components/Container";

const DownloadReport = () => {
  const [isLoading, setIsLoading] = useState(true);

  const generatePdf = async () => {
    try {
      await tasksApi.generatePdf();
    } catch (error) {
      logger.error(error);
    }
  };

  const saveAs = ({ blob, fileName }) => {
    const objectUrl = window.URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = objectUrl;
    link.setAttribute("download", fileName);
    document.body.appendChild(link);
    link.click();
    link.parentNode.removeChild(link);
    setTimeout(() => window.URL.revokeObjectURL(objectUrl), 150);
  };

  const downloadPdf = async () => {
    try {
      Toastr.success("Downloading report...");
      const { data } = await tasksApi.download();
      saveAs({ blob: data, fileName: "granite_task_report.pdf" });
    } catch (error) {
      logger.error(error);
    } finally {
      setIsLoading(false);
    }
  };

  useState(() => {
    generatePdf();
    setTimeout(() => {
      downloadPdf();
    }, 5000);
  }, []);

  const message = isLoading
    ? "Report is being generated..."
    : "Report downloaded!";

  return (
    <Container>
      <h1>{message}</h1>
    </Container>
  );
};

export default DownloadReport;
```

### TODO:
- Write tests verifying this logic - give this a shot. Try to apply what you've learnt till now.
- Having dynamic report names - say in the format {current_user}_{today}_report.pdf.
- Using Active Storage with some platform like S3 or Google Cloud to handle this logic in production env.
