require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
    describe "create a volunteer" do
        it 'should redirect to your tasks page' do
            fake_user = double(:user_ID => 1)
            allow(Volunteer).to receive(:create_with_omniauth) {fake_user}
            get :create, provider: 'twitter' do
                expect(response).to redirect_to('/volunteers/:id')
            end
        end
    end
    
end