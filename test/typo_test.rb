require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/typoglycemia'
require 'pry'

class TypoTest < Minitest::Test

  def test_a_word_is_returned_with_first_and_last_letters_the_same
    test_string = Typoglycemia.new("california")
    first_char = test_string.original_string.chars.first
    last_char = test_string.original_string.chars.last
    scrambled_word = test_string.word_scramble(test_string.original_string)
    new_first_char = scrambled_word.chars.first
    new_last_char = scrambled_word.chars.last
    assert_equal first_char, new_first_char
    assert_equal last_char, new_last_char
  end

  def test_a_word_is_scrambled
    test_string = Typoglycemia.new("kathleen")
    length = test_string.string_length
    random_array = Array.new
    original_letters = Array.new
    new_letters = Array.new
    4.times do |n|
      random_array << rand(2..test_string.string_length-1)
    end
    random_array.each do |n|
      original_letters << test_string.original_string[n]
    end
    scrambled_word = test_string.word_scramble(test_string.original_string)
    random_array.each do |n|
      new_letters << scrambled_word.chars[n]
    end

    refute_equal new_letters, original_letters
  end

  def test_a_sentence_is_scrambled_with_all_words_same_length_as_original
    test_string = Typoglycemia.new("This sentence is scrambled")
    length = test_string.string_length
    random_array = Array.new
    original_letters = Array.new
    new_letters = Array.new
    word_lengths = Array.new
    scrambled_word_lengths = Array.new
    4.times do |n|
      random_array << rand(2..test_string.string_length-1)
    end
    random_array.each do |n|
      original_letters << test_string.original_string[n]
    end
    test_string.original_string.split.each do |word|
      word_lengths << word.length
    end
    test_string.sentence_scramble
    random_array.each do |n|
      new_letters << test_string.scrambled_string[n]
    end
    test_string.scrambled_string.split.each do |word|
      scrambled_word_lengths << word.length
    end

    refute_equal new_letters, original_letters
    assert_equal word_lengths, scrambled_word_lengths
  end

end
