# triangular_inject_ex.rb

# Find the nth triangular number. For example, the 3rd triangular number is 6 (1 + 2 + 3 = 6).

def triangular(n)
  n < 1 ? 0 : (1..n).inject(:+)
end

=begin
Test Cases:
Test.assert_equals( triangular(2), 3 )
Test.assert_equals( triangular(7), 28 )
Test.assert_equals( triangular(12), 78 )
Test.assert_equals( triangular(25), 325 )
Test.assert_equals( triangular(50), 1275 )
Test.assert_equals( triangular(1000), 500500 )
Test.assert_equals( triangular(5000), 12502500 )
Test.assert_equals( triangular(10000), 50005000 )

Test.assert_equals( triangular(0), 0)
Test.assert_equals( triangular(-1), 0)
Test.assert_equals( triangular(-5), 0)
=end
