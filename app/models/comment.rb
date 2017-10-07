class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user

  acts_as_tree order: "created_at ASC"

  CREATE_PARAMS = %i(
    content
    user_id
    review_id
    parent_id
  )
end
