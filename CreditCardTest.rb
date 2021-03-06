# requires the CreditCard and unit test classes 
require_relative "CreditCard"
require "test/unit"
 
class CreditCardTest < Test::Unit::TestCase
 
  def cards
  # array of supplied test data
    [
      {
        number: 4111111111111111,
        company: "VISA",
        valid: true
      }, 
      {
        number: 4111111111111,
        company: "VISA",
        valid: false
      },
      {
        number: 4012888888881881,
        company: "VISA",
        valid: true
      }, 
      {
        number: 378282246310005,
        company: "AMEX",
        valid: true
      }, 
      {
        number: 6011111111111117,
        company: "Discover",
        valid: true
      }, 
      {
        number: 5105105105105100,
        company: "Mastercard",
        valid: true
      }, 
      {
        number: "5105 1051 0510 5106",
        company: "Mastercard",
        valid: false
      }, 
      {
        number: 9111111111111111,
        company: "Unknown",
        valid: false
      }
    ]
  end

  def test_numbers
  # test each element of the test data array, to verify expected results
    cards.each do |card|
      creditcard = CreditCard.new(card[:number])
      assert_equal(card[:valid], creditcard.is_valid?, "[#{card[:number]}] validity not #{card[:valid]}" )
      assert_equal(card[:company], creditcard.company, "[#{card[:number]}] #{card[:company]} equals #{creditcard.company}")
    end
  end
 
end
