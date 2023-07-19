class User < ApplicationRecord
    has_secure_password

    before_save :downcase_email
  
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  
    has_many :active_sessions, dependent: :destroy

    private
  
    def downcase_email
      self.email = email.downcase
    end
  
end
