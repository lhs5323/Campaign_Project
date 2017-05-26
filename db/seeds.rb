# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
tasks = Task.create([{:task_ID => 1, :volunteer_id => 1, :task_type => 'Canvassing', :duration => '3', :goal => 20, :points => 25, :units => 'Houses'},
                    ])

volunteers = Volunteer.create([{:user_ID => 1, :name => 'Casey', :twitter_key => '1', :twitter_secret_key => '1', :total_points => 0},
                    ])

directors = [{:name => 'Tierre Allen', :email => 'allet0575@gmail.com'},
             {:name => 'Eli Harkins', :email => 'eli.harkins@gmail.com'},
             {:name => 'Casey Hofford', :email => 'casey.hofford@gmail.com'},
             {:name => 'Cirl Lee', :email => 'lhs5323@gmail.com'},
            ]
directors.each do |director|
    Director.create(director)
end
    
template = TaskTemplate.create([{:task_ID => 1, :task_type => 'Phonebanking', :duration => '3', :goal => 20, :points => 25, :units => 'Calls'}])
