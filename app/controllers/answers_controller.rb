class AnswersController < ApplicationController
  def new
    @form = Form.find(params[:form_id])
    @question = @form.questions.first
    @choice = @question.choices
    @answer = Answer.new
  end

  def index
    @forms = Form.all
  end

  def create
    #answering the question and storing the corresponding user_id and choice_id in answers table
    @answer = Answer.new
    @answer.user_id = current_user.id
    choice = Choice.find_by(choices_name: params[:answer_name])
    @answer.choice_id = choice.id
    if @answer.save
      @form = Form.find(params[:form_id])
      redirect_to form_answer_path(@form, @answer)
    else
      render '/login'
    end
  end

  def show
    @forms = Form.all
  end

  def update
  end
end
