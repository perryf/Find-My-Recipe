class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  # def self.search(search)
  #   where("name LIKE ?", "%#{search}%")
  # end

end
