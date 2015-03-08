class Admin::UsersController < Admin::BaseController 
  helper_method :sort_column, :sort_direction, :search_params

    before_filter :find_user, :only => [:edit, :update, :show, :destroy]

    def new
      @user = User.new
    end

    def create
      @user = User.new(create_user_params)
      if @user.save
        flash[:notice] = "Successfully created User." 
        redirect_to admin_users_path
      else
        render :action => 'new'
      end
    end
    
    def index 
      @q = User.search(params[:q])
      search_relation = @q.result
      @users = search_relation.order(sort_column + " " + sort_direction).references(:user).page params[:page]
    end 

    def show
      
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      if @user.update_attributes(user_params)
        redirect_to admin_users_path, :notice => "User successfully updated."
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, :notice => "User deleted."
    end

    protected

    def find_user
      @user = User.find(params[:id])
    end

    private

    def sort_column
      User.column_names.include?(params[:sort]) ? params[:sort] : "email"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def search_params
      { :search => params[:search] }
    end
    def create_user_params
      params.require(:user).permit(:first_name,:last_name,:username,:email,:password,:password_confirmation,:role,:locale)
    end
    
    def user_params
      params.require(:user).permit(:first_name,:last_name,:username,:email,:password,:password_confirmation,:role,:locale)
    end
end
