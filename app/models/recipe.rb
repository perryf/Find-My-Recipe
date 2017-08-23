class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  # def self.search(search)
  #   where("name LIKE ?", "%#{search}%")
  # end


  after_destroy :reseed_if_no_more_recipes


  private
  def reseed_if_no_more_recipes
    if self.class.all.length == 0
      seeds = File.join(Rails.root, 'db', 'seeds.rb')
      load(seeds)
    end
  end




end
