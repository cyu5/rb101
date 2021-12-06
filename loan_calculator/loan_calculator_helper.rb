require "yaml"

def init_message_constants()

	# extract program messages as constants at runtime
	YAML.load_file("loan_calculator_msg.yml").each_pair do |key, value|
		Object.const_set(key.to_s.upcase, value)
	end

	# explicit return nil
	nil
end

# @param {Float} amount
# @param {Float} percent_rate
# @param {Integer} months
# @return {Float}
def calculate_monthly_payment(amount, percent_rate, months)
	rate = percent_rate.fdiv(100)
	payment = amount * (rate / (1 - (1 + rate)**(-months)))
end

# @param {String} prompt
# @return {String}
def asks(prompt="")
	print prompt
	gets.chomp
end

# @param {String} prompt
# @param {Symbol} processor
# @param {String} retry_msg
# @return {not nil} 
def insists(prompt, parser, retry_msg)
	loop do
		raw_input = asks prompt
		result = send(parser, raw_input)
		break result unless result == nil
		puts retry_msg
	end
end

# @param {String} input_str
# @return {Float, nil}
def to_loan_amount(input_str)
	float = input_str.to_f
	float.truncate(2)
	float.positive? ? float : nil
end

# @param {String} input_str
# @return {Integer, nil}
def to_term_in_months(input_str)
	int = input_str.to_i
	int.positive? ? int : nil
end

# @param {String} input_str
# @return {Float, nil}
def to_apr(input_str)
	percent = input_str.to_f
	percent.positive? ? percent : nil
end

# @param {Float} float
# @return {String}
def dollar_format(float)
	"$#{format('%.2f', float)}"
end

# @param {Float} percent
# @return {String}
def percentage_format(percent)
	"#{format('%.2g', percent)}%"
end

# @return {Boolean}
def start_over?()
	answer = asks(START_OVER).downcase
	answer == 'y' or answer == 'yes'
end