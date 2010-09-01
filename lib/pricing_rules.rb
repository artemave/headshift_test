class PricingRules < Array
  def initialize(*rules)
    super()
    rules.each {|r| push r}
  end

  def calculate_total_discount(basket)
    map{|rule| rule.calculate_discount(basket) }.reduce(:+)
  end
end
