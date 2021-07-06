require_relative 'autoload'

goods1 = Array.new(5) { |_i| Product.new(FFaker::Product.brand, rand(1..100)) }
goods2 = goods1.map { |good| Product.new(good.name, rand(1..100)) }
goods3 = goods1.map { |good| Product.new(good.name, rand(1..100)) }

town1 = Town.new(FFaker::Address.city, goods1)
town2 = Town.new(FFaker::Address.city, goods2)
town3 = Town.new(FFaker::Address.city, goods3)

trader = Trader.new(50)

towns = [town1, town2, town3]
puts I18n.t('main.towns')
towns.each do |town|
  puts " #{town.name}:"
  town.goods.each { |good| puts "   #{good}" }
end
puts I18n.t('main.initial', budget: trader.budget)
towns.each_with_index do |town, index|
  trade_helper = TradeHelper.new(town, trader)
  if index == towns.size - 1
    trade_helper.sell
  else
    trade_helper.call
  end
end
puts I18n.t('main.final', budget: trader.budget)
