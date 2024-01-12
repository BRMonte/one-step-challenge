# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

(1..20).each do |i|
  alphabet = ('A'..'Z').to_a

  Board.new(
    name: "Board #{alphabet.sample(2).join}",
    email: "email#{i}@gmail.com",
    height: i < 10 ? 2 * i : i + 4,
    width: i < 10 ? 3 * i : 2 * i + 5,
    mines_number: 2 * i
  ).save
end
