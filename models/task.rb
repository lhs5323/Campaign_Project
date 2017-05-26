class Task < ActiveRecord::Base
    belongs_to :volunteer
    attr_accessible :task_ID, :volunteer_id, :task_type, :duration, :progress, :goal, :points, :units
end