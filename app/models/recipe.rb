class Recipe < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :materials
  has_many :howtomakes

end
