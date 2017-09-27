class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  belongs_to :company, optional: true, dependent: :restrict_with_error

  validates :name, presence: { message: "Не может быть пустым" }
  validates :email, presence: { message: "Не может быть пустым" },
                    uniqueness: { message: "Такой email или пароль уже существует" }

  after_create :send_notification_create

  private

  def send_notification_create
    unless self.admin?
      UsersMailer.create_user(self).deliver_now
    end
  end
end
