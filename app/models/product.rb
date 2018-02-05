class Product < ApplicationRecord
  belongs_to :product_group
  belongs_to :company
  belongs_to :brand, optional: true
  has_many   :remainders, dependent: :restrict_with_error
  has_many   :price_lists, dependent: :restrict_with_error
  has_many :order_tables

  validates :title, presence: true
  validates :accounting_system_code, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :barcode, presence: true, uniqueness: true, length: { maximum: 20 }

  def self.import(file)
    CSV.foreach(file.path, headers:true) do |row|
      Product.create! row.to_hash
    end
  end
end
