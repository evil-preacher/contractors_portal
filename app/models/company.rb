class Company < ApplicationRecord
  has_many :users, dependent: :restrict_with_error
  has_many :shops, dependent: :restrict_with_error
  has_many :brands, dependent: :restrict_with_error
  has_many :remainders, dependent: :restrict_with_error
  has_many :sales_agents, dependent: :restrict_with_error
  has_many :price_types, dependent: :restrict_with_error
  has_many :price_lists, dependent: :restrict_with_error
  has_many :load_events, dependent: :restrict_with_error
  has_many :product_types, dependent: :restrict_with_error
  has_many :product_groups, through: :product_types, dependent: :restrict_with_error
  has_many :products, through: :product_types, dependent: :restrict_with_error

  validates :name, presence: { message: "Не может быть пустым" }
  validates :bin, presence:   { message: "Не может быть пустым" },
                  uniqueness: { message: "Такой БИН уже существует" },
                  length:     { is: 12, message: "должен быть 12 символов" }
  validates :phone, presence: { message: "Не может быть пустым" }
  validates :address, presence: { message: "Не может быть пустым" }
end
