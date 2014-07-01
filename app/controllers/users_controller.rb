class UsersController < ApplicationController


    def update
        @user = User.find(params[:id])
 
        if @user.update(user_params)
            redirect_to controller: :builder, action: :index
        else
            redirect_to controller: :builder, action: :index
        end
    end


    private
    def user_params
        params.require(:user).permit(:headline)
    end
end
