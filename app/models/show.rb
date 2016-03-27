class Show < ActiveRecord::Base
	validates :title, presence: true
	belongs_to :user
	has_many :cues, dependent: :destroy
	has_one :show_setting, dependent: :destroy
end
