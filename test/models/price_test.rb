require 'test_helper'

class PriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @stock = stocks(:aapl)
    @price = Price.new(price: "165.72", ticker_id: @stock.ticker)
  end

  test "should be valid" do
    assert @price.valid?
  end

  test "ticker id should be present" do
    @price.ticker_id = nil
    assert_not @price.valid?
  end
end
