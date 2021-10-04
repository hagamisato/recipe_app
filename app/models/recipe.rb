class Recipe < ApplicationRecord
  belongs_to :user
  has_many :materials, :tags, :favorite
end
