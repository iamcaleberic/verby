class Publication < ActiveRecord::Base
	belongs_to :writer
	validates :title, presence: true
	validates :body, presence: true
	validates :pen_name, presence: true
	
end
