class User < ActiveRecord::Base
  has_many :animals, dependent: :destroy

  validates :name, presence: true
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 55}, format: {with: EMAIL_REGEX}, uniqueness: {case_sensitive: false}

    has_secure_password
  validates :password, presence: true, length: {minimum: 7}


end
