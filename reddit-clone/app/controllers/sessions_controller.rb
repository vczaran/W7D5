class SessionsController < ApplicationController
    before_action :require_logged_in, only: [:destroy]
    before_action :require_logged_out, only: [:new, :create]

    def create
        username = params[:user][:username]
        password = params[:user][:password]
        @user = User.find_by_credentials(username, password)

        if @user
            login(@user)
            redirect_to user_url(@user.id)
        else
            flash.now[:errors] = ['Invalid credentials']
            render :new
        end

    end

    def new
        render :new
    end

    def destroy
        logout
        flash[:messages] = ["Successfully logged out"]
        redirect_to new_session_url
    end
    
end
