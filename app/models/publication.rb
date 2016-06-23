class Publication < ActiveRecord::Base
  include FriendlyId
  friendly_id :citation, :use => :history

	belongs_to :writer
	belongs_to :superuser

	validates :title, presence: true
	validates :body, presence: true
	validates :pen_name, presence: true
  validates :slug, presence: true

  def citation
    "#{title} by #{pen_name}"
  end

  def should_generate_new_friendly_id?
    title_changed? or pen_name_changed? || super
  end
end
