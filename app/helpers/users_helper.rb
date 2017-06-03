module UsersHelper
  def super_admin?(user)
    user.email == 'admin@arsenal.com.br'
  end

  def can_modify_user?(user)
    current_user == user || super_admin?(current_user)
  end
end
