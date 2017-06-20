class ResultsController < ApplicationController

  def index
    @result  = Results.join
  end

end
