module Admin
  class UsersController < AdminController
    before_action :set_current_menu

    def index
      @users = User.all
    end

    private

    def set_current_menu
      @current_menu = 'users'
    end
  end
end
