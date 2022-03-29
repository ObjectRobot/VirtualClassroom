class Announcement2 < ApplicationRecord
	has_many :appearances
	validates :title, :body, presence: true
end
