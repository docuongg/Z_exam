class Exam < ApplicationRecord
    belongs_to :tag
    has_many :exam_passeds, dependent: :destroy
    has_many :votes, dependent: :destroy
    has_many :questions, dependent: :destroy
    has_one_attached :image
    has_many :users, through: :exam_passeds
    has_many :notifications, dependent: :destroy
    accepts_nested_attributes_for :questions, reject_if: -> question { question[:title].blank? }

    after_create :create_new_notification

    scope :new_exams, ->{order(created_at: :DESC)}
    scope :popular_exams, ->{joins(:votes).group(:id).order("COUNT(exams.id) DESC")}
    scope :suggestion_exams, -> {where("tag_id IN (SELECT id FROM user_tags WHERE user_id = ? )", id)}
    scope :by_id, -> ids {where(tag_id: ids)}

    scope :passed_exams_count, -> {joins(:votes).group(:id).order("count_all DESC").count}
    scope :avg_rate, ->{votes.average(:rate).round(1)}

    private

    def create_new_notification
        self.tag.users.each do |user|
            noti = user.notifications.build(:exam_id => self.id)
            noti.body = "#{self.name} : There is a new exam on the topic you are interested in has just been posted"
            noti.save
        end
    end
end