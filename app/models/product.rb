require 'csv'

class Product < ApplicationRecord
  belongs_to :company

  validates :title, presence: true
  validates :accounting_system_code, presence: true, length: { maximum: 20 }
  validates :barcode, presence: true, length: { maximum: 20 }
  validates :category_accounting_system_code, presence: true

  def self.batch_create(products)
    begin
      Product.transaction do
        JSON.parse(products).each do |product|
          Product.create!(product)
        end
      end
    rescue
      # do nothing
    end
  end
end
