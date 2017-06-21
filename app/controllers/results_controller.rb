class ResultsController < ApplicationController

  def index
    @user = User.joins(:answers, answers:[{choice: :question}, :choice])
    puts @user.inspect, 'USER JOIN'
    #@test = [1,2,3,4,5,6]
  end

  def example
    @user = User.find_by(sex: 'female')
    #@answer = @user.answers.map { |e| e.choice  }
    #@question = @answer.map { |e| e.question  }
    #@form = @question.map { |e| e.form  }

    #@users = User.all
    #@answer = @users.map { |e| e.answers  }
    #@choice = @answer.map {  |e| e.choices  }
    # @new_items = []
    # items = [1,2,3,4]
    # items.map do |item|
    #   @new_item << { original: item, double: (2 * item) }
    # end
    @arr = []
    @users = User.where(sex: 'male').find_each do |u|
       @answers = u.answers
       @choices = @answers.map { |e| e.choice }
       @questions = @choices.map { |e| e.question }
       @forms = @questions.map { |e| e.form }

       @users.map do |item|
         @arr << {item: item}
       end

       #binding.pry


    end

    result = {
      users: @users,
      #answer: @answer,
      #choice: @choice
      user: @user,
      answers: @answers,
      choices: @choices,
      questions: @questions,
      forms: @forms
      #answer: @answer,
      #question: @question,
      #form: @form
    }
    render json: result
  end

end
