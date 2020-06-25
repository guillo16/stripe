class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :photo, :category_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
