# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize admin_user
    admin_user ||= AdminUser.new
    if admin_user.admin?
      can :manage, :all
    else
      can :read, :all
    end
  end

end
