require_relative "loan_calculator_helper"

init_message_constants()

# main loop
loop do

	# start of interactive mode
	puts WELCOME

	# asks for user inputs
	loan_amount = 
		insists ENTER_AMOUNT, :to_loan_amount, INVALID_AMOUNT
	term_in_months = 
		insists ENTER_MONTHS, :to_term_in_months, INVALID_MONTHS
	apr = 
		insists ENTER_APR, :to_apr, INVALID_APR

	# calculate results
	monthly_rate = 
		apr.fdiv(12)
	monthly_payment = 
		calculate_monthly_payment(loan_amount, monthly_rate, term_in_months)
	total_payments = 
		monthly_payment * term_in_months
	total_interest = 
		total_payments - loan_amount

	# print results
	puts RESULTS
	shows monthly_payment, MONTHLY_PAYMENT  # need formating to 2 decimal and a leading $ sign
	shows	monthly_rate, MONTHLY_RATE  # need formating to 3 significant digits and trailing % sign
	shows term_in_months, NUM_PAYMENTS
	shows total_payments, TOTAL_PAYMENTS  # need formating to 2 decimal and a leading $ sign
	shows total_interest, TOTAL_INTEREST  # need formating to 2 decimal and a leading $ sign

	# terminate if user doesn't input y or yes
	break puts(GOODBYE) unless start_over?()
end