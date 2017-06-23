class ResultsController < ApplicationController

  def index
    search = params[:search]
    if search
      results = Question.joins(choices: {answers: [:user]}).
      select("questions.id as question_id","question_name", "answers.id as answer_id", "choices.id as choice_id", "choices_name", "users.name", "users.sex", "users.age").
      where(users: {sex: search})
      @all = {}
      results.group_by(&:question_id).each do |question_id, results|
        question = {}
        results.group_by(&:choice_id).each do |choice_id, results|
          question[results.first.choices_name] = results.length
        end
        @all[results.first.question_name] = question
      end
      #@all = User.joins(:answers, answers:[{choice: :question}, :choice]).
      #select("users.name, users.sex, choices.choices_name, questions.question_name, count(*) as count").
      #where(users: {sex: search}).
      #group(:choices_name)

    else
      @all = [] #Choice.joins(:question, answers: [:user]).
      # select( "questions.question_name", "answers.id", "choices_name", "users.name", "users.sex", "users.age")
    end
    #@user = User.joins(:answers, answers:[{choice: :question}, :choice]).select("users.name, users.sex, choices.choice_name")
    #@all = User.joins(:answers, answers:[{choice: :question}, :choice]).select("users.name, users.sex, choices.choices_name, questions.question_name").where(users: {"sex": 'male'})
  end
    #@choices2 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Red').length
    #@choices3 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Blue').length
    #@choices4 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Green').length
    #@choices5 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Yellow').length

  def new
    #@question = Question.find(params[:id]) # get all your choices / form info
    #@answer = Answer.new(question_id: @question.id) # use in your form

  end

  def male
    @choices = Choice.
      joins(answers: [:user]).
      where(
        users: {sex: 'male'},
        choices: {question_id: params[:question_id].to_i}
      ).
      group(:choices_name).
      count

    # @choices = Choice.joins(answers: [:user]).where(users: {sex: 'male'}, choices_name: 'No').length
    # @choices1 = Choice.joins(answers: [:user]).where(users: {sex: 'male'}, choices_name: 'YES').length
  end

  def example
       # @choices2 = Choice.joins(answers: [:user]).users
       #@choices2 = Choice.joins(answers: [:user]).where(users: {sex: 'male'})
      # @choices2 = Choice.joins(answers: [:user])
       #@answers = Answer.joins(:choice, :user).select("choices.choices_name, users.age, users.sex, users.religion")
       #@all = User.joins(:answers, answers:[{choice: :question}, :choice]).select("users.name, users.income, users.sex, choices.choices_name, questions.question_name").where(users: {"sex": 'male'})
       #@users = User.where(sex: 'male')
       #@choices = Choice.joins(answers: [:user]).where(users: {sex: 'male'}, choices_name: 'No')
       #@choices1 = Choice.joins(answers: [:user]).where(users: {sex: 'male'}, choices_name: 'YES')
       #@choices2 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Red').length
       #@choices3 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Blue').length
       #@choices4 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Green').length
       #@choices5 = Choice.joins(answers: [:user]).where(users: {sex: 'female'}, choices_name: 'Yellow').length
       #@answers = Answer.includes(:choice).joins(:user) #where(users: {sex: 'male'})
       @all = Choice.joins(:question, answers: [:user]).
       select( "questions.question_name", "questions.id as question_id", "answers.id as answer_id", "choices_name", "users.name", "users.sex", "users.age")
       #group(choices.id)
       #group(:choices_name)

    result = {
      all: @all
    }
    render json: result
  end

  #def query
  #  @q = "%#{params[:query]}%"
  #end
end
