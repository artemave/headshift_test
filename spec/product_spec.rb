require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'product'

describe Product do
  it 'should be able to find existing product' do
    Product.find('CF1').should be_a_kind_of(Product)
    Product.find('Coffee5').should be nil
  end
end
