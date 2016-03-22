class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    correct_user #This is necessary so that a user may only access their own profile.
                  #Otherwise they could insert any id on the url and enter.
  end

  private

    def correct_user
        if @user != current_user
          redirect_to root_path
          return flash[:alert]  = 'Not Allowed'
        end
      end

end
