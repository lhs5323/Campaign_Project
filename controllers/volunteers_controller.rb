class VolunteersController < ApplicationController
    # def show
    #     @volunteer = Volunteer.find(1)
        
    # end
    
    def index
        @volunteer = Volunteer.all
    end
    
    def create
        puts params
        if session.include? :user_id
            # @volunteer = Volunteer.find(session[:user_id])
            redirect_to volunteer_tasks_path(session[:user_id])
        else
            @volunteer = Volunteer.create!(params[:volunteer])
            @volunteer.total_points = 0
            flash[:notice] = "#{@volunteer.name} was successfully created."
        #session["create_params"] = params[:volunteer]
            puts params.to_s
        #puts "volunteer_controller-param:16 "+ params[:volunteer].to_s
            redirect_to login_path
        end
    end
    
    def home
        if session.include? :user_id
            redirect_to volunteer_tasks_path(session[:user_id])
        else 
            redirect_to new_volunteer_path
        end
    end
    def edit
    end
    def update
    end
    def destroy
    end
    def quickLogin
        session[:user_id] = 1
        @volunteer = Volunteer.create!(:name => "TEST", :user_ID => 1, :total_points => 0, :twitter_key => "1", :twitter_secret_key => "1")

        redirect_to volunteer_tasks_path(1)
    end
end