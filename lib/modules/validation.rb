module Validation
  include Errors

  def product_price_validate!(price, budget)
    raise TooExpensiveError if price > budget
  end

  def capacity_validate!(capacity, size)
    raise CapacityError if capacity == size
  end
end
