# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
$stdout.sync = true

ActiveRecord::Base.connection.truncate(Dictionary.table_name)
word_file = "/usr/share/dict/words"
total_words = File.readlines(word_file).count
loaded_words = []

File.readlines(word_file).each_with_index do |line, index|
  print "\rLoading word #{index + 1} of #{total_words}"
  word = line.strip.downcase
  Dictionary.create!(word: word) unless loaded_words.include?(word)
  loaded_words << word
end
