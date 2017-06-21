class ResultsController < ApplicationController

  def index
    #@result = Results.new
     #binding.pry
    #@user = User.joins(:answers, answers:[{choice: :question}, :choice])
    #@form = @use.joins(:form)
    #puts @user, 'USER JOIN'
    #puts @form
    #@user = User.find(2).answers
    #@user2 = User.find(3).answers
    #@test = [1,2,3,4,5,6]



    #@question = Question.all
  end

  def example
    @male_count = User.where(sex: 'male').count
    @female_count = User.where(sex: 'female').count
    @question = Question.all
    result = {
      male: @male_count,
      female: @female_count,
      all: User.count,
      question: @question,
      choice: Choice.all,
      answer: Answer.all,
      form: Form.all

    }
    render json: result
  end

end
