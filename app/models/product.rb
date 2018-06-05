require 'csv'

class Product < ApplicationRecord
  belongs_to :company

  validates :title, presence: true
  validates :asc, presence: true, length: { maximum: 20 }
  validates :category_asc, presence: true
end
