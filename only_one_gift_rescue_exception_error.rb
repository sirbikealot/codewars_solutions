# only_one_gift_rescue_exception_error.rb

=begin

Santa is handing out gifts in the kindergarten. Many toddlers are around there and everyone should have the opportunity to have a seat on Santa's lap. But there's Peter, a 5 year old boy, who is a bit naughty. He tries to get two gifts. After he got the first one, he lines up again in the queue of children.

But fortunately Santa is not alone. His elves keep a list with the names of the children, which already were on Santa's lap. We know, that each child name is unique. If a child tries to get a second gift, the elves will tell Santa.

OK, let's help Santa and his elves with a simple function handOutGift() (hand_out_gift in Ruby) which takes the name of the next child. If this child already got a gift, it must throw an error in order to remind Santa.

Example:

hand_out_gift("Peter");
hand_out_gift("Alison");
hand_out_gift("John");
hand_out_gift("Maria");
hand_out_gift("Peter"); // <-- must throw an error

=end

def hand_out_gift(name)
  $names ||= [] # conditional assignment, global variable
  if $names.include?(name.strip)
  	raise ArgumentError.new('Child already got a gift from Santa')
  else 
  	$names << name.strip
  end
  #names.include?(name) ? names << name : raise Argument Error.new("#{name} has gotten his gift from Santa") # => didn't work
end
hand_out_gift("Peter")
hand_out_gift("Alison")
hand_out_gift("John")
hand_out_gift("Maria")
hand_out_gift("  Peter ")

# => only_one_gift_rescue_exception_error.rb:24:in `hand_out_gift': Child already got a gift from Santa (ArgumentError)
# => 	from only_one_gift_rescue_exception_error.rb:36:in `<main>'

# Solution with hightest Best Practices rating:

def hand_out_gift(name)
  @names ||= []
  raise if @names.include? name
  @names << name
end

=begin

Test Cases:

describe 'Only one gift per child' do
  names = ['Peter', 'Alison', 'John', 'Maria', 'Paul', 'Jessica', 'Benjamin', 'William', 'Emma', 'Grace']
  
  it 'must not raise an error' do
    names.shuffle.each { |name| Test.expect_no_error { hand_out_gift name } }
  end
  
  it 'must raise an error' do
    names.shuffle.each { |name| Test.expect_error { hand_out_gift name } }
  end
end

=end
