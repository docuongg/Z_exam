class ExamPassedsController < ApplicationController
    def new
        @exam_passed = current_user.exam_passeds.build(:exam_id => params[:exam_id])
        @questions = @exam_passed.exam.questions
    end

    def create
        @exam_passed = ExamPassed.new(exam_passed_params)
        if @exam_passed.save()
            redirect_to new_exam_exam_passed_vote_path(@exam_passed.id)
        else
            render :new
        end
        
    end

    private
    
    def exam_passed_params
        params.require(:exam_passed).permit(:exam_id)
    end
end