class VotesController < ApplicationController
    def new
        @vote = current_user.votes.build(:exam_id => params[:exam_id])
    end

    def create
        @vote = current_user.votes.build(vote_params.merge(:exam_id => params[:exam_id]))

        if @vote.save
            redirect_to exam_exam_passed_path(params[:exam_id], params[:exam_passed_id])
        else
            render :new
        end
    end

    private
    def vote_params
        params.require(:vote).permit(:comment, :rate)
    end
end