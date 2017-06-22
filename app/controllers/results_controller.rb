class ResultsController < ApplicationController

  def index
    @user = User.joins(:answers, answers:[{choice: :question}, :choice])
    #puts @user.inspect, 'USER JOIN'
    #@test = [1,2,3,4,5,6]
  end

  def example
    #@arr = []
    #@users = User.where(sex: 'male').find_each do |u|
       #@answers = u.answers
       #@choices = @answers.map { |e| e.choice }
       #@questions = @choices.map { |e| e.question }
       #$@forms = @questions.map { |e| e.form }

      #  sql = "Select * from ... your sql query here"
      #  records_array = ActiveRecord::Base.connection.execute(sql)

       #binding.pry
       @users = User.where(sex: 'female')
       @choices = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'NO')
       @answers = Answer.includes(:choice).joins(:user).where(users: {sex: 'female'})

#end

    result = {
      choices: @choices,
      users: @users,
      answers: @answers
    }
    render json: result
  end
end
