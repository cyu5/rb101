require_relative "loan_calculator_helper"

init_message_constants()

# main program loop
loop do

	# start of interactive mode
	system('clear') or system('cls')
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
	puts "#{MONTHLY_PAYMENT.ljust(25)}#{dollar_format(monthly_payment)}"  # need formating to 2 decimal and a leading $ sign
	puts "#{MONTHLY_RATE.ljust(25)}#{percentage_format(monthly_rate)}" # need formating to 3 significant digits and trailing % sign
	puts "#{NUM_PAYMENTS.ljust(25)}#{term_in_months}"
	puts "#{TOTAL_PAYMENTS.ljust(25)}#{dollar_format(total_payments)}"  # need formating to 2 decimal and a leading $ sign
	puts "#{TOTAL_INTEREST.ljust(25)}#{dollar_format(total_interest)}"  # need formating to 2 decimal and a leading $ sign

	# exit program if user doesn't input y or yes
	break puts(GOODBYE) unless start_over?()
end

# TODOS:
# allow user to enter loan term in year, follow by month, then convert to months only
# take command line arguments (e.g. USAGE: loan_calculator [amount] [duration] [apr])
# colorize message strings. For example, use yellow for prompt, red for invalid input, and green for showing results

# research questions:
# Does system() work by sending command to the parent shell(zsh on my local machine), or by opening a separate shell and run it? How does it decide which shell to use if there are more than one?
# What is the most idomatic way to pass a method around as an argument to other methods in ruby, given the scope of this project?
# is it a good practice to create constants from config files at runtime?
# what is the best data structure for handling money in ruby? Integer, Float, or Rational? How to deal with digits that comes after two decimal points(amount smaller than a penny)? When to keep those digits and when to chop them off?