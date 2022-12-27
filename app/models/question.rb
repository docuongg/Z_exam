class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :options, dependent: :destroy
    belongs_to :exam 

    accepts_nested_attributes_for :options

    scope :get_questions_exam, ->id {where("exam_id = ?", id)}
end 