class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  belongs_to :company, optional: true
  has_many   :routes

  validates :name, presence: true

  after_create :send_notification_create

  private

  def send_notification_create
    unless self.admin?
      UsersMailer.create_user(self).deliver_now
    end
  end
end
