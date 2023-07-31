class Comment < ApplicationRecord
  belongs_to :card
  belongs_to :user
  #enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }

end
