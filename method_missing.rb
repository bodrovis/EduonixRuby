class Converter
  CURRENCIES = {
      euro: 0.7,
      rouble: 56
  }
  def initialize(amount)
    @amount = amount
  end

  def method_missing(method_name, *args)
    currency = method_name.to_s.gsub(/s\z/, '').to_sym
    if CURRENCIES.has_key?(currency)
      @amount * CURRENCIES[currency]
    else
      super method_name, args
    end
  end
end

converter = Converter.new(10) # dollars
puts converter.euros
puts converter.roubles
