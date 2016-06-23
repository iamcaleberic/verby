class Writer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :penname, uniqueness: true
  has_many :publications

 #  send email after sign up
  after_create :send_welcome_email

  def send_welcome_email
	  WriterMailer.welcome_email(self).deliver
  end
end
