# building_strings_from_hash.rb

=begin
Complete the solution so that it takes the object (JavaScript/CoffeeScript) or hash (ruby) passed in and generates a human readable string from its key/value pairs.

The format should be "KEY = VALUE". Each key/value pair should be separated by a comma except for the last pair.

Example:

solution({a: 1, b: '2'}) # should return "a = 1,b = 2"

=end

def solution(pairs)
	puts pairs.map {|k,v| "#{k} = #{v}"}.join(",")
end

# My solution matched the Best Practices solution exactly!!!

