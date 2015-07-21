class Post < ActiveRecord::Base
	belongs_to :user
	has_one :profile, :through => :user

	has_attached_file :image, :styles =>
	validates :title, :content, :presence => true

end
