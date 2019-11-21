class Conferenceroom < ApplicationRecord
    belongs_to :facility
    has_many :schedules, dependent: :destroy
    
    accepts_nested_attributes_for :schedules
end
