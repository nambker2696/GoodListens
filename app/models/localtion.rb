class Localtion < ApplicationRecord
	has_many :songs, dependent: :destroy
	has_many :singers, dependent: :destroy
end
