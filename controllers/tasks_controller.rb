class TasksController < ApplicationController
    def show
        @completed = false
        id = params[:id]
        @task = Task.find(id)
    end
    
    def index
        @volunteer_id = params[:volunteer_id]
        @volunteer = Volunteer.find_by_user_ID(@volunteer_id)
        @current_tasks = Task.where("volunteer_id = "+params[:volunteer_id])
        @suggested_tasks = TaskTemplate.all
    end
    
    def create
        #params.require(:volunteer_id).permit(:task_id)
        matching_task_type = Task.where("task_type = ? AND volunteer_id = ?", params[:task_type], params[:volunteer_id])
        if matching_task_type.length > 0
            flash[:notice] = "Complete your current " + params[:task_type] + " task before adding another one."
            # flash[:notice] = matching_task_type
            redirect_to volunteer_tasks_path(params[:volunteer_id])
        else
            template = TaskTemplate.find(params[:task_id]).as_json
            template.delete(:id)
            template[:volunteer_id] = params[:volunteer_id]
            template[:progress] = 0
            puts"*************"+params.to_s
            @task = Task.create!(template)
            redirect_to volunteer_task_path(params[:volunteer_id],@task.id)
        end
    end
    
    def new
    end
    
    # def edit
    #     @task = Task.find(id)
    # end
    
    def update
        id = params[:id]
        @task = Task.find(id)
        if params['daily_progress']['daily_progress'] == ""
            flash[:notice] = "You need to reach the goal of #{@task.goal}"
            redirect_to volunteer_task_path(params[:volunteer_id],@task.id)
        
        else params['daily_progress']['daily_progress'] != ""
            @task.update_attribute(:progress, @task.progress+params['daily_progress']['daily_progress'].to_i)
            puts "*****"+@task.progress.to_s+"*******"+@task.id.to_s
            if @task.progress < @task.goal
                flash[:notice] = "You should reach '#{@task.goal}'"
                redirect_to volunteer_task_path(params[:volunteer_id],@task.id)
            elsif @task.progress == @task.goal || @task.progress > @task.goal
                flash[:notice] = "You have reached your '#{@task.goal}'!!"
                @volunteer_id = params[:volunteer_id]
                @volunteer = Volunteer.find_by_user_ID(@volunteer_id)
                @volunteer.total_points = @volunteer.total_points + @task.points
                @volunteer.save
                params[:id] = @task.id
                destroy
                # redirect_to {:path => '/volunteers/'+params[:volunteer_id]+'/tasks/'+@task.id, method: :delete}
                
            end
        end
        
    end
    
    def destroy
        Task.destroy(params[:id])
        redirect_to volunteer_tasks_path(params[:volunteer_id])
    end
    
end