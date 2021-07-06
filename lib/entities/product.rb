class Product
  attr_reader :name
  attr_accessor :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    I18n.t('product.full_name', name: name, price: price)
  end
end
