module SalesHelper
  def get_discount
    discount = active_sale?

    discount ? discount : 1
  end

  def apply_discount(product, discount)
    puts "VALUE #{product.price_cents}, DISCOUNT #{discount}"
    product.price_cents = product.price_cents * discount
    puts "VALUE #{product.price_cents}"
    product
  end

  def active_sale?
    active = Sale.active.any?

    if active
      @sale = Sale.percent_off[0]
      @discount = (100.0 - @sale.percent_off) / 100
    end
  end
end