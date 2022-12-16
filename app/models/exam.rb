class Exam < ApplicationRecord
    belongs_to :tag
    has_many :exam_passeds, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :questions, dependent: :destroy

    scope :new_exams, ->{order(:created_at).limit(5).includes(:tag)}
    scope :popular_exams, ->{joins(:votes).group(:id).order("COUNT(exams.id) DESC").limit(5).includes(:tag)}
    scope :suggestion_exams, -> {where("tag_id in (select id from user_tags where user_id = ? )", id).includes(:tag)}
    scope :by_id, -> ids {where(tag_id: ids)}

    scope :passed_exams_count, -> {joins(:votes).group(:id).order("count_all DESC").limit(5).count}
    scope :get_info_exam, ->id {includes(:tag).find(id)}
    scope :avg_rate, ->{votes.average(:rate).round(1)}
end
  