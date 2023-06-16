class UsersController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            redirect_to user_url(@user.id)
        else
            flash[:errors]
            redirect_to new_user_url
        end

    end


    def show
        @user = User.find(params[:id])
    end


    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end
