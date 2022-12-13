class Answer < ApplicationRecord
    belongs_to :option
    belongs_to :question
    belongs_to :exam_passed

    scope :get_array_answers_by, -> array_options {where("option_id IN ?", array_options)}
end