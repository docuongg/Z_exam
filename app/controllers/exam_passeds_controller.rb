class ExamPassedsController < ApplicationController
    def new
        @exam_passed = current_user.exam_passeds.build(:exam_id => params[:exam_id])
        @questions = @exam_passed.exam.questions
    end

    def create
        @exam_passed = current_user.exam_passeds.build(exam_passed_params.merge(exam_id: params[:exam_id]))

        if @exam_passed.save
            redirect_to new_exam_vote_path(@exam_passed.exam_id)
        else
            render :new
        end
    end

    private
    
    def exam_passed_params
        params.require(:exam_passed).permit(answers_attributes: [:question_id, :option_id])
    end
end