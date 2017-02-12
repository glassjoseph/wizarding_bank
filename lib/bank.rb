require './lib/person'

class Bank
  attr_reader :name
  attr_accessor :balance, :total_cash

  def initialize(name)
    @name = name
    @total_cash = 0 
    "Bank #{name} has been created."

  end

### AAaahhh!! You pass in the person, but call the methods on them!!
  def open_account(person)
    person.accounts[name] = 0
    "An account has been opened for #{person.name} with #{name}."
  end

  def deposit(person, amount)
    if person.cash_level < amount
      return "Insufficient funds."
    end
    
    person.cash_level -= amount
    person.accounts[name] += amount
    @total_cash += amount
    "#{amount} galleons have been deposited into #{person.name}'s account. Balance: 750 Cash: #{person.cash_level}"
  end



  def withdraw(person, amount)
    # binding.pry
    if amount > person.balance(name)
      return "Insufficient funds."
    end
    
    person.cash_level += amount
    person.accounts[name] -= amount
    @total_cash -= amount
    "#{amount} galleons have been withdrawn from #{person.name}'s account. Balance: #{person.balance(name)} Cash: #{person.cash_level}"
  end

  def transfer(person, bank, amount)
    if person.accounts[bank.name] == nil
      return "#{person.name} does not have an account at #{bank.name}"
    end
    if amount > person.balance(name)
      return "Insufficient funds."
    end
    withdraw(person, amount)
    bank.deposit(person, amount)
    "#{person.name} has transferred #{amount} galleons from JP Morgan Chase to #{bank.name}."
  end

# Why do you get such an error when you call the method *.total_cash?
## Is it because total_cash creates confusion and a recursive loop with the attr_accessor of the same name?
  def show_total_cash
    "Total: #{total_cash}"
  end

end