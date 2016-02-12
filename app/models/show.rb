class Show < ActiveRecord::Base
	validates :title, presence: true
	belongs_to :user
	has_many :cues
end
