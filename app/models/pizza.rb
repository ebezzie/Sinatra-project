class Pizza < ActiveRecord::Base
    belongs_to :user

    validates :name, presence: true
    validates :description, presence: true
    validates :ingredients, presence: true 
end