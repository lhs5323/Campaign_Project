require 'rails_helper'

describe VolunteersController do
    
    describe 'adding a user as a volunteer' do
        it 'allows a user to submit their volunteer information' do
            
            
            #.with({:name =>  "Casey"})
            post :create, {:name => "Casey", :twitter_key => "a", :twitter_secret_key => "b", :user_ID => 1} do
                expect(Volunteer).to receive(:create)
            end
        end
        it 'redirects the user to twitter authentication when they submit the form' do
            post :create, {:name => "Casey", :twitter_key => "a", :twitter_secret_key => "b", :user_ID => 1} do
                expect(response).to redirect_to('/oauth/authenticate')
            end
        end
        it 'loads the users tasks when they are authenticated' do
            get :home, nil, {:user_id => 1} do
                response.code.should eq("200")
                expect(response).to redirect_to("volunteers/1/tasks")
            end
        end
        it 'loads the new volunteer page if not logged in' do
            get :home do
                response.code.should eq("200")
                expect(response).to redirect_to("volunteers/new")

            end
        end
    end
end