class Ingredient < ApplicationRecord
  belongs_to :recipe

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
