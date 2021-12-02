
print "Enter the loan amount: "
principle = gets.chomp.to_f
print "Enter the loan term in months: "
months = gets.chomp.to_i
print "Enter the APR: "
apr = gets.chomp.to_i

# some calculation

puts "------------Results------------"
puts "monthly payment: #{monthly_payment}"
puts "total of #{num_of_payments} payments"
puts "monthly interest rate: #{monthly_interest_rate}"
puts "total interest: #{total_interest}"








