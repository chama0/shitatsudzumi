class Howtomake < ApplicationRecord

  belongs_to :recipe

  with_options presence: true do
    validates :text
    validates :image
  end

end
