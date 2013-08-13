class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.role.descricao == 'administrador'
        can :manage, :all
    end
        
  end
end
