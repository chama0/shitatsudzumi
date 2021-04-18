class Material < ApplicationRecord

  belongs_to :recipe

  with_options presence: true do
    validates :name

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :quantity
      validates :price
    end
  end

end
