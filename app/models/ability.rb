class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin

      can :manage, [Author, Publisher, Book, Genre, Store]
      can :read, [Purchase, User]
      can :destroy, User
      cannot :destroy, [Author, Publisher, Book]
      can :manage, user
      cannot :destroy, user

    elsif user.has_role? :customer

      can :read, [Book, Genre, Author, Publisher, Store]
      # can [:new, :create], Purchase
      can [:edit, :update], Purchase, user_id: user.id, state: 'open'
      can :add_to_cart, user.cart
      can :read, Purchase, user_id: user.id, state: 'closed'
      can :manage, user

    else
      can :read, [Book, Genre, Author, Publisher, Store]
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
