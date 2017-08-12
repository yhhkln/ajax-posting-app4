class Post < ApplicationRecord
	validates_presenct_of :content
	belongs_to :user
end
