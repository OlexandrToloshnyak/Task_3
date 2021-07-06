module Outputs
  def sell_message(product_name, product_price, town_name, budget)
    puts I18n.t('messages.sell_good', product_name: product_name, product_price: product_price, town: town_name,
                                      budget: budget)
  end

  def buy_message(product_name, product_price, town_name, budget)
    puts I18n.t('messages.buy_good', product_name: product_name, product_price: product_price, town: town_name,
                                     budget: budget)
  end
end
