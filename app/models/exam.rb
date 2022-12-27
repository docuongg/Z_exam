class Exam < ApplicationRecord
    belongs_to :tag
    has_many :exam_passeds, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :questions, dependent: :destroy

    accepts_nested_attributes_for :questions

    scope :new_exams, ->{order(:created_at)}
    scope :popular_exams, ->{joins(:votes).group(:id).order("COUNT(exams.id) DESC")}
    scope :suggestion_exams, -> {where("tag_id IN (SELECT id FROM user_tags WHERE user_id = ? )", id)}
    scope :by_id, -> ids {where(tag_id: ids)}

    scope :passed_exams_count, -> {joins(:votes).group(:id).order("count_all DESC").count}
    scope :avg_rate, ->{votes.average(:rate).round(1)}
end
  