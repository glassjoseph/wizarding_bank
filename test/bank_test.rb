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
    # binding.pry
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    new_account = chase.open_account(person1)
    message = chase.deposit(person1, 750)

    assert_equal "750 galleons have been deposited into Minerva's account. Balance: 750 Cash: 250", message 
    assert_equal 750, person1.balance(chase)
    assert_equal 250, person1.cash_level
  end

  def test_cant_deposit_if_you_dont_got_it
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 10)
    new_account = chase.open_account(person1)
    message = chase.deposit(person1, 750)

    assert_equal "Insufficient funds.", message 
    assert_equal 0, person1.balance(chase)
    assert_equal 10, person1.cash_level
  end


  def test_you_can_withdraw
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    new_account = chase.open_account(person1)
    chase.deposit(person1, 750)
    message = chase.withdraw(person1, 700)

    assert_equal "700 galleons have been withdrawn from Minerva's account. Balance: 50 Cash: 950", message 
    assert_equal 50, person1.balance(chase)
    assert_equal 950, person1.cash_level
  end
  
  def test_cant_withdraw_if_you_dont_got_it
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    new_account = chase.open_account(person1)
    message = chase.withdraw(person1, 750)

    assert_equal "Insufficient funds.", message 
    assert_equal 0, person1.balance(chase)
    assert_equal 1000, person1.cash_level
  end
  
  def test_can_transfer_to_other_banks
    chase = Bank.new("JP Morgan Chase")
    bbt = Bank.new("BBT")
    person1 = Person.new("Minerva", 1000)
    chase.open_account(person1)
    bbt.open_account(person1)
    chase.deposit(person1, 750)
    message = chase.transfer(person1, bbt, 700)

    assert_equal "Minerva has transferred 700 galleons from JP Morgan Chase to BBT.", message 
    assert_equal 50, person1.balance(chase)
    assert_equal 250, person1.cash_level
  end

  def test_cant_transfer_if_you_dont_got_it
    chase = Bank.new("JP Morgan Chase")
    bbt = Bank.new("BBT")
    person1 = Person.new("Minerva", 1000)
    chase.open_account(person1)
    bbt.open_account(person1)
    chase.deposit(person1, 750)
    message = chase.transfer(person1, bbt, 100000000)

    assert_equal "Insufficient funds.", message 
    assert_equal 750, person1.balance(chase)
    assert_equal 250, person1.cash_level
  end


  def test_cant_transfer_to_nonexistant_account
    chase = Bank.new("JP Morgan Chase")
    bbt = Bank.new("BBT")
    person1 = Person.new("Minerva", 1000)
    chase.open_account(person1)
    chase.deposit(person1, 750)
    message = chase.transfer(person1, bbt, 750)

    assert_equal "Minerva does not have an account at BBT", message 
    assert_equal 750, person1.balance(chase)
    assert_equal 250, person1.cash_level
  end

  def test_banks_can_give_total_cash
    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    person2 = Person.new("Luna", 1000)
    chase.open_account(person1)
    chase.deposit(person1, 750)
    chase.open_account(person2)
    chase.deposit(person2, 750)
    total = chase.show_total_cash
    assert_equal "Total: 1500", total
  end

end



    chase = Bank.new("JP Morgan Chase")
    person1 = Person.new("Minerva", 1000)
    new_account = chase.open_account(person1)
    message = chase.deposit(person1, 750)

# binding.pry
""