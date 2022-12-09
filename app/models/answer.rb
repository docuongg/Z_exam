class Answer < ApplicationRecord
    belongs_to :option
    belongs_to :question
    belongs_to :exam_passed
end