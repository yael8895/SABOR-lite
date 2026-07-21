class Step < ApplicationRecord
  has_rich_text :description
  belongs_to :recipe

  before_create :set_indice_paso

  private #metodo interno para no usarlo fuera

   def set_indice_paso

     self.indice_paso = (recipe.steps.maximum(:indice_paso) || 0) + 1
   end
end
