class Recipe < ApplicationRecord
  belongs_to :user
  has_many :materials
  has_many :tags
  has_many :favorites

  validates :title, length: {maximum: 20}, presence: true
  validates :explain, presence: true

  accepts_nested_attributes_for :materials
end
