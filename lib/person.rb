require 'pry'

class Person
#The person class should store a person's cash level, 
#which banks they have an account with,
# and their balances at each bank.

#banks
#bank_balance

  attr_reader :name
  attr_accessor :cash_level, :accounts


  def initialize(name, cash_level)
    @name = name
    @cash_level = cash_level
    @accounts = {"Bank" => 0}
    "#{name} has been created with #{cash_level} galleons in cash."
  end


  def balance(bank)
    # binding.pry
    if accounts[bank] == nil
      accounts[bank.name]
    else
      accounts[bank]
    end
  end
end


minerva = Person.new("Minerva", 1000)


luna = Person.new("Luna", 500)


#  binding.pry

""