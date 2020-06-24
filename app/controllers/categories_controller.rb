class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    if params['color']
      @products = Product.where(color: params["color"])
    else
      @products
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
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

  def category_params
    params.require(:category).permit(:title, :photo)
  end
end
