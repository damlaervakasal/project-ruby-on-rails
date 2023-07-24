class Card < ApplicationRecord

    has_many :comments, dependent: :destroy
    has_many :assignments
    has_many :users, through: :assignments

    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 5}

    enum :status, [:draft, :published, :archived, :trash]
    enum :category, [:todo, :underway, :done ]
    
    belongs_to :user

    
end
