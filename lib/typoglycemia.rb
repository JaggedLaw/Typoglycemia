# Challenge:
# Typoglycemia
# The mind's ability to decipher a mis-spelled word if the first and last letters of the word are correct.
# The word Typoglycemia describes Teh mdin's atbiliy to dpeihecr a msi-selpeld wrod if the fsirt and lsat
# lteetrs of the wrod are cerorct.
# use:
# p gets.chomp.split.map { |w| w.scan(/\,|\./).empty? && w.length > 3 ? w[0] << w[1..-2].split("").shuffle.join << w.chars.last : !w.scan(/\,|\./).empty? ? w[0] << w.split("")[1..-3].shuffle.join << w.chars[-2..-2].join << w.chars.last : w }.join(" ")
# .split, .map!, .join, .chars, .empty?,
# try also:
# def scramble(string)
# end
# puts scramble(gets.chomp)
#!/usr/bin/env ruby

class Typoglycemia

  attr_accessor :original_string, :scrambled_string, :string_length

  def initialize(string)
    @original_string = string
    @scrambled_string = string
    @string_length = string.length
  end

  def word_scramble(word)
    word_length = word.length
    first_char = word.chars.first
    last_char = word.chars.last
    middle_letters = word.chars
    middle_letters.delete_at(word_length-1)
    middle_letters.delete_at(0)
    middle_letters.shuffle!
    first_char + middle_letters.join + last_char
  end

  def sentence_scramble
    scrambled_word_array = Array.new
    original_string.split.each do |word|
      if word.length > 3
        scrambled_word_array << word_scramble(word)
      else
        scrambled_word_array << word
      end
    end
    @scrambled_string = scrambled_word_array.join(" ")
  end
end

if __FILE__ == $PROGRAM_NAME
  input_file_string = File.open(ARGV[0]).read
  input_string = input_file_string.chomp

  test_string = Typoglycemia.new(input_string)
  scrambled_output = test_string.sentence_scramble
  puts "#{scrambled_output}"
end
