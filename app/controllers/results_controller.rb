class ResultsController < ApplicationController

  def index
    @user = User.joins(:answers, answers:[{choice: :question}, :choice])

    @choices2 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Red').length
    @choices3 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Blue').length
    @choices4 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Green').length
    @choices5 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Yellow').length

  end

  def male
    @choices = Choice.joins(answers: [:user]).where(users: {sex: 'male'}, choices_name: 'No').length
    @choices1 = Choice.joins(answers: [:user]).where(users: {sex: 'male'}, choices_name: 'YES').length
  end

  def example

      #  sql = "Select * from ... your sql query here"
      #  records_array = ActiveRecord::Base.connection.execute(sql)
       @users = User.where(sex: 'male')
       @choices = Choice.joins(answers: [:user]).where(users: {sex: 'male'}, choices_name: 'No')
       @choices1 = Choice.joins(answers: [:user]).where(users: {sex: 'male'}, choices_name: 'YES')
       #@choices2 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Red').length
       #@choices3 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Blue').length
       #@choices4 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Green').length
       #@choices5 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Yellow').length
       @answers = Answer.includes(:choice).joins(:user).where(users: {sex: 'male'})

    result = {
      choices: @choices,
      choices1: @choices1,

      # choices2: @choices2,
      # choices3: @choices3,
      # choices4: @choices4,
      # choices5: @choices5,

      users: @users,
      answers: @answers
    }
    render json: result
  end
end
