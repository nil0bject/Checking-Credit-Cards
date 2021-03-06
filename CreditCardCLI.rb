# Command line app which asks for credit card numbers and returns information on their validity

# requires the CreditCard class
require_relative 'CreditCard'

# take user input. one credit card number per line. finished by entering a blank line
puts "enter the credit card numbers(enter empty value when finished)".capitalize
cards = []
input = gets
while input != "\n"
  input.chomp!
  card = CreditCard.new(input)
  cards << card
  input = gets
end
for card in cards
# print validity details of the card to console, adding required formatting
  card_details = "#{card.company}: #{card.number}"
  output = "#{card_details}#{' '*(29-card_details.length)}(#{card.is_valid? ? 'valid' : 'invalid'})"
  puts output
end
