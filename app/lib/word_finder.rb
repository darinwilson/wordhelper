class WordFinder
  def self.find_sub_words(input)
    return [] if input.blank?

    input_chars = input.downcase.chars.sort

    # Find all possible letter combinations that could be made from the input
    possible_letter_patterns = (1..input.length).flat_map do |length|
      input_chars.combination(length).map(&:sort).uniq.map(&:join)
    end

    # Query for all words that match these patterns
    Dictionary
      .where(sorted_letters: possible_letter_patterns)
      .pluck(:word)
      .sort_by(&:length)
  end
end
