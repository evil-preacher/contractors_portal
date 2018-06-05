class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      if user.admin?
        if user.company.nil?
          can :manage, Company
        else
          can :manage, :all
        end
      else
        cannot :manage, User
        can :manage, Company
      end
    else
      cannot :manage, :all
    end
  end
end
