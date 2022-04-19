class Webfile < ApplicationRecord
	has_many :appearances
	validates :title, :download, presence: true
	has_one_attached :image
end
