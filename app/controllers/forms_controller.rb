class FormsController < ApplicationController

#http_basic_authenticate_with name: ENV["HTTP_AUTH_NAME"], password: ENV["HTTP_AUTH_PASS"]

def index
  @form = Form.all
end

def new
  form = Form.new
end

def create
  form = Form.new(name: params[:name], description: params[:description])

  question = Question.new(question_name: params[:question_name])
  form.questions << question

  option = Option.new(options_name: params[:options_name])
  form.options << option

  #@form = Form.create(all the params
  #@question = @form.question.create(paramas from form)
  #@quesion.options.create()






  if form.save && question.save && option.save
    redirect_to @form
  else
    render :new
  end
end

private

#def form_params
#  params.require(:form).permit(:name, :description, :questions, :options)
#end



end
