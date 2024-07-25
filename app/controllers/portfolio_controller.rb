class PortfolioController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  load_and_authorize_resource # CanCanCanによる権限管理
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end
end