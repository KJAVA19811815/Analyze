class SurveyController < ApplicationController
  skip_before_action :verify_authenticity_token

  def sms
    user_response = params[:Body]
    from = params[:From]
    render xml: SMS::ReplyProcessor.process(user_response, from, cookies)
  end

  def welcome_message_for_voice(survey)
    Twilio::TwiML::Response.new do |r|
      r.Say "thank you for taking the #{survey.title} survey"
      r.Redirect question_path(survey.first_question.id), method: 'GET'
    end.to_xml
  end

end
