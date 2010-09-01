require 'product'

module PriceRule
  class Bogof
    def initialize(product_code)
      @product = Product.find(product_code) or raise "Can't find product #{product_code}"
    end

    def calculate_discount(basket)
      basket[@product.code] / 2 * @product.price
    end
  end
end
