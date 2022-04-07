class Weblink < ApplicationRecord
	has_many :appearances
	validates :title, :url, presence: true
end
