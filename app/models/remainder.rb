class Remainder < ApplicationRecord
  belongs_to :load_event, optional: true
  belongs_to :product, optional: true, class_name: "Product", foreign_key: "accounting_system_code", primary_key: "accounting_system_code"
  belongs_to :company

  validates :remainder, presence: true, numericality: true

  def self.batch_create(remainders)
    begin
      Remainder.transaction do
        JSON.parse(remainders).each do |remainder|
          Remainder.create!(remainder)
        end
      end
    rescue
      # do nothing
    end
  end

  def self.clear_all
    Remainder.delete_all
  end
end
