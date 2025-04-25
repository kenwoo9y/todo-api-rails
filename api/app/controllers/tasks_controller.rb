# frozen_string_literal: true

# TasksController
#
# This controller handles the CRUD operations for the Task model.
# It provides endpoints for listing tasks, showing a single task,
# creating a new task, updating an existing task, and deleting a task.
class TasksController < ApplicationController
  before_action :set_task, only: %i[show update destroy]

  # GET /tasks
  def index
    @tasks = Task.all
    render json: @tasks, status: :ok
  end

  # GET /tasks/:id
  def show
    render json: @task, status: :ok
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH /tasks/:id
  def update
    if @task.update(task_params)
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end

  private

  def set_task
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Task not found' }, status: :not_found
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date, :owner_id)
  end
end
