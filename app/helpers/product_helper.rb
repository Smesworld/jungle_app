module ProductHelper
  def product_available?(product)
    product.quantity > 0 ? true : false
  end
end