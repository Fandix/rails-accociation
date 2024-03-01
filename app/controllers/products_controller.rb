class ProductsController < ApplicationController
  before_action :user_info
  before_action :product_info, on: [:show, :update, :destroy]

  def index
    render json: @user.products, status: :ok if @user.products
  rescue StandardError => e
    render json: e
  end

  def create
    @product = @user.products.create!(product_params)
    render json: @product, status: :ok if @product
  rescue StandardError => e
    render json: e
  end

  def show
    render json: @product, status: :ok
  end

  def update
    @product.updaet!(product_params)
    render json: @product, status: :ok
  rescue StandardError => e
    render json: e
  end

  def destroy
    @product.destroy
    render json: {}
  rescue StandardError => e
    render json: e
  end

  private

  def user_info
    @user = User.find_by(id: params[:user_id])
  end

  def product_info
    @product = @user.products.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price)
  end
end
