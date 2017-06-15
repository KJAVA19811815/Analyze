class FormsController < ApplicationController

#http_basic_authenticate_with name: ENV["HTTP_AUTH_NAME"], password: ENV["HTTP_AUTH_PASS"]

def index
  @form = Form.all
end

def new
  form = Form.new
end

def create
  form = Form.new(form_params)
  if form.save
    redirect_to '/forms/:id'
  else
    render :new
  end
end

private

def form_params
  params.require(:form).permit(:name, :description, :questions, :options)
end



end
