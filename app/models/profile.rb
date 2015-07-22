class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :posts, :through => :user

	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

	validates :username, :email, :presence => true
	validates :username, length: {
		minimum: 2,
		maximum: 20
	}
end
