class TaskTemplate < ActiveRecord::Base
    attr_accessible :task_ID, :task_type, :duration, :progress, :goal, :points, :units
end