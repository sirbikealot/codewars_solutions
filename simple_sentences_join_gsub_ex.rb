# simple_sentences_join_gsub_ex.rb

=begin

Implement a function, so it will produce a sentence out of the given parts.

Array of parts could contain:
- words;
- commas in the middle;
- multiple periods at the end.

Sentence making rules:
- there must always be a space between words;
- there must not be a space between a comma and word on the left;
- there must always be one and only one period at the end of a sentence.

Example:

make_sentence ['hello', ',', 'my', 'dear'] # returns 'hello, my dear.'

=end

2.0.0 :534 > sent = ["hello", ",", "my", "dear", ".", ".", "."]
 => ["hello", ",", "my", "dear", ".", ".", "."] 
2.0.0 :535 > sent.join(" ").gsub(" ," , ",").gsub(/[.]+/,"").rstrip + "."
 => "hello, my dear."

# Highest rated solution:

def make_sentence parts
  parts.join(' ').gsub(' ,', ',').sub(/(\s\.)*$/, '.');
end

# Next highest rated:

def make_sentence parts
  parts.join(" ").gsub(' ,', ',').gsub(' .', '') << "."
end
