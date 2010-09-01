class Checkout
  attr_accessor :pricing_rules

  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @basket = []
  end

  def scan(product)
    @basket << product
  end

  def total
    @pricing_rules.calculate_total_price(@basket)
  end
end
