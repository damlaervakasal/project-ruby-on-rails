class User < ApplicationRecord
    has_secure_password

    before_save :downcase_email
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
    has_many :active_sessions, dependent: :destroy
    has_many :cards, dependent: :destroy

    def password_match?
      password == password_confirmation
    end
  
    private
  
    def downcase_email
      self.email = email.downcase
    end

end
