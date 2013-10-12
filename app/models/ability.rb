class Ability
  include CanCan::Ability

  def initialize(user)
    
    if user.role.descricao == 'administrador'
        can :manage, :all
    elsif user.role.descricao == 'usuario'
    	can [:create, :update, :read], Indicacao
      can [:read, :update, :create], Cliente
    elsif user.role.descricao == 'observador'
    	can :read, :all
    end
        
  end
end
