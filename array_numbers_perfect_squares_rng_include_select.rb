# array_numbers_perfect_squares_rng_include_select.rb

=begin
Given an array of numbers return an array of numbers from the array that qualify as perfect squares. A perfect square is defined as a whole number that, when square rooted, is a whole number. (Such as 1, 4, 9, 16, etc, etc.)

Note: Return only one copy of each perfect square in ascendingorder

get_squares(1..16) # => [1, 4, 9, 16]
get_squares(1..100) # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
=end

def get_squares(array)
  array.sort.uniq.select {|n| (1..array.max).map {|i| i**2}.include?(n)}
end

# This was the Best Practices solution:
def get_squares(array)
  array.select {|x| Math.sqrt(x) % 1 == 0}.uniq.sort
end

# This one was ranked next:
def get_squares(array)
  array.select{|x| x**0.5 % 1 == 0}.uniq.sort
end


