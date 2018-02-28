require 'csv'

class Product < ApplicationRecord
  belongs_to :category, class_name: "Category", foreign_key: "accounting_system_code", primary_key: "accounting_system_code"
  belongs_to :company
  belongs_to :brand, optional: true, class_name: "Brand", foreign_key: "accounting_system_code", primary_key: "accounting_system_code"
  has_many   :remainders, dependent: :restrict_with_error, foreign_key: "product_accounting_system_code", primary_key: "product_accounting_system_code"
  has_many   :price_lists, dependent: :restrict_with_error, class_name: "PriceList", foreign_key: "product_accounting_system_code", primary_key: "product_accounting_system_code"
  has_many   :order_tables

  validates :title, presence: true
  validates :accounting_system_code, presence: true, length: { maximum: 20 }
  validates :barcode, presence: true, length: { maximum: 20 }

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by(id: row["id"]) || new
      product.attributes = row.to_hash
      product.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
