class TaskTemplatesController < ApplicationController
  def show
    id = params[:id]
    @Task_template = TaskTemplate.find(id)
  end
  
  def index
    @task_templates = TaskTemplate.all
    puts @task_templates.to_s
  end
  

  def create
    @task_template = TaskTemplate.create!(params[:task_template])
    flash[:notice] = "#{@task_template.task_type} was successfully created."
    redirect_to directors_path
  end
  
  def edit
    @task_template = TaskTemplate.find params[:task_id]
  end

  def update
    @task_template = TaskTemplate.find params[:id]
    @task_template.update_attributes!(params[:task_template])
    flash[:notice] = "#{@task_template.task_type} was successfully updated."
    redirect_to directors_path(@task_template)
  end

  def destroy
    @task_template = TaskTemplate.find(params[:task_id])
    @task_template.destroy
    flash[:notice] = "#{@task_template.title} deleted."
    redirect_to directors_path
  end
  
end