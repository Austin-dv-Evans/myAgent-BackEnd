class Musician < ApplicationRecord
    has_many :gigs
    has_secure_password 
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true
end
