class Exam < ApplicationRecord
    belongs_to :tag
    has_many :exam_passeds, dependent: :destroy
    has_many :votes, dependent: :destroy

    scope :new_exams, ->{order(:created_at).limit(5).includes(:tag)}
    scope :popular_exams, ->{joins(:votes).group(:id).order("COUNT(exams.id) DESC").limit(5).includes(:tag)}
    scope :suggestion_exams, -> id{where("tag_id in (select id from user_tags where user_id = ? )", id).includes(:tag)}
    scope :completed_exams, ->{includes(:tag)}
    scope :passed_exams_count, -> {joins(:votes).group(:id).count}
end
  