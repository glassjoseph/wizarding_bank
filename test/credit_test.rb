require "minitest"
require "minitest/autorun" 
require "minitest/pride"
require "./lib/credit"
require 'pry'

class CreditTest < Minitest::Test

  def test_credit_exists
    mastercard = Credit.new("Mastercard")
    assert mastercard
  end


  def test_it_makes_accounts
    mastercard= Credit.new("Mastercard")
    person1 = Person.new("Minerva", 1000)

    new_account = mastercard.open_account(person1, 100, 0.05)
    assert_equal new_account, "An account has been opened for Minerva with Mastercard."
  end

  def test_people_can_spend
    mastercard= Credit.new("Mastercard")
    person1 = Person.new("Minerva", 1000)
    new_account = mastercard.open_account(person1, 100, 0.05)
    spent = mastercard.spend(person1, 50)
    assert_equal "50 galleons have been spent from Minerva's account. Balance: 50 Cash: 1000", spent
  end


 def test_cant_spend_if_you_dont_got_it
    mastercard= Credit.new("Mastercard")
    person1 = Person.new("Minerva", 1000)
    new_account = mastercard.open_account(person1, 100, 0.05)
    spent = mastercard.spend(person1, 500)
    assert_equal "Insufficient funds.", spent 
  end

  def test_can_pay_down
    mastercard= Credit.new("Mastercard")
    person1 = Person.new("Minerva", 1000)
    new_account = mastercard.open_account(person1, 100, 0.05)
    spent = mastercard.spend(person1, 50)
    payment = mastercard.pay_down(person1, 25)
    assert_equal "50 galleons have been spent from Minerva's account. Balance: 50 Cash: 1000", payment
  end


end