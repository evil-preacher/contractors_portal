class Remainder < ApplicationRecord
  belongs_to :load_event, optional: true
  belongs_to :company

  validates :remainder, presence: true, numericality: true
  validates :product_accounting_system_code, presence: true

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
end
