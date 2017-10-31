class Album < ApplicationRecord
  belongs_to :singer, class_name: 'Singer', foreign_key: 'singer_id', primary_key: 'id'
end
