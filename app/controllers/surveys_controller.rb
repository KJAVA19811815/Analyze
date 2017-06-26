class SurveyController < ApplicationController
  skip_before_action :verify_authenticity_token

  def voice
    survey = Survey.first
    render xml: welcome_message_for_voice(survey)
  end
end
