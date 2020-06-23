class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

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
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :photo, :category_id)
  end

end
