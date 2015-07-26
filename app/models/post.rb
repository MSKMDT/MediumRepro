class Post < ActiveRecord::Base
	belongs_to :user
	has_one :profile, :through => :user

	validates :title, :content, :presence => true
	validates :title, uniqueness: true, length: {minimum: 10}
	validates :content, uniqueness: true, length: {minimum: 1000}
	before_save

	has_attached_file :image, :styles => { :medium => "800x800>", :thumb => "100x100>" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
