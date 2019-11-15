class Admin::DashboardController < Admin::AdminBaseController
  def show
    @product_count = Product.count(:id)
    @categories_count = Category.count(:id)
    @sales_count = Sale.count(:id)
  end
end
