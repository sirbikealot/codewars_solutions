# ho_ho_ho_with_functions.rb

=begin

Santa is learning programming. And what could be the first program, he wants to write? Yes, the "Hello world!" of Christmas: "Ho Ho Ho!". He wants to write a function ho(), which should have the following return values:

ho(); // should return "Ho!"
ho(ho()); // should return "Ho Ho!"
ho(ho(ho())); // should return "Ho Ho Ho!"
Unfortunately he couldn't find any tutorial, which explains, how he could implement that. Can you help him?

Rules:

each call of ho() must add a "Ho" to the string
the "Ho"'s must be separated by a space
at the end of the string, there must be an exclamation mark (!), without a space

=end

def ho()
	#TODO
end

def ho(x="")
  if x[0] == "H"
    "Ho #{x}"
  else
    "Ho!"
  end
end
# => nil 
# ho
# => "Ho!" 
# ho(ho)
# => "Ho Ho!" 
# ho(ho())
# => "Ho Ho!" 
# ho(ho(ho()))
# => "Ho Ho Ho!" 

# Refactor:
def ho(x=nil)
  x ? "Ho #{x}" : "Ho!"
end

# Best practices solution:
def ho(ho=nil)
  ho ? "Ho " + ho : "Ho!"
end


