class Alexa < AlexaSkillsRuby::Handler
    on_launch { response.set_output_speech_text("What's up dog?") }

    on_intent('UserIntent') do
        slots = request.intent.slots 
        logger.info slot.inspect
        response.set_output_speech_text('Something will happen')
        # response.set_simple_card("title", "content")
        logger.info 'UserIntent processed'
    end
end
