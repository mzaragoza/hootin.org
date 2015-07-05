class Api::V1::TwilioController < ApiController
  include Webhookable

  def inbound_call
    user = User.where(available: true).shuffle.first
    if user
      response = Twilio::TwiML::Response.new do |r|
        r.Dial callerId: '' do |d|
          d.Number user.phone
        end

      end
      user.available = false
      user.save
      call = Call.new
      call.from = params[:From] || ' '
      call.to = user.id
      call.answered =  ' '
      call.save
      render_twiml response
    else
      response = Twilio::TwiML::Response.new do |r|
        r.Pause
        r.Pause
        r.Pause
        r.Say " I am sorry but there is noone available to take your call", :voice => 'alice' #, language: "it-IT"
        r.Play 'http://linode.rabasa.com/cantina.mp3'
      end
      call = Call.new
      call.from = params[:From] || ' '
      call.to = ' '
      call.answered =  ' '
      call.save
      render_twiml response
    end
  end
end
