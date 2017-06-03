module Admin
  class UsersController < AdminController
    before_action :set_current_menu
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = sorted_users
      @user = User.new
    end

    def edit
      @users = sorted_users
      self.tab_after_render = Admin::Tabs::NEW_USER_TAB
    end

    def create
      @user = User.new(safe_params)

      if @user.save
        redirect_to admin_users_path
      else
        @users = sorted_users

        self.tab_after_render = Admin::Tabs::NEW_USER_TAB

        render :index
      end
    end

    def update
      clear_password_if_not_changed

      if @user.update(safe_params)
        redirect_to admin_users_path
      else
        self.tab_after_render = Admin::Tabs::NEW_USER_TAB

        render :edit
      end
    end

    def destroy
      @user.destroy!

      redirect_to admin_users_path
    end

    private

    def set_current_menu
      @current_menu = 'users'
    end

    def clear_password_if_not_changed
      if params[:user][:password].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
    end

    def set_user
      @user = User.find(params[:id].to_i)
    end

    def safe_params
      params.require(:user).permit(:id, :name, :email, :password, :password_confirmation, :avatar_url)
    end

    def sorted_users
      User.all.sort_by(&:name)
    end
  end
end
