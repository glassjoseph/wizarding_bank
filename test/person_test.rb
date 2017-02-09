require "minitest"
require "minitest/autorun" 
require "minitest/pride"
require "./lib/person"

class PersonTest < Minitest::Test

  def test_person_exists
    person1 = Person.new("Minerva", 1000)
    assert person1
  end

end