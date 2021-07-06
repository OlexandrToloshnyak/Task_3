module Errors
  class TooExpensiveError < StandardError
    def initialize
      super(I18n.t('errors.too_expensive'))
    end
  end

  class CapacityError < StandardError
    def initialize
      super(I18n.t('errors.capacity'))
    end
  end
end
