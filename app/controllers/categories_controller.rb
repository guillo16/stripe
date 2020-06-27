class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show
    @categories = Category.all
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
    @category.update(category_params)
    redirect_to category_path(@category)
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:title, :photo, :photo_secondary)
  end

  def set_category
    @category = Category.friendly.find(params[:id])
  end
end
