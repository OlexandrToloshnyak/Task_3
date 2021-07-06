class Town
  attr_reader :name, :goods

  def initialize(name, goods = [])
    @name = name
    @goods = goods
  end

  def get_product(name)
    product.find { |good| good.name == name }
  end
end
