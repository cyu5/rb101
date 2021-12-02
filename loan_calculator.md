input:
  amount - number
  APR - percentage per year
  duration - number of year

output:
  monthly interest rate - percentage per month
  monthly duration - number of months
  monthly payment - number per month

example:
  amount = 1000
  APR = 5%
  dur = 1 yr

Sub-programs:
  1. formula for monthly payment, given amount, interest rate, and duration
  2. convert APR to monthly rate, 
  3. convert duration to monthly duration

problem domain - finance:
  1. APR to monthly -> APR / 12 = monthly
  2. duration -> take months directly for starters

program:
  ask user
    principle amount
    APR
    duration in months

  calculate
    monthly rate 
    .then monthly payment
  
  print
    monthly payment
    monthly interest rate 
    total num of payments
    total interest 

input - validation, convertion, and cleaning:
  amount
    str to int or float 
    validate positive real number
    if float, cut off everything after first two decimals
  duration
    str to int 
    validate pos Integer
  apr
    str to Integer
    validate percentage(0..100)

edge cases:
  amount
    non digits except - and .  
    negative
    more than one .
    - not in leading 
    leading or ending with .
    only .
    leading zeros
    zero or large
  duration
    non digits
    leading Zeros 
    0 or large number
  APR
    non digits
    leading zeros 
    0 or large number


bonus features:
  typing
  allow for years and months to be enter for duration
  improve input validation to be more robost
  add configuration file for program messages


Packaging work
  make calculator into a package
  use command line argument for inputs
  add unit test
  add readme File
  runs the script if used as main program 