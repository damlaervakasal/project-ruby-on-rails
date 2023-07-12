class Card < ApplicationRecord

    has_many :comments, dependent: :destroy
    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 5}
    enum :status, [:draft, :published, :archived, :trash]

    
end
