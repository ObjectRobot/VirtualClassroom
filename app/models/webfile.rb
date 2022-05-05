class Webfile < ApplicationRecord
	has_many :appearances
	has_one_attached :image
	validates :title, presence: true

def width
	image = MiniMagick::Image.read(self.image.download)
	return image.width
end

def height

	def thumbnail
		return self.image.variant(resize: '300x300!').processed
	end

	def banner
		return self.image.variant(resize: '1200x300!').processed
	end
end
 end