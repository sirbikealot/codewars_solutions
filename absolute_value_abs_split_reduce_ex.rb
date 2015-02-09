# absolute_value_abs_split_reduce_ex.rb

=begin

Write a function named sumDigits which takes a number as input and returns the sum of the absolute value of each of the number's decimal digits. For example:

  sumDigits 10    # Returns 1
  sumDigits 99    # Returns 18
  sumDigits -32   # Returns 5
Let's assume that all numbers in the input will be integer values.

=end

def sumDigits(n)
	n.abs.to_s.split(//).map(&:to_i).reduce(:+)
end
	
