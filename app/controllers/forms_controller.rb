class FormsController < ApplicationController

def index
  @form = Form.all
end

def new
  @form = Form.new
end

def create
  #CREATION OF THE FROM DATA IS STORED IN 3 SEPERATE TABLES - QUESTIONS - ANSWERS - FORMS
  @form = Form.new(form_params)
  if @form.save
    params['questions'].each do |q|
      question = Question.create(form_id: @form.id, question_name: q)
      params['choices'].each do |choice|
        Choice.create(question_id: question.id, choices_name: choice )
      end
    end
    redirect_to @form
  else
    render :new
  end
end

def show
  @form = Form.find(params[:id])
end

private

def form_params
  params.require(:form).permit(:name, :description)
end

def question_params
  params.require(:question).permit(:question_name)
end



end
