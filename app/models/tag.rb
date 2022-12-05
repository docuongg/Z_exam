class Tag < ApplicationRecord
    has_many :exams, dependent: :destroy
    has_many :user_tags, dependent: :destroy
    
    scope :of, -> id {where("tags.id in (select id from user_tags where user_id = ?)", id)}
end