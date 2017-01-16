class SkillsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def agenda
    handler = Alexa.new(application_id: 'amzn1.ask.skill.67f2a14f-f87b-42d5-aa1e-35dd16de5bc1', logger: Rails.logger)
    begin
      Rails.logger.info request.body.read
      handler.handle(request.body.read)
      #render json: {bar:'zzz'}
    rescue AlexaSkillsRuby::InvalidApplicationId => e
      logger.error e.to_s
      403
    end
  end
end
