require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'price_rule/bulk_discount'

describe PriceRule::BulkDiscount do
  it 'should create an instance given valid attributes' do
    bulk_discount = nil
    lambda { bulk_discount = PriceRule::BulkDiscount.new 'CF1', :by => 0.50, :after => 2 }.should_not raise_error
  end

  it 'should calculate "by one get one free" discount for given product' do
    basket = {'CF1' => 3, 'SR1' => 2, 'FR1' => 1}
    bulk_discount = PriceRule::BulkDiscount.new 'CF1', :by => 0.50, :after => 2

    bulk_discount.calculate_discount(basket).should == 1.50
  end
end

