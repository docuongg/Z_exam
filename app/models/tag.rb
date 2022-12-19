class Tag < ApplicationRecord
    has_many :exams, dependent: :destroy
    has_many :user_tags, dependent: :destroy
    
end