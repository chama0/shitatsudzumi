class Recipe < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_many :materials
  has_many :howtomakes

  with_options presence: true do
    validates :name
    validates :chach_copy
    validates :point
    validates :upbringing

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :many
      validates :price
    end
  end

end
