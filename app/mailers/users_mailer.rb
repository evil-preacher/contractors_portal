class UsersMailer < ApplicationMailer
  def create_user(user)
    @user = user
    mail(to: user.email, subject: "На портале создан пользователь")
  end
end
