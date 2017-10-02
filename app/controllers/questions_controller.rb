class QuestionsController < ApplicationController
  before_action :question_params, only: [ :show, :edit, :update, :destroy]
  def index
   @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = Question.create(set_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def update
    @question.update(set_params)
    if @question.save
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to question_path

  end
  private
  def question_params
    @question = Question.find(params[:id])
  end
  def set_params
    params.require(:question).permit(:title, :body)
  end
end
