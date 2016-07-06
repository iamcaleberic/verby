class Publication < ActiveRecord::Base
  	include FriendlyId
  	
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
	
	friendly_id :citation, :use => :history

  def citation
    "#{title} by #{pen_name}"
  end

  def should_generate_new_friendly_id?
    title_changed? or pen_name_changed? || super
  end
end
