class Remainder < ApplicationRecord
  belongs_to :load_event, optional: true, dependent: :restrict_with_error
  belongs_to :product, dependent: :restrict_with_error
  belongs_to :company, dependent: :restrict_with_error

  validates :remainder, presence: { message: "Не может быть пустым" },
                        numericality: { message: "Это только числовое поле" }
end
