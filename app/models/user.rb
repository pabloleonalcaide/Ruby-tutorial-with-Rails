class User < ActiveRecord::Base

    before_save { self.email = email.downcase }
    valid_mail_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name,  presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 }, 
        format: {with: valid_mail_regex}, 
        uniqueness: { case_sensitive: false }
    
    validates :password, presence: true, length: { minimum: 6 }
    has_secure_password  # to works, it requires an attribure 'pasword_digest' in the model

    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
end