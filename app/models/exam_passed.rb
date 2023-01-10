class ExamPassed < ApplicationRecord
    belongs_to :user
    belongs_to :exam

    has_many :questions, through: :exam
    has_many :answers
    
    accepts_nested_attributes_for :answers, reject_if: -> answer { answer[:option_id].blank? }
    
    scope :number_passed_exams, -> {count}
    scope :passed_exams_avg_score, -> {average(:score).round}
    scope :best_completed_exams, -> {group(:exam_id).having('MAX(score) >= score')}
    
    before_save :set_name
    before_update :set_score

    private

    def set_score
        @correct_option = Option.get_correct_option(exam_id)

        option_array = @correct_option.map(&:id) & answers.map(&:option_id)
    
        self.score = (option_array.length*1.0 / @correct_option.length * 100 ).round
    end

    def set_name
        self.name = Exam.find(exam_id).name
    end
    
end