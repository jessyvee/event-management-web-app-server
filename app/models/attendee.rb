class Attendee < ActiveRecord::Base
  has_many :newsletters
end
  