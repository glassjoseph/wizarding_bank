require './lib/person'

class Bank
  attr_reader :name
  attr_accessor :balance

  def initialize(name)
    @name = name
    "Bank #{name} has been created."
    @balance = 0
  end

### AAaahhh!! You pass in the person, but call the methods on them!!
  def open_account(person)
    #how to set up a balance for the person?
    #this is one huge balance for all people. Refactor as a Person method.

    @balance = 0
    "An account has been opened for #{person.name} with #{name}."
  end

  def deposit(person, amount)
    person.cash_level -= amount
    #So, I have to initialize this before I use it... but should it be an attribute of person or bank? or of bank.person?
    @balance += amount
    "#{amount} galleons have been deposited into Minerva's Chase account. Balance: 750 Cash: #{person.cash_level}"
  end

end