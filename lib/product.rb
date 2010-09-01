class Product
  attr_accessor :code, :name, :price

  @@products = nil

  def self.find(code)
    unless @@products
      @@products = []
      PRODUCTS.each do |p|
        @@products << new(:code => p[:code], :name => p[:name], :price => p[:price])
      end
    end

    @@products.find {|p| p.code == code}
  end

  private

  def initialize(args)
    @code, @name, @price = args.values_at(:code, :name, :price)
  end

  PRODUCTS = [
    {:name => 'Coffee', :code => 'CF1', :price => 11.23},
    {:name => 'Strawberries', :code => 'SR1', :price => 5.0},
    {:name => 'Fruit tea', :code => 'FR1', :price => 3.11}
  ]
end
