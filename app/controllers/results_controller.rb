class ResultsController < ApplicationController

  def index
    #@result = Results.new
     #binding.pry
    @user = User.joins(:answers, answers:[{choice: :question}, :choice])
    #@form = @use.joins(:form)
    puts @user, 'USER JOIN'
    puts @form


    #@question = Question.all
  end

end
