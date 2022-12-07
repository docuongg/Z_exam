class ExamPassed < ApplicationRecord
    belongs_to :user
    belongs_to :exam

    scope :number_of_passed_exams, ->  {count}
    scope :avg_score_of_passed_exams, -> {average(:score).round}
end