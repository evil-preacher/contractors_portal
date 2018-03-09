class Remainder < ApplicationRecord
  belongs_to :load_event, optional: true
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
