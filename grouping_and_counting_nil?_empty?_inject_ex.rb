# grouping_and_counting_nil?_empty?_inject_ex.rb

=begin

Your goal is to write the group_and_count method, which should receive and array as unique parameter and return a hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

Example usage:

input = [1,1,2,2,2,3]

group_and_count(input)# == {1=>2, 2=>3, 3=>1}
The following methods were disabled:

Array#count
Array#length

=end

#Test.assert_equals(group_and_count([3,3,3,2,2,1]),{3=>3, 2=>2, 1=>1})
#Test.assert_equals(group_and_count(nil),nil)
#Test.assert_equals(group_and_count([]),nil)

def group_and_count(input)
	input.nil?||input.empty? ? nil : input.inject(Hash.new(0)) {|h,n| h[n]+=1;h}
	end
	
# [1,1,2,2,2,3].map(&:to_s).inject(Hash.new(0)) {|h,n| h[n]+=1;h}
# => {"1"=>2, "2"=>3, "3"=>1}
# [1,1,2,2,2,3].inject(Hash.new(0)) {|h,n| h[n]+=1;h}
# => {1=>2, 2=>3, 3=>1}

# This solution was rated highest for Best Practices:

def group_and_count(input)
  return nil if input.nil? || input.empty?
  input.each_with_object(Hash.new(0)){ |k, h| h[k] += 1 }
end

puts "My solution:"
start = Time.now
def group_and_count(input)
	input.nil?||input.empty? ? nil : input.inject(Hash.new(0)) {|h,n| h[n]+=1;h}
end
group_and_count([3,3,3,2,2,1])
group_and_count(nil)
group_and_count([])
puts "Total time: #{Time.now - start}"
# => Total time: 9.0e-06

puts "Best Practices solution:"
start = Time.now
def group_and_count(input)
  return nil if input.nil? || input.empty?
  input.each_with_object(Hash.new(0)){ |k, h| h[k] += 1 }
end
group_and_count([3,3,3,2,2,1])
group_and_count(nil)
group_and_count([])
puts "Total time: #{Time.now - start}"
# => Total time: 3.3e-05


	
