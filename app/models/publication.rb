class Publication < ActiveRecord::Base
	belongs_to :writer
	belongs_to :superuser

	validates :title, presence: true
	validates :body, presence: true
	validates :pen_name, presence: true
	
end
