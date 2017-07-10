class ResultsController < ApplicationController

  #USING CONSTANTS TO SEARCH FOR USER ATTRIBUTES
  #ALSO USED DYNAMIC SQL QUERY USING THE SEARCH BAR TO DISPLAY RESULTS
  def index
    search = params[:search]
    if search
      # 4 TABLE JOIN TO GET THE DATA I NEEDED TO POPULATE THE CHARTS
      results = Question.joins(choices: {answers: [:user]}).
      select("questions.id as question_id","question_name", "answers.id as answer_id", "choices.id as choice_id", "choices_name", "users.name", "users.sex", "users.age")
      # AGE CONSTANT IS 'young' 'middle' 'old'
      if Question::AGE_FILTERS.include? Question.const_get(search.upcase)
        results = results.where("users.age IN (?)", Question.const_get(search.upcase))
      # GENDER CONSTANT IS 'male' 'female'
      elsif Question::GENDER_FILTERS.include? Question.const_get(search.upcase)
        results = results.where("users.sex = ?", Question.const_get(search.upcase))
      end
      @all = {}
      results.group_by(&:question_id).each do |question_id, results|
        question = {}
        results.group_by(&:choice_id).each do |choice_id, results|
          # DATA VALUE TO SEE HOW MANY TIMES CERTAIN CHOICES WERE CHOSEN BY USERS
          question[results.first.choices_name] = results.length
        end
        @all[results.first.question_name] = question
      end

    else
      @all = {}
    end
  end

  def example
    #JSON CALL JUST TO SEE THE DATA FROM JOIN TABLE TO TEST THE TABLE JOIN, IT CAN BE SEEN AT '/example'
    @all = Choice.joins(:question, answers: [:user]).
    select( "questions.question_name", "questions.id as question_id", "answers.id as answer_id", "choices_name", "users.name", "users.sex", "users.age")

    result = {
      all: @all
    }
    render json: result
  end
end
