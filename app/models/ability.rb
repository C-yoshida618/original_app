# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :create, Order
      can :manage, Order, user_id: user.id
      can :manage, Product, user_id: user.id
    end
  end
end
