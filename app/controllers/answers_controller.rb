class AnswersController < ApplicationController
  before_action :authenticate_user!
  def create
    @question = Question.find(params[:question_id])
    @question.answers.create(set_params.merge(user_id: current_user.id))
    redirect_to  question_path(@question)
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(set_params.merge(user_id: current_user.id))
    @question = @answer.question
    redirect_to  question_path(@question)

  end
  private

  def set_params
    params.require(:answer).permit(:body, :question_id, :user_id)
  end
end
