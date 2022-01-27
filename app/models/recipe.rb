class Recipe < ApplicationRecord
  belongs_to :user
  has_many :materials
  has_many :tags
  has_many :favorites

  accepts_nested_attributes_for :materials
end
