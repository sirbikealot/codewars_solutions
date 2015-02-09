# multiples_of_3and5_range_select_modulus_reduce.rb

=begin

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Courtesy of ProjectEuler.net

=end

def solution(number)
  (1...number).select{|n| n % 3 == 0 || n % 5 == 0}.reduce(:+)
end

# My solution was nearly identical to the best practices:

def solution(number)
  (1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
end

