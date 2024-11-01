class Dictionary < ApplicationRecord
  validates :word, presence: true, uniqueness: true
  before_save :set_sorted_letters_and_length

  private

  def set_sorted_letters_and_length
    self.sorted_letters = word.downcase.chars.sort.join
    self.length = word.length
  end
end
