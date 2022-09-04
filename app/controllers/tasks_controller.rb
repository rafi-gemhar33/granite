# frozen_string_literal: true

class TasksController < ApplicationController
  respond_to :html, :xml, :json

  def index
    render status: :ok, json: { tasks: tasks }
  end
end
