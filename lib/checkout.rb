class Checkout
  attr_accessor :pricing_rules

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @basket = Hash.new {|h,k| h[k] = 0}
  end

  def scan(product_code)
    @basket[product_code] += 1
  end

  def total
    busket_price - @pricing_rules.calculate_total_discount(@basket)
  end

  private

  def busket_price
    busket_price = 0

    @basket.each_pair do |prod_code, quantity|
      prod = Product.find(prod_code) or next
      busket_price += prod.price * quantity
    end

    busket_price
  end
end
