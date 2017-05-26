class DirectorsController < ApplicationController
  def show
    id = params[:id]
    @Director = Director.find(id)
    
  end
  
  def index
    @task_templates = TaskTemplate.all
  end
  
  def edit
    @task_template = TaskTemplate.find params[:id]
  end
  
  def create
    puts params.to_s
    director = Director.find_by email: params[:director][:email]
    if director 
      redirect_to directors_path
    else
      flash[:notice] = 'Invalid email/password combination'
      redirect_to root_path
    end
    
  end
  
  def show
    id = params[:id]
    @Task_template = TaskTemplate.find(id)
  end
  
  def destroy
    @task_template = TaskTemplate.find(params[:id])
    @task_template.destroy
    flash[:notice] = "#{@task_template.task_type} deleted."
    redirect_to directors_path
  end
  
end
