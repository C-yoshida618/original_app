class ProductsController < ApplicationController
  #before_action :authenticate_user! これを記述するとTOPに飛ばなくなる
  load_and_authorize_resource
  before_action :move_to_order, only: [:new]

  def index
    @products = Product.includes(:user).order('created_at DESC')
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end
  

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :description, :price, 
     :shipping_cost_id, :image_url)


  end

  def move_to_order
    if @product.order.present?
      redirect_to root_path
    end
  end
end
