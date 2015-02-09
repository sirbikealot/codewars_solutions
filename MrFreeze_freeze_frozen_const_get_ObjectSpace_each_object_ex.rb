# MrFreeze_freeze_frozen_const_get_ObjectSpace_each_object_ex.rb

	module A
    module B
      class C
        class D
        end
      end
    end
  end

current_object_class = self.class
current_object_class.constants.collect {|c| current_object_class.const_get(c)}.select {|k| k.is_a?(Module)}
current_object_class.constants.collect {|c| current_object_class.const_get(c)}.select {|k| k.is_a?(Module)}.select {|k| k.constants.include?(:B)}
 => [A]
current_object_class.constants.collect {|c| current_object_class.const_get(c)}.select {|k| k.is_a?(Module)}.select {|k| k.constants.include?(:B)}[0]
 => A
current_object_class.constants.collect {|c| current_object_class.const_get(c)}.select {|k| k.is_a?(Module)}.select {|k| k.constants.include?(:B)}[0]::B.freeze
 => A::B 
  > A::B.frozen?
 => true
module A1
  module B1
    class C2
      class D2
      end
    end
  end
end
 => nil
current_object_class = self.class
current_object_class.constants.collect {|c| current_object_class.const_get(c)}.select {|k| k.constants.include?(:B1) if k.respond_to?(:constants)}[0]
 => A1
ObjectSpace.each_object(Module).select {|klass| klass == A1}[0]
 => A1

	
if ObjectSpace.each_object(Module).select {|k| k.constants.include?(:C2)}[0]
  ObjectSpace.each_object(Module).select {|k| k.constants.include?(:C2)}[0]::C2.freeze
else
	ObjectSpace.each_object(Module).each do |k|
		ObjectSpace.each_object(Module).select {|k| k.constants.include?(:C2)}[0]::C2.freeze
  end
end
 => A1::B1::C2 
A1::B1::C2.frozen?
 => true
 
2.0.0 :455 > module A3
2.0.0 :456?>   module B3
2.0.0 :457?>     class C3
2.0.0 :458?>       class D3
2.0.0 :459?>         end
2.0.0 :460?>       end
2.0.0 :461?>     end
2.0.0 :462?>   end
2.0.0 :464 > ObjectSpace.each_object(Class).select {|k| k.constants.include?(:C3)}[0]::C3.freeze
NameError: uninitialized constant C3
	from (irb):464
2.0.0 :466 > ObjectSpace.each_object(Module).select {|k| k.constants.include?(:C3)}[0]::C3.freeze
 => A3::B3::C3 
2.0.0 :467 > A3::B3::C3.frozen?
 => true
 
2.0.0 :468 > class A4
2.0.0 :469?>   class B4
2.0.0 :470?>     class C4
2.0.0 :471?>       class D4
2.0.0 :472?>         end
2.0.0 :473?>       end
2.0.0 :474?>     end
2.0.0 :475?>   end
 => nil 
2.0.0 :476 > ObjectSpace.each_object(Module).select {|k| k.constants.include?(:C4)}[0]::C4.freeze
 => A4::B4::C4 
2.0.0 :477 > A4::B4::C4.frozen?
 => true

# Figure out how to loop ObjectSpace.each_object(Module) until D5 is found and frozen because who knows how many levels deep MrFreeze is?

# Solution turned out to be MrFreeze.freeze. Funny thing is, I tried that first and the test wouldn't pass!!!!

