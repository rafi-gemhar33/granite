# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_user_using_x_auth_token, only: :create

  def index
    users = User.all.select(:id, :name)
    render status: :ok, json: { users: users }
  end

  def create
    user = User.create!(user_params)
    user.save!
    respond_with_success(t("successfully_created", entity: "User"))
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
