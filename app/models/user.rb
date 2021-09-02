class User < ActiveRecord::Base
    has_secure_password
    has_many :pizzas

    validates :username, presence: true, uniqueness: true, length: { minimum: 4 }, format: { with: /\A[a-zA-Z]+\z/, message: "cannot contain blank space, numbers, or special characters" }
    validates :email, presence: true, format: { with: /[^@]+@[^\.]+\..+/, message: "must be in format xxxx@xxxx.xxx"}
    validates :password, presence: true, length: { in: 6..20 }

end