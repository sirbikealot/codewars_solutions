# unique_remove_duplicates_integers_array_hash_inject_ex.rb

=begin

You are to write a function called unique that takes an array of integers and returns the array with duplicates removed. It must return the values in the same order as first seen in the given array. Thus no sorting should be done, if 52 appears before 10 in the given array then it should also be that 52 appears before 10 in the returned array.

Assumptions:

	All values given are integers (they can be positive or negative).
	You are given an array but it may be empty.
	The array may have duplicates or it may not.
	You cannot use the uniq method on Arrays (don't even try it).
	
Example:

puts unique([1,5,2,0,2,-3,1,10]).inspect
[1,5,2,0,-3,10]

puts unique([]).inspect
[]

puts unique([5, 2, 1, 3]).inspect
[5, 2, 1, 3]

=end

# use #each and push to new array if count == 1

# use #map but need to access index to ensure 1st instance of each number is not removed

# use #compact if result has any nil elements.

# use #take_while to get all elements up to but excluding the first dup, then ???

# use count to get number of instances of each element and populate hash where keys are unique elements and values are their counts.  Then produce array of keys.  This may or may not be faster than pushing to new array if count == 1.


puts "Use inject to create hash of number counts then return keys"
start = Time.now

def unique(integers)
	count_hash = integers.map(&:to_s).inject(Hash.new(0)) do |counts,num|
		counts[num] += 1
		counts
	end
	count_hash.keys.map(&:to_i)
end

puts unique([1,5,2,0,2,-3,1,10]).inspect
puts unique([]).inspect
puts unique([5, 2, 1, 3]).inspect 
puts "Total time: #{Time.now - start}"
# => [1, 5, 2, 0, -3, 10]
# => []
# => [5, 2, 1, 3]
# => Total time: 5.2e-05

# Best solution provided was:

puts "Use simple intersection (&) method"
start = Time.now

def unique(integers)
  integers & integers
end

puts unique([1,5,2,0,2,-3,1,10]).inspect
puts unique([]).inspect
puts unique([5, 2, 1, 3]).inspect 
puts "Total time: #{Time.now - start}"
# => [1, 5, 2, 0, -3, 10]
# => []
# => [5, 2, 1, 3]
# => Total time: 3.3e-05

# Almost as good:

def unique(integers)
  integers.to_set.to_a
end

=begin
Test Cases:
describe "Unique" do
    it "The method unique should be defined." do
        Test.expect(defined?(unique), "The method unique is not defined.")
    end
    
    it "Empty array should return an empty array." do
        Test.assert_equals(unique([]), [], "Failed call unique([])")
    end
    
    it "One value should return that value in array." do
        Test.assert_equals(unique([-1]), [-1], "Failed call unique([-1])")
    end
    
    it "Multiple values should return in same order as given." do
        Test.assert_equals(unique([-1, 5, 10, -100, 3, 2]), [-1, 5, 10, -100, 3, 2], "Failed call unique([-1, 5, 10, -100, 3, 2])")
    end
    
    it "Duplicates should be removed and in the order first seen." do
        Test.assert_equals(unique([1, 2, 3, 3, 2, 1, 2, 3, 1, 1, 3, 2]), [1, 2, 3], "Failed call unique([1, 2, 3, 3, 2, 1, 2, 3, 1, 1, 3, 2])")
        Test.assert_equals(unique([1, 3, 2, 3, 2, 1, 2, 3, 1, 1, 3, 2]), [1, 3, 2], "Failed call unique([1, 3, 2, 3, 2, 1, 2, 3, 1, 1, 3, 2])")
        Test.assert_equals(unique([3, 2, 3, 3, 2, 1, 2, 3, 1, 1, 3, 2]), [3, 2, 1], "Failed call unique([3, 2, 3, 3, 2, 1, 2, 3, 1, 1, 3, 2])")
    end
    
    it "Duplicates should be remove and in the order first seen. (Random)" do
        Test.assert_equals(unique(test_array), solution, "Failed call unique(#{test_array.inspect})")
    end
end
=end



