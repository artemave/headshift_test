require 'product'

module PriceRule
  class BulkDiscount
    def initialize(product_code, opts = {})
      @product = Product.find(product_code) or raise "Can't find product #{product_code}"
      @by, @after = opts.values_at(:by, :after)
    end

    def calculate_discount(basket)
      if basket[@product.code] > @after
        basket[@product.code] * @by
      else
        0
      end
    end
  end
end

