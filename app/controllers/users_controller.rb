class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :ok
    else
      render json: "Create user fail.", status: :not_implemented
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render json: @user, status: :ok
    else
      render json: "User not found!", status: :not_found
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: "Update user fail", status: :not_implemented
    end
  end

  def destroy
    User.destory_by(id: params[:id])
    render json: "Delete user successful", status: :ok
  rescue StandardError => e
    render json: "Delete user fail, Error message: #{e}", status: :not_implemented
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
