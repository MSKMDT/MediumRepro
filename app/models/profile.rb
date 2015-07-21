class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :posts, :through => :user

	has_attached_file :picture
	validates_attachment_content_type :picture

	validates :username, :email, :picture, :presence => true
	validates :username, length: {
		minimum: 2,
		maximum: 20
	}
end
