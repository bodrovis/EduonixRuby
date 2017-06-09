class Converter
  def initialize(amount)
    @amount = amount
  end

  def self.support_currencies(currencies)
    currencies.each do |currency, rate|
      define_method currency do |arg = 'default value'|
        puts arg
        @amount * rate
      end
    end
  end
end

Converter.support_currencies({euros: 0.7,
                              roubles: 56})

converter = Converter.new(10) # dollars
puts converter.euros('test')
puts converter.roubles