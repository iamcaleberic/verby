class Publication < ActiveRecord::Base
  	self.per_page = 8
  	validates :title, presence: true
	validates :body, presence: true
	validates :pen_name, presence: true
	belongs_to :writer
	belongs_to :superuser
	serialize :title
	serialize :body
	serialize :pen_name
	serialize :genre
	serialize :tags
	
end
