require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'product'

describe Product do
  it 'should create product given valid attributes' do
    attrs = { :name => 'name', :code => 'code', :price => 3.11 }
    product = nil

    lambda { product = Product.new attrs }.should_not raise_error

    product.name.should == 'name'
    product.code.should == 'code'
    product.price.should == 3.11
  end
end
