require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'pricing_rules'
require 'price_rule/bogof'
require 'price_rule/bulk_discount'

describe PricingRules do
  before do
    @args = [PriceRule::Bogof.new('CF1'), PriceRule::BulkDiscount.new('SR1', :by => 0.50, :after => 2)]
  end
  it 'should create array of price rules given correct arguments' do
    pricing_rules = nil
    lambda { pricing_rules = PricingRules.new(*@args) }.should_not raise_error

    pricing_rules.should be_a_kind_of(Array)
  end

  it 'should not allow more than one rule for the same product' # TODO clarify with business people

  it 'should be able to calculate total discount' do
    prules = PricingRules.new(*@args)
    basket = {'CF1' => 3, 'SR1' => 3, 'FR1' => 1}

    prules.calculate_total_discount(basket).should == (11.23 + 1.50)
  end
end
