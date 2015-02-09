# anagrams.rb


=begin
What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:
'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array with words. You should return an array of all the anagrams or an empty array if there are none. For example:

anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']

anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']

anagrams('laser', ['lazing', 'lazy',  'lacer']) => []

=end

def anagrams(word, words)
	# for loop or iterator of words array
	# take_while or select if words contains all the instances of every letter in word: count of each letter in each element of words must equal the count of each letter in word.
	words.select {|w| w.split(//).sort == word.split(//).sort}
end

=begin
This was close to the Best Practices solution:

def anagrams(word, words)
  words.select { |w| w.chars.sort == word.chars.sort }
end

=end
