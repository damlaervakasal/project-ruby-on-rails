class Comment < ApplicationRecord
  belongs_to :card

  #enum :status, { draft: 0, published: 1, archived: 2, trashed: 3 }

end
