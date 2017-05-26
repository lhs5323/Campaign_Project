Feature: Add a task to the available task options
  
  As a director
  So that volunteers can choose a task to complete
  I want to be able to add tasks
  
  
Scenario: Add the task to the task table
  Given I am on the Director page
  When I follow "Add a new task"
  Then I should be on the Add New Task page
  When I fill in "Type" with "Donate"
  And I select "1" from "Duration"
  And I fill in "Goal" with "100"
  And I fill in "Units" with "dollars"
  And I press "Save Task"
  Then I should be on the Director page
  And I should see "Donate"
  And I should see "1"
  And I should see "100"
  And I should see "dollars"
  
  