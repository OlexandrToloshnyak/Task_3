class Trader
  include Validation

  CAPACITY = 1

  attr_reader :budget

  def initialize(budget)
    @budget = budget
  end

  def buy_product(product)
    capacity_validate!(CAPACITY, goods.size)
    product_price_validate!(product.price, budget)
    (@goods ||= []) << product
    @budget -= product.price
  end

  def sell_product(town_product)
    product = @goods.reject! { |good| good.name == town_product.name }
    @budget += town_product.price if product
  end

  def profit?(town_goods)
    trader_good = goods.first
    return false unless trader_good

    town_good = town_goods.find { |good| good.name == trader_good.name }
    trader_good.price < town_good.price if town_good
  end

  def can_buy?(product)
    capacity_validate!(CAPACITY, goods.size)
    product_price_validate!(product.price, budget)
    true
  rescue TooExpensiveError, CapacityError
    false
  end

  def goods
    @goods || []
  end
end
