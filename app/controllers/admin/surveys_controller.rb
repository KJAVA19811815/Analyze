class Admin::SurveysController < ApplicationController

#http_basic_authenticate_with name: ENV["HTTP_AUTH_NAME"], password: ENV["HTTP_AUTH_PASS"]

def index
  @survey = Survey.new
end

def new
end

def create
end



end
