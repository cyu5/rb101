# @param {Float} principle
# @param {Float} rate
# @param {Integer} period
# @return {Float}
def calculate_payment(principle, rate, period)
	principle * (rate / (1 - (1 + rate)**(-period)))
end

# ask user inputs
print "Enter the loan amount: "
loan_amount = gets.chomp.to_f
print "Enter the loan term in months: "
term_in_months = gets.chomp.to_i
print "Enter the APR: "
apr = gets.chomp.to_f

# calculate results
monthly_rate = apr.fdiv(12)
num_of_payments = term_in_months
monthly_payment = calculate_payment(loan_amount, monthly_rate, term_in_months)

# print results
puts "------------Results------------"
puts "monthly payment: #{monthly_payment}"
puts "total of #{num_of_payments} payments"
puts "monthly interest rate: #{monthly_rate}"








