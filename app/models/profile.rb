class Profile < ActiveRecord::Base
	belongs_to :user
	has_many :posts, :through => :user

	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "50x50>" }
	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

	validates :username, :picture, :presence => true
	validates :username, length: {
		minimum: 2,
		maximum: 20
	}
end
