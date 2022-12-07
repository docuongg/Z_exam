class Option < ApplicationRecord
    belongs_to :question

    scope :get_correct_option, -> exam_id {where("exam_id = ?", exam_id).joins(:question).where("options.isCorrect = true")}
end