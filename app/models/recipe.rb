class Recipe < ApplicationRecord
  has_rich_text :description
  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, allow_destroy: true

end
