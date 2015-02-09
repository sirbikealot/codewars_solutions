# case_regex_push_respond_to_nil_rescue_to_sym_ex.rb

lines = ["This is an alpha line", "Beta line next!", "Another AlphA", "I have no idea", nil]

=begin

result = []
lines.each do |line|
	if line.respond_to?(:downcase)
    case line.downcase
      when /alpha/
        result.push :alpha
      when /beta/
        result.push :beta
      else
				result.push :unknown
      end
    else
			result.push :unknown
    end
  end
result

# => [:alpha, :beta, :alpha, :unknown, :unknown]

=end

# while my solution is very readable, this one was voted highest for "best practices" in codewars:

lines.map { |line| line.to_s[/alpha|beta/i].downcase.to_sym rescue :unknown }

# this one was ranked next highest for "best practices":

lines.map { |line| line =~ /(alpha|beta)/i ? $1.to_sym.downcase : :unknown }

=begin
Test Cases:

def test_line_types(input, expected)
  output = line_types(input)
  Test.assert_equals(output, expected)
end

# Easy Mode, similar to given tests
test_line_types  ["alpha"],  [:alpha]
test_line_types  ["beta"],  [:beta]
test_line_types  ["meh?"],  [:unknown]
test_line_types \
  ["This is an alpha line", "Beta line next!", "Another Alpha", "I have no idea"],
  [:alpha, :beta, :alpha, :unknown]

# Throw some edge cases at it
test_line_types  \
  ["-/ALPHA\-", nil, "", "BeTA"],
  [:alpha, :unknown, :unknown, :beta]

test_line_types  [],  []
=end
