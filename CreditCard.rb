#requires the CreditCardValidator module
require_relative 'CreditCardValidator'

class CreditCard
# class to store credit card numbers and helper/accessor methods
  attr_accessor :number
  
  def initialize(number)
  # remove white space and store the credit card number
    @number = number.to_s.gsub(/\s/,'')
  end

  def is_valid?
  # return true if the credit card number is from a known company and can be validated with the Luhn algorithm
    @number.company && @number.luhn_validated?
  end

  def company
  # return the company the credit card is issued by. 'Unknown' if none found
    @number.company
  end
end
