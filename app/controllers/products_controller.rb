class ProductsController < ApplicationController
  include SalesHelper

  def index
    @products = Product.all.order(created_at: :desc)
    discount = get_discount
    @products = @products.map {|product| apply_discount(product, discount)}
  end

  def show
    @product = Product.find params[:id]
  end

end
