class ResultsController < ApplicationController

  def index
    search = params[:search]
    if search
      results = Question.joins(choices: {answers: [:user]}).
      select("questions.id as question_id","question_name", "answers.id as answer_id", "choices.id as choice_id", "choices_name", "users.name", "users.sex", "users.age")
      if Question::AGE_FILTERS.include? Question.const_get(search.upcase)
        results = results.where("users.age IN (?)", Question.const_get(search.upcase))
      elsif Question::GENDER_FILTERS.include? Question.const_get(search.upcase)
        results = results.where("users.sex = ?", Question.const_get(search.upcase))
      end
      @all = {}
      results.group_by(&:question_id).each do |question_id, results|
        question = {}
        results.group_by(&:choice_id).each do |choice_id, results|
          question[results.first.choices_name] = results.length
        end
        @all[results.first.question_name] = question
      end

    else
      @all = {}
    end
  end

  def new

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
  end

  def example
    @all = Choice.joins(:question, answers: [:user]).
    select( "questions.question_name", "questions.id as question_id", "answers.id as answer_id", "choices_name", "users.name", "users.sex", "users.age")

    result = {
      all: @all
    }
    render json: result
  end
end
