class Admin::DashboardController < ApplicationController
  def show
    @product_count = Product.count(:id)
    @categories_count = Category.count(:id)
  end
end
