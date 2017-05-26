Feature: Allow a volunteer to receive points based on the tasks
  
    As a volunteer
    I want to be able to be assigned points based on tasks
    So that I can track my total points
    
  Background: volunteers in database
    
  Scenario: routes to test progress hompage 
      
    Given the following tasks exist:
  |task_ID  |volunteer_id |task_type   |duration |progress |goal |points | 
  |1        |1            |Canvas      |1        |0        |20   |50     |              
  |2        |1            |Call        |7        | 0       |10   |25     |              
  |3        |1            |Donate      |1        |0        |5    |10     |              
  |4        |1            |Table       |1        |0        |3    |35     |
    
    Given I am on the task progress page for task 1
    And I should see "Canvas" 
    And I should see "50"
    When I fill in "daily_progress_daily_progress" with "10"
    And I press "updates_progress"
    Then I should see "10"
    
  
    
  #And  I fill in "total_points" with 10
  #And the points of 1 should be 10  

    
