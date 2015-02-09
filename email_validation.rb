# email_validation.rb

=begin

Email addresses are notoriously difficult to validate.

Create a method that takes an email and returns true if valid, false otherwise.

Tip: It doesn't have to be perfect.

For example:

validate('joe@example.com') => true
validate('joe') => false
Here's tool that may help: http://rubular.com/

I suggest not using some code that you find on the internet. Yes, there are regexes that do email validation. But what is the purpose of copying and pasting?

Also, you do not need to use a regex. There are many ways of solving this.

14Jan2015 => 

def validate(email)
  email =~ /\w+@\w+[.]\w+/ ? true : false
end

should return true for 'joe@example.com'
Test Passed
should return true for 'bob.Brown@example.info'
Test Passed
should return true for 'Jack-Brown@example-server.co'
Value is not what was expected

14Jan2015 =>

def validate(email)
  email =~ /\w+-?\w+@\w+-?\w+[.]\w+/ ? true : false
end


should return true for 'joe@example.com'
Test Passed
should return true for 'bob.Brown@example.info'
Test Passed
should return true for 'Jack-Brown@example-server.co'
Test Passed
should return true for 'joe@server.jp'
Test Passed
should return false for 'joe'
Test Passed
should return false for 'joe@example'
Test Passed
should return false for 'joe-example.net'
Test Passed
should return false for 'joe@server.'
Test Passed
should return false for '@server.com'
Test Passed
should return false for 'joe@.com'
Test Passed
should return false for '@.com'
Test Passed
should return false for '@.'
Test Passed
should return false for 'joe.m.k@server'
Test Passed
should return true for 'joe.m@server.com'
Value is not what was expected

My final submission:

def validate(email)
  email =~ /\w+(-|[.])?\w+@\w+-?\w+[.]\w+/ ? true : false
end

Best Practices Solution follows, but it is too broad as it will accept 'joe@@example.com' or 1234@12345.123456:
def validate(email)
  /^.+@.+\..+$/ === email 
end

...but I used an important concept here to refactor my submission:
=end

def validate(email)
	/\w+(-|[.])?\w+@\w+-?\w+[.]\w+/ === email
end

=begin
email_test_array = ["joe@example.com", "bob.Brown@example.info", "Jack-Brown@example-server.co", "joe@server.jp", "joe.m@server.com", "joe@example", "joe-example.net", "joe@server.", "@server.com", "joe@com", "@.com", "@.", "joe.m.k@server", "joe@@example.com"]

email_test_array.each do |str|
	puts "is #{str} a valid email? => #{validate(str)}"
end
=end
