- render status: :ok, json: { notice: 'Task was successfully created' }

- params.require(:task).permit(:title)

- rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
- resources :tasks, only: %i[index create], param: :slug
