require "./lib/person"
class Credit
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def open_account(person, credit_line, interest_rate)
    person.accounts[name] = [credit_line, interest_rate, 0]
    "An account has been opened for #{person.name} with #{name}."
  end

 


  def spend(person, amount)
    # binding.pry
    if amount > person.accounts[name][0]
      return "Insufficient funds."
    end
    person.accounts[name][0] -= amount
    person.accounts[name][2] += amount
    "#{amount} galleons have been spent from #{person.name}'s account. Balance: #{person.accounts[name][0]} Cash: #{person.cash_level}"
  end

  def pay_down(person, amount)
    if person.cash_level < amount
      return "Insufficient funds."
    end
    person.cash_level -= amount
    person.accounts[name][2] -= amount
    person.accounts[name][0] += amount
    "#{amount} galleons have been paid off from #{person.name}'s account. Balance owed: #{person.accounts[name][2]} Cash: #{person.cash_level}"

  end

end