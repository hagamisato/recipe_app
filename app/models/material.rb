class Material < ApplicationRecord
  belongs_to :recipe

  validates :nm_material, length: {maximum: 20}
  validates :amnt_material, length: {maximum: 20}
 
end
