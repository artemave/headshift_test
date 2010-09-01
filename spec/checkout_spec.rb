require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'checkout'
require 'pricing_rules'
require 'price_rule/bogof'
require 'price_rule/bulk_discount'

describe Checkout do
  before do
    @rules = PricingRules.new(PriceRule::Bogof.new('FR1'), PriceRule::BulkDiscount.new('SR1', :by => 0.50, :after => 2))
  end

  it 'should create checkout instance given valid attributes' do
    checkout = nil
    lambda { checkout = Checkout.new(@rules) }.should_not raise_error
  end

  it 'should be able to scan product' do
    checkout = Checkout.new @rules
    lambda { checkout.scan('CF1') }.should_not raise_error
  end

  it 'should be able to calculate total (1)' do
    checkout = Checkout.new @rules
    checkout.scan 'SR1'
    checkout.scan 'CF1'
    3.times { checkout.scan 'FR1' }

    checkout.total.should == 22.45
  end

  it 'should be able to calculate total (2)' do
    checkout = Checkout.new @rules
    2.times { checkout.scan 'FR1' }

    checkout.total.should == 3.11
  end

  it 'should be able to calculate total (3)' do
    checkout = Checkout.new @rules
    checkout.scan 'FR1'
    3.times { checkout.scan 'SR1' }

    checkout.total.should == 16.61
  end

end
