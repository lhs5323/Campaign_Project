class SessionsController < ApplicationController
# user shouldn't have to be logged in before logging in!
    skip_before_filter :set_current_user
    def create
        auth=request.env["omniauth.auth"]
        user = Volunteer.create_with_omniauth(auth)
        session[:user_id] = user.user_ID
        redirect_to volunteer_tasks_path(user.user_ID)
    end

    def destroy
        session.delete(:user_id)
        flash[:notice] = 'Logged out successfully.'
        redirect_to new_volunteer_path
    end
end