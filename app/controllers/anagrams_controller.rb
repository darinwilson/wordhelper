class AnagramsController < ApplicationController
  def index
    @words = grouped_sub_words if params[:word].present?
  end

  private

  def grouped_sub_words
    WordFinder.find_sub_words(params[:word]).group_by { |word| word.length }
  end
end
