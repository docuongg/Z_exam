class ExamPassed < ApplicationRecord
    belongs_to :user
    belongs_to :exam

    has_many :questions, through: :exam
    has_many :answers
    
    accepts_nested_attributes_for :answers

    scope :number_of_passed_exams, ->  {count}
    scope :avg_score_of_passed_exams, -> {average(:score).round}

    before_save :set_score, :set_name, :set_finish_time

    private

    def set_score
        @correct_option = Option.get_correct_option(exam_id)

        option_array = @correct_option.size == answers.size && @correct_option.map(&:id) & answers.map(&:option_id)

        self.score = (option_array.length*1.0 / @correct_option.length * 100 ).round
    end

    def set_name
        self.name = Exam.find(exam_id).name
    end

    def set_finish_time
        self.finishAt = Time.now()
    end
end