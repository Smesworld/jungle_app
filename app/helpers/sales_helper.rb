module SalesHelper
  def active_sale?
    active = Sale.active.any?

    if active
      @sale = Sale.percent_off[0]
      @discount = (100.0 - @sale.percent_off) / 100
    end
  end
end