class Howtomake < ApplicationRecord

  belongs_to :recipe
  has_one_attached :image

  with_options presence: true do
    validates :text
  end

end
