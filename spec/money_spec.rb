require 'spec_helper'
require_relative '../lib/money'

describe "Currency Convertion Library" do 

  Money.conversion_rates('EUR', {
    'USD'     => 1.11,
    'Bitcoin' => 0.0047
  })

  let(:fifty_eur) {  Money.new(50, 'EUR') }
  let(:twenty_dollars) { Money.new(20, 'USD') }

  it "amount and currency properties are readable" do 
    expect(fifty_eur.amount).to eq(50)
    expect(fifty_eur.currency).to eq('EUR')
  end

  it "arithmetics can be performed" do 
    result = fifty_eur + twenty_dollars 
    expect(result.amount).to eq(68.02)
    result = fifty_eur - twenty_dollars 
    expect(result.amount).to eq(31.98)
    result = fifty_eur / 2
    expect(result.amount).to eq(25)
    result = twenty_dollars * 3
    expect(result.amount).to eq(60)
  end

  it "comparisons can be performed" do 
    expect(twenty_dollars).to eq(Money.new(20, 'USD')) 
    expect(twenty_dollars).not_to eq(Money.new(30, 'USD')) 
    
    fifty_eur_in_usd = fifty_eur.convert_to('USD')
    expect(fifty_eur_in_usd).to eq(fifty_eur)

    expect(twenty_dollars).not_to eq(Money.new(5, 'USD'))
    expect(twenty_dollars).not_to eq(fifty_eur)
  end

end