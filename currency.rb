class Fixnum
  CURRENCIES = {
      euro: 0.7,
      rouble: 56
  }

  def method_missing(method_name, *args)
    currency = method_name.to_s.gsub(/s\z/, '').to_sym
    if CURRENCIES.has_key?(currency)
      self * CURRENCIES[currency]
    else
      super method_name, args
    end
  end
end

puts 10.euros
puts 20.roubles