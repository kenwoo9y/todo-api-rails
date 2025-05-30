# frozen_string_literal: true

# UsersController
#
# This controller handles the CRUD operations for the User model.
# It provides endpoints for listing users, showing a single user,
# creating a new user, updating an existing user, and deleting a user.
class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # GET /users/:id
  def show
    render json: @user, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH /users/:id
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  # GET /users/username/:username
  def show_by_username
    @user = User.find_by(username: params[:username])
    if @user
      render json: @user, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  # GET /users/:id/tasks
  def tasks_by_user
    @user = User.find(params[:id])
    @tasks = @user.tasks.order(
      Arel.sql(
        "CASE status WHEN 'Done' THEN 1 ELSE 0 END ASC, due_date ASC, created_at DESC"
      )
    )
    render json: @tasks, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'User not found' }, status: :not_found
  end

  def user_params
    params.permit(:username, :email, :first_name, :last_name)
  end
end
