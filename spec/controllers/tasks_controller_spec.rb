require 'rails_helper'

RSpec.describe TasksController, :type => :controller do
    describe 'showing a task' do
        before :each do
            @task1= Task.create!(:task_ID => 1, :duration => 1, :progress => 0, :goal => 15, :task_type => "Canvas", :points => 30, :volunteer_id => 1, :units => "Houses")
            @task2= Task.create!(:task_ID => 2, :duration => 1, :progress => 0, :goal => 20, :task_type => "Call", :points => 25, :volunteer_id => 1, :units => "Calls")
            @task3= Task.create!(:task_ID => 3, :duration => 7, :progress => 0, :goal => 5, :task_type => "Table", :points => 40, :volunteer_id => 1, :units => "Hours")
            @task4= Task.create!(:task_ID => 4, :duration => 1, :progress => 0, :goal => 1, :task_type => "Donate", :points => 10, :volunteer_id => 1, :units => "Dollars")
            @template1= TaskTemplate.create!(:task_ID => 1, :duration => 1, :goal => 15, :task_type => "Canvas", :points => 30, :units => "Houses")
            @template2= TaskTemplate.create!(:task_ID => 2, :duration => 1, :goal => 20, :task_type => "Call", :points => 25, :units => "Calls")
            @template3= TaskTemplate.create!(:task_ID => 3, :duration => 7, :goal => 5, :task_type => "Table", :points => 40, :units => "Hours")
            @template4= TaskTemplate.create!(:task_ID => 4, :duration => 1, :goal => 1, :task_type => "Donate", :points => 10, :units => "Dollars")
        end
        
        it 'allows user show a task' do
            get :index, {:volunteer_id => 1}
            params = {:volunteer_id => 1, :id => 2}
            get :show, params
            expect(response).to render_template('show')
        end
        
        it 'allows a user to accept a task' do
            post :create, {:volunteer_id => 1,:task_id => 1} do
                expect(Task).to receive(:create)
            end
        end
        
        it "doesn't allow the user to accept a task if they have accepted one of the same type" do
            post :create, {:task_ID => 1, :duration => 1, :progress => 0, :goal => 15, :task_type => "Canvas", :points => 30, :volunteer_id => 1, :units => "Houses"} do
                expect(Task).to receive(:create)
            end
            post :create, {:task_ID => 1, :duration => 1, :progress => 0, :goal => 15, :task_type => "Canvas", :points => 30, :volunteer_id => 1, :units => "Houses"} do
                # expect
                expect(response).to redirect_to('show')
            end
        end
        
        # it 'allows a user to edit a task' do
        #     get :edit, {:volunteer_id => 1, :task_id => 1} do 
        #         expect(Task).to receive(:edit)
        #     end
        # end
   end
   describe 'updating a task' do
        before :each do
            @task1= Task.create!(:task_ID => 1, :duration => 1, :progress => 0, :goal => 15, :task_type => "Canvas", :points => 30, :volunteer_id => 1, :units => "Houses")
            Volunteer.create!(:user_ID => 1, :total_points => 0)
        end
        it 'returns to the same page when the progress update is empty' do
            put :update, {:volunteer_id => 1, :id => 1, "daily_progress" => {"daily_progress" => ""}}
            expect(response).to redirect_to('/volunteers/1/tasks/1')
        end
        it 'increments progress of a task when requested' do
            put :update, {:volunteer_id => 1, :id => 1, "daily_progress" => {"daily_progress" => 1}}
            expect(Task.find(1).progress).to eq(1)
        end
        it 'increments progress of a task when requested' do
           put :update, {:volunteer_id => 1, :id => 1, "daily_progress" => {"daily_progress" => 1}}
           expect(Task.find(1).progress).to eq(1)
        end
        it 'gives the user points when they complete a task' do
           put :update, {:volunteer_id => 1, :id => 1, "daily_progress" => {"daily_progress" => 15}}
           expect(Volunteer.find(1).total_points).to eq(30)
        end
    end
    describe 'deleting a task' do
        before :each do
            @task1= Task.create!(:task_ID => 1, :duration => 1, :progress => 0, :goal => 15, :task_type => "Canvas", :points => 30, :volunteer_id => 1, :units => "Houses")
            Volunteer.create!(:user_ID => 1, :total_points => 0)
        end
        it 'deletes a task' do
           put :destroy, {:volunteer_id => 1, :id => 1}
           expect {Task.find(1)}.to raise_error
        end
        it 'redirects to the volunteers task page' do
            put :destroy, {:volunteer_id => 1, :id => 1} do
                expect(response).to redirect_to('/volunteers/:id')
            end
        end
    end
end