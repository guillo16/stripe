class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @product = Product.all
    @categories = Category.all
    if params['color']
      @products = Product.where(color: params['color'])
    else
      @products = Product.all
    end
  end

  def show
    @products = Product.all
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
    params.require(:product).permit(:title, :description, :photo, :stock, :color, :subtitle, :price, :category_id)
  end

  def set_product
    @product = Product.friendly.find(params[:id])
  end
end
