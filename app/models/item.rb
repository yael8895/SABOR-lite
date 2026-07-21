class Item < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  before_save { self.price= self.ingredient.unit_price * self.quantity}
end
