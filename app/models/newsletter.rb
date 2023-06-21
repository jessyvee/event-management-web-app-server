class Newsletter < ActiveRecord::Base
    has_many :subscribers
    belongs_to :attendee
end