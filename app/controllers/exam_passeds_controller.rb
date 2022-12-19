class ExamPassedsController < ApplicationController
    def new
        @exam_passed = current_user.exam_passeds.build(:exam_id => params[:exam_id])
        @questions = @exam_passed.exam.questions
        @exam_passed.save
    end

    def update
        @exam_passed = current_user.exam_passeds.find(params[:id])

        if @exam_passed.update(exam_passed_params)
            redirect_to new_exam_exam_passed_vote_path(@exam_passed.exam_id, @exam_passed.id)
        else
            render :new
        end
    end

    def show
        @exam_passed = ExamPassed.find(params[:id])
    end

    private
    
    def exam_passed_params
        params.require(:exam_passed).permit(answers_attributes: [:question_id, :option_id])
    end
end