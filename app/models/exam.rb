class Exam < ApplicationRecord
    has_many :exam_passeds, dependent: :destroy
    belongs_to :tags
end
  