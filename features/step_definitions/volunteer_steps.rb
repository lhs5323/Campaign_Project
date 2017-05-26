require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /the following (.*) exist/ do |type, table|
    if type == "volunteers"
        table.hashes.each do |row|
            Volunteer.create!(row)
        end
    elsif type == "tasks"
        table.hashes.each do |row|
            Task.create!(row)
        end
    elsif type == "task_templates"
        table.hashes.each do |row|
            TaskTemplate.create!(row)
        end
    elsif type == "directors"
        table.hashes.each do |row|
            Director.create!(row)
        end
    end
end

Given /I am logged in/ do
    fakelogin_path
end

Then /^I should see (.*) with (.*)$/ do |progress, some_number|
    expect(page).to have_content(/#{progress}.*#{some_number}/m)
end

Then /^the progress of (.*) should be (.*)$/ do |task_ID, progress|
    expect(page).to have_content(/#{task_ID}.*#{progress}/m) 
end

When /^(?:|I )fill out the (.*) form$/ do |form|
    if form == "signup"
        steps %Q{When I fill in "name_name" with "TEST"}
    else
        raise "Form not found"
    end
end

When /^I am the user with ID: (.*)$/ do |user|
    @volunteer_id = Volunteer.where("name = " + user).id
    session[:user_id] = @volunteer_id
end

When /^I accept the task: (.*)$/ do |task_ID|
    step %Q{When I press "accept_#{task_ID}"}
end

When /^I log in as a director$/  do
    step %Q{I fill in "Casey Hofford" for "director_name"}
    step %Q{I fill in "director_email" with "casey.hofford@gmail.com"}
    step %Q{I press "signin"}
end


When /^I submit the form$/ do
  page.evaluate_script("document.forms[0].submit()")
end


Then /^I should be going to "(.*)"/ do |url|
    expect(page.current_path).to eq url
end

Then /^There should be (\d*) accepted tasks$/ do |length|
    rows = 0
    within("table#current_tasks") do
        all('tr').each { |row| rows += 1 }
    end
    expect(rows).to eq length.to_i
end