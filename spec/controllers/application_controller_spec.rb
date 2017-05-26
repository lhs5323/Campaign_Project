require 'rails_helper'
RSpec.describe ApplicationController, :type => :controller do
    describe 'faking twitter authentication' do
        it 'fakes a twitter login for capybara/cucumber' do
            get :twitter_redirect, {:params => {:oauth_token => ""}} do
                expect(response).to redirect_to('/volunteers/new?redirect=true')
            end
        end
    end
    describe 'faking twitter authentication goes home w/o oauth_token' do
        it 'fakes a twitter login for capybara/cucumber' do
            get :twitter_redirect, {:params => {:oauth_token => ""}} do
                expect(response).to redirect_to('/')
            end
        end
    end
end