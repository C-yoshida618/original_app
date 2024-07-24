module Admin
  class ProductsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @products = Product.all
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to admin_products_path, notice: 'Product was successfully created.'
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
        redirect_to admin_products_path, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to admin_products_path, notice: 'Product was successfully destroyed.'
    end

    private

    def product_params
      params.require(:product).permit(:product_name, :description, :price, :user_id)
    end

    def authorize_admin
      redirect_to root_path, alert: 'Not authorized.' unless current_user.admin?
    end
  end
end
