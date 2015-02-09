# readability_is_king.rb

=begin
We will use the Flesch–Kincaid Grade Level to evaluate the readability of a piece of text. This grade level is an approximation for what schoolchildren are able to understand a piece of text. For example, a piece of text with a grade level of 7 can be read by seventh-graders and beyond.

The way to calculate the grade level is as follows:

(0.39 * average number of words per sentence) + (11.8 * average number of syllables per word) - 15.59
For example, in the following text:

The turtle is leaving.
The average number of words per sentence is 4 and the average number of syllables per word is 1.5. The score is then (0.39 * 4) + (11.8 * 1.5) - 15.59 = 3.67

Write a function that will calculate the Flesch–Kincaid grade level for any given string. Return the grade level rounded off to two decimal points.

HINT: Count the number of vowels as an approximation for the number of syllables. But count groups of vowels as one (e.g. deal is one syllable).

Ignore hyphens, dashes, apostrophes, parentheses, ellipses and abbreviations. The tests for the kata are the same as the example fixtures.

Your Test Cases:
texts = {
  "The turtle is leaving." => 3.67,
  "A good book is hard to find." => -1.06,
  "To be or not to be. That is the question." => -0.66,
  "Oh no! The lemming is falling." => 1.31,
  "Do not cut your fingers as your katana is getting sharper! Be gentle." => 4.19
  }

texts.map {|t, level| 
  calculated = flesch_kincaid(t)
  Test.expect(calculated == level, "Grade level should be #{level} but was #{calculated}. The text was: #{t}")
}

=end

def flesch_kincaid text
  #number of sentences => text.split(/[.!?]/).count
  #number of words => text.scan(/\w+/).count
  #number of syllables => text.downcase.scan(/[aeiou]+/).count
  #0.39 * avg number of words per sentence => 0.39 * t.scan(/\w+/).count / t.split(/[.!?]/).count
  #11.8 * avg number of syllables per word => 11.8 * t.downcase.scan(/[aeiou]+/).count / t.scan(/\w+/).count
  (0.39 * text.scan(/\w+/).count / text.split(/[.!?]/).count + 11.8 * text.downcase.scan(/[aeiou]+/).count / text.scan(/\w+/).count - 15.59).round(2)
end

=begin
texts.each {|t| puts (0.39 * t.scan(/\w+/).count / t.split(/[.!?]/).count + 11.8 * t.downcase.scan(/[aeiou]+/).count / t.scan(/\w+/).count - 15.59).round(2)}
3.67
-1.06
-0.66
1.31
4.19
=end

# Best practices solution:
def flesch_kincaid text
  num_words = text.split.size
  num_sentences = text.split(/[.?!]/).size
  num_vowels = text.scan(/[aeiou]+/i).size
  
  grade_level = (0.39 * num_words / num_sentences) + (11.8 * num_vowels / num_words) - 15.59
  grade_level.round(2)
end
