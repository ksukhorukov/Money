class Money
  
  attr_accessor :amount, :currency

  def self.conversion_rates(base, rates)
    @@base = base
    @@rates = rates
  end

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def convert_to(currency)
     Money.new((@@rates[currency] * @amount).round(2), currency)
  end

  def +(other)
    if(other.currency == @currency)
      Money.new(@amount + other.amount, @currency)
    else
      converted = other.amount / @@rates[other.currency]
      result = (@amount + converted).round(2)
      Money.new(result, @currency)
    end
  end


  def -(other)
    if(other.currency == @currency)
      Money.new(@amount - other.amount, @currency)
    else
      converted = other.amount / @@rates[other.currency]
      result = (@amount - converted).round(2)
      Money.new(result, @currency)
    end
  end

  def /(other)
    result = (@amount / other).round(2)
    Money.new(result, @currency)
  end

  def *(other)
    result = (@amount * other).round(2)
    Money.new(result, @currency)
  end

  def ==(other)
    if(other.currency == @currency)
      @amount == other.amount
    else
      converted = other.amount * @@rates[@currency]
      @amount == converted.round(2)
    end    
  end

  def >(other)
    if(other.currency == @currency)
      @amount > other.amount
    else
      converted = other.amount * @@rates[@currency]
      @amount > converted
    end
  end

  def <(other)
    if(other.currency == @currency)
      @amount < other.amount
    else
      converted = other.amount * @@rates[@currency]
      @amount < converted
    end
  end

  def inspect
    @amount.to_s + " " + @currency
  end

end