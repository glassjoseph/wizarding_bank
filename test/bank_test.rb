require "minitest"
require "minitest/autorun" 
require "minitest/pride"
require "./lib/bank"
require 'pry'

class BankTest < Minitest::Test

  def test_bank_exists
    chase = Bank.new("JP Morgan Chase")
    assert chase
  end


  def test_it_makes_accounts
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    
    #Why can't I put person1 as argument to chase.open_account?
    ## b/c it's an object? b/c it doesn't pass its instance variables?
    ## can you take a class object as an argument? or only variables?
    ## A: you can, I don't know what the weird arg number error I was getting was about...
   
    ### TDD really is making me think in-depth about the inputs, outputs
    ### and to focus on the immediate problem
    ## Heh, the cheat-it till you force yourself to refactor works. 


    new_account = chase.open_account(person1)
    #is this the right thing to assert?
    assert_equal new_account, "An account has been opened for Minerva with JP Morgan Chase."
  end


  def test_you_can_deposit
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    message = chase.deposit(person1, 750)

    assert_equal "750 galleons have been deposited into Minerva's Chase account. Balance: 750 Cash: 250", message 
    assert_equal bank.balance
    assert_equal 250, person1.cash_level
  end
end