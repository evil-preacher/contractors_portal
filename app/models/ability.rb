class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        can :manage, :all
      else
        cannot :manage, User
      end
    else
      cannot :manage, :all
    end
  end
end
