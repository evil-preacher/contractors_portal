class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  belongs_to :company, optional: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  after_create :send_notification_create

  private

  def send_notification_create
    unless self.admin?
      UsersMailer.create_user(self).deliver_now
    end
  end
end
