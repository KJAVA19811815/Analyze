class FormsController < ApplicationController

#http_basic_authenticate_with name: ENV["HTTP_AUTH_NAME"], password: ENV["HTTP_AUTH_PASS"]

def index
  @form = Form.all
end

def new
  @form = Form.new
  #@question = Question.new
  #@form.build_question
  #@form.build_options

end

def create

  #puts params

  @form = Form.new(form_params)
  #@question = Question.new(question_params)

  if @form.save

    @questions = params['questions'].map do |q|
      #Question.new(form_id: @form.id, question_name: q)
      #Question.new(form_id: @form.id, question_name: q)
      ques = Question.new(form_id: @form.id, question_name: q)
      ques.save

      @choices = params['choices'].map do |choice|
        Choice.new(question_id: ques.id, choices_name: choice ).save
      end


    end

    #@choices = params['choices'].map do |choice|
      #Choice.new(question_id: @question.id, choices_name: choice ).save

  #  end
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
