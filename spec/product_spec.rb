require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'product'

describe Product do
  attrs = { :name => 'name', :code => 'code', :price => 3.11 }

  before do
    @product = Product.new(attrs)
  end

  attrs.each_pair do |attr, val|
    it "should have product #{attr}" do
      @product.send(attr.to_sym).should == val
    end
  end
end
