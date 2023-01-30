class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }

  before_save :format_email

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    user && user.authenticate(password)
  end

  private
    def format_email
      self.email = email.downcase.strip
    end
  
end
