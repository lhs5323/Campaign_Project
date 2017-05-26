Feature: Allow volunteer to view or quit accepted tasks
  
  As a volunteer
  I want to be able to see my tasks upon authentication
  So that I can manage/view my goals
  
Background: tasks in Database
      
  Given the following tasks exist:
  |task_ID  |volunteer_id |task_type   |duration |progress |goal |points |units   | 
  |1        |1            |Canvas      |1        |10       |20   |50     |Houses  |              
  |2        |1            |Donate      |1        |0        |5    |10     |Dollars |              
  |3        |1            |Table       |1        |0        |3    |35     |Hours   | 


  Given the following task_templates exist:
  |task_ID  |task_type   |duration |goal |points |units   |
  |1        |Canvas      |1        |20   |50     |Houses  |              
  |2        |Call        |7        |10   |25     |Calls   |              
  |3        |Donate      |1        |5    |10     |Dollars |             
  |4        |Table       |1        |3    |35     |Hours   | 

   Given the following volunteers exist:
  |id |name   |twitter_key |user_ID |total_points |twitter_secret_key|
  |1  |"Casey"|"1"         |1       |0            |"1"               |
  

Scenario: Show already accepted task
    Given I am logged in
    And I am on the volunteer page
    When I follow "accept_1"
    When I follow "show_1"
    Then I should be on the task progress page for task 1
    
Scenario: Quit accepted task
    Given I am logged in 
    And I am on the volunteer page
    When I follow "accept_1"
    When I follow "quit_1"
    Then I should be on the volunteer page
    And I should not see "Task progress for Canvas for Goal: 20"
    