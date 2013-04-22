module CreditCardValidator
# module of helper functions for determining the validation of credit card numbers
  def card_patterns
  # block array of credit card companies and their validations
    [
      {
        company: 'AMEX',
        begins: /^3[47]/,
        length: [15]
      },
      {
        company: 'Discover',
        begins: /^6011/,
        length: [16]
      },
      {
        company: 'Mastercard',
        begins: /^5[1-5]/,
        length: [16]
      },
      {
        company: 'VISA',
        begins: /^4/,
        length: [13, 16]
      }
    ]
  end

  def company
  # iterates the card_patterns to determine which company issued the credit card
    card_patterns.each do |pattern|
      return pattern[:company] if (self.match(pattern[:begins]) && pattern[:length].include?(self.length))
    end
  # return 'Unknown' if no company matches any pattern
    return 'Unknown'
  end

  def luhn_validated?
  # determine the validity of the credit card number based upon the Luhn algorithm
    count = 0
    self.reverse.split("").each_slice(2) do |a,b|
      count += a.to_i+((b.to_i*2)%9)
    end
  # return whether the result of the algorithm is a modulus of 10
    return count%10 == 0 ? true :false
  end
end

class String
# allow strings to use the functions in this module
  include CreditCardValidator
end
