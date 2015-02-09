# triangle_type.rb

=begin
In this kata, you should calculate type of triangle with three given sides a, b and c.

If all angles are less than 90°, this triangle is acute and function should return 1.

If one angle is strictly 90°, this triangle is right and function should return 2.

If one angle more than 90°, this triangle is obtuse and function should return 3.

If three sides cannot form triangle, or one angle is 180° (which turns triangle into segment) - function should return 0.

Input parameters are sides of given triangle. All input values are non-negative floating point or integer numbers (or both).

Examples:

triangle_type(2, 4, 6) # return 0 (Not triangle)
triangle_type(8, 5, 7) # return 1 (Acute, angles are approx. 82°, 38° and 60°)
triangle_type(3, 4, 5) # return 2 (Right, angles are approx. 37°, 53° and exactly 90°)
triangle_type(7, 12, 8) # return 3 (Obtuse, angles are approx. 34°, 106° and 40°)
If you stuck, this can help you: http://en.wikipedia.org/wiki/Law_of_cosines. But you can solve this kata even without angle calculation.

There is very small chance of random test to fail due to round-off error, in such case resubmit your solution.

=end

=begin
Find max of arguments (turn into array with splat operator *)
max = c
If c >= (a + b) then Not Triangle, return 0
Else: 
Use Pythagorean Theorem a^2 + b^2 = c^2.
Case Statement
when c^2 > (a^2 + b^2) then Obtuse, return 3
when c^2 = (a^2 + b^2) then Right, return 2
when c^2 < (a^2 + b^2) then Acute, return 1
=end

=begin

def triangle_type(a, b, c)
  ary = [a,b,c].sort!
	if ary[2] >= ary[0] + ary[1]
		0
	else
		test = ary[2]**2 - (ary[0]**2 + ary[1]**2)
		result = case
			when test > 0
				3
			when test == 0
				2
			when test < 0
				1
		end
		result
	end
end

puts triangle_type(7,3,2)
puts triangle_type(2,4,6)
puts triangle_type(8,5,7)
puts triangle_type(3,4,5)
puts triangle_type(7,12,8)

=end

# Passed all tests. Best practices solution:

def triangle_type(a, b, c)
  x, y, z = [a, b, c].sort
  return 0 if x + y <= z
  cs = x**2 + y**2 - z**2
  cs == 0 ? 2 : (cs > 0 ? 1 : 3)
end

