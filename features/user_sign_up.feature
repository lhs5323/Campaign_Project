Feature: Allow a volunteer to sign up for a volunteer account
  
  As a volunteer
  So that I can have an account and track my progress
  I want to be able to sign up for the service with twitter
  Background: Create a director
    Given the following directors exist:
    |name          |email                |
    |Casey Hofford |casey.hofford@gmail.com|
  Scenario: you follow the sign up with twitter link and are directed to the twitter authentiaction
    Given I am on the homepage
    When I press "signup"
    Then I should have the following query string: 
    |redirect|true|
  
  Scenario: you input your director login and go to the director page
    Given I am on the homepage
    When I log in as a director
    Then I should be on the directors page
    
  Scenario: you input nothing in an attempt to mad hack the directors page
    Given I am on the homepage
    When I press "signin"
    Then I should see "Invalid email/password combination"