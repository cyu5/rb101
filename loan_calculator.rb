
# @param {Float} amount
# @param {Float} percent_rate
# @param {Integer} months
# @return {Float}
def calculate_monthly_payment(amount, percent_rate, months)
	rate = percent_rate.fdiv(100)
	payment = amount * (rate / (1 - (1 + rate)**(-months)))
	payment.truncate(2)
end

# @param {String} prompt
# @return {String}
def asks(prompt)
	print prompt
	gets.chomp
end

# @param {String} prompt
# @param {Method} processor
# @param {String} retry_msg
# @return {Object} 
def insists(prompt, processor, retry_msg)
	loop do
		raw_input = asks prompt
		result = processor.call raw_input
		break result unless result == nil
		puts retry_msg
	end
end

# @param {String} input_str
# @return {Float | nil}
def to_loan_amount(input_str)
	float = input_str.to_f
	float.truncate(2)
	float.positive? ? float : nil
end

# @param {String} input_str
# @return {Integer | nil}
def to_term_in_months(input_str)
	int = input_str.to_i
	int.positive? ? int : nil
end

# @param {String} input_str
# @return {Float | nil}
def to_apr(input_str)
	percent = input_str.to_f
	percent.positive? ? percent : nil
end

# ask user inputs
loan_amount = insists "Enter the loan amount: ", method(:to_loan_amount), "Invalid input! Please enter a positive loan amount."
term_in_months = insists "Enter the loan term(in months): ", method(:to_term_in_months), "Invalid input! Please enter a positive integer loan term(in months)."
apr = insists "Enter the APR: ", method(:to_apr), "Invalid input! Please enter a positive apr."

# calculate results
monthly_rate = apr.fdiv(12)
monthly_payment = calculate_monthly_payment(loan_amount, monthly_rate, term_in_months)
total_payments = monthly_payment * term_in_months
total_interest = total_payments - loan_amount

# print results
puts "------------Results------------"
puts "monthly payment: $#{monthly_payment}"
puts "monthly interest rate: #{monthly_rate}%"  # could be a long floating point, need formating
puts "number of payments: #{term_in_months}"
puts "total of payments: #{total_payments}"
puts "total interest: #{total_interest}"









