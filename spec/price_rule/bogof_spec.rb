require File.dirname(__FILE__).sub(/\/spec(\/.*|$)/, '') + '/spec/spec_helper.rb'

require 'price_rule/bogof'

describe PriceRule::Bogof do
  it 'should create an instance given valid attributes' do
    bogof = nil
    lambda { bogof = PriceRule::Bogof.new 'CF1' }.should_not raise_error
  end

  it 'should calculate "by one get one free" discount for given product' do
    basket = {'CF1' => 3, 'SR1' => 2, 'FR1' => 1}
    bogof = PriceRule::Bogof.new 'CF1'

    bogof.calculate_discount(basket).should == 11.23
  end
end
