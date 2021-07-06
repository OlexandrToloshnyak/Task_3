class TradeHelper
  include Outputs
  attr_reader :town, :trader

  def initialize(town, trader)
    @town = town
    @trader = trader
  end

  def call
    sell if trader.profit?(town.goods)
    buy if trader.can_buy?(product_to_buy)
  end

  def sell
    product = product_to_sell
    trader.sell_product(product)
    sell_message(product.name, product.price, town.name, trader.budget)
  end

  def buy
    trader.buy_product(product_to_buy)
    buy_message(product_to_buy.name, product_to_buy.price, town.name, trader.budget)
  end

  private

  def product_to_buy
    town.goods.min_by(&:price)
  end

  def product_to_sell
    town.goods.find { |good| good.name == trader.goods.first.name } if trader.goods.any?
  end
end
