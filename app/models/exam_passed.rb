class ExamPassed < ApplicationRecord
    belongs_to :user
    belongs_to :exam

    scope :number_of_passed_exams, -> id {where("user_id = ?", id).count}
    scope :avg_score_of_passed_exams, -> id {where("user_id = ?", id).average(:score).round}
end