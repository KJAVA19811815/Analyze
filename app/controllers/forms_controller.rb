class FormsController < ApplicationController

#http_basic_authenticate_with name: ENV["HTTP_AUTH_NAME"], password: ENV["HTTP_AUTH_PASS"]

def index
  @form = Form.all
end

def new
  @form = Form.new
end

def create
  @form = Form.new(form_params)
  if @form.save
    params['questions'].each do |q|
      question = Question.create(form_id: @form.id, question_name: q)
      puts 'HELLO THIS IS IT'
      puts params['choices']
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

def destroy
  @form = Form.find(params[:id])
  @form.destroy
  flash[:success] = "form deleted"
  redirect_to "/forms"
end

private

def form_params
  params.require(:form).permit(:name, :description)
end

def question_params
  params.require(:question).permit(:question_name)
end



end
