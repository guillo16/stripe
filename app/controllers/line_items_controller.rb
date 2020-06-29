class LineItemsController < ApplicationController
  include CurrentCart
  skip_before_action :authenticate_user!, only: [:show, :create, :edit, :update]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  before_action :set_cart, only: [:create, :decrease, :increase]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    if @line_item.save
      redirect_to @line_item.cart, notice: 'Item added to cart.'
    else
      render 'product/show'
    end
  end
  def decrease
    @line_item = LineItem.find(params[:id])
    @line_item.decrement!(:quantity)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: '' }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def increase
    @line_item = LineItem.find(params[:id])
    @line_item.increment!(:quantity)
    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart, notice: 'update' }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @line_item.update(line_item_params)
    redirect_to @line_item.cart
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_path(@cart), notice: 'Item successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity)
  end
end
