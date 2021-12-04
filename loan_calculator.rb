require_relative "loan_calculator_init"

init_message_constants()

# main loop
loop do

	# start of interactive mode
	puts "------------Welcome------------"

	# asks for user inputs
	loan_amount = 
		insists "Enter the loan amount: ", :to_loan_amount, "Invalid input! Please enter a positive loan amount."
	term_in_months = 
		insists "Enter the loan term(in months): ", :to_term_in_months, "Invalid input! Please enter a positive integer loan term(in months)."
	apr = 
		insists "Enter the APR: ", :to_apr, "Invalid input! Please enter a positive apr."

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

	# terminate if user doesn't input y or yes
	break puts(GOODBYE) unless start_over?()
end