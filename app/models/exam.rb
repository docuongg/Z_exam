class Exam < ApplicationRecord
    has_many :exam_passeds, dependent: :destroy
    has_many :votes, dependent: :destroy
    belongs_to :tag
end
  