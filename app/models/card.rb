class Card < ApplicationRecord

    has_many :comments, dependent: :destroy

    has_many :assignments, dependent: :destroy
    has_many :users, through: :assignments

    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 5}

    enum :status, [:draft, :published, :archived, :trash]
    enum :category, [:todo, :underway, :done ]
    
    belongs_to :user

    
    after_create_commit -> { broadcast_prepend_to "card_cable", target: category, partial:"cards/card", locals: {card: self}}

    
end
