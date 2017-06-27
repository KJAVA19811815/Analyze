class HomesController < ApplicationController

  def index
     @user = User.find_by(params[:name])

  end
end
