class Review < ApplicationRecord
	belongs_to :user
	belongs_to :song
	has_many :comments
end
