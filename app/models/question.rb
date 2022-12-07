class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :options, dependent: :destroy
    belongs_to :exam 

    scope :get_questions_exam, ->id {where("exam_id = ?", id).includes(:exam, :options)}
end 