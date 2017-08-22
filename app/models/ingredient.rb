class Ingredient < ApplicationRecord
  belongs_to :recipe

  # def self.search(search)
  #   search.split(",").reduce{|item| where("name LIKE ?", "%#{item}%")}
  # end

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
  #
  # def self.search(search)
  #   search.split(", ").map do |item|
  #     puts item
  #     where("name LIKE ?", "%#{item}%")
  #   end
  # end

end
