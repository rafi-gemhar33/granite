
- postgres -V
- pg_isready

- install heroku cli
- heroku login
- heroku create --stack heroku-20
- heroku stack

- heroku buildpacks:set heroku/nodejs --index 1
- heroku buildpacks:set heroku/ruby --index 2

- bundle lock --add-platform x86_64-linux
- git push heroku <master or main>
- heroku run rails db:migrate -a <heroku_application_name>
- heroku open
- heroku logs -t -a <heroku_application_name>
- heroku run rails console -a <heroku_application_name>
- heroku apps:rename <new_application_name> --app <heroku_application_name>
