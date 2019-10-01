class AuthController < ApplicationController
    include AuthHelper
    include GraphHelper
    def gettoken
        puts params[:code]
        token = get_token_from_code params[:code]
        session[:azure_token] = token.to_hash
        access_token = token.token

        #render json: {}, status: 200

        @events = get_calendar_events access_token || []
        #render json: @events
    rescue RuntimeError => e
        @errors = [
        {
            message: 'Microsoft Graph returned an error getting events.',
            debug: e
        }
        ]
        end
  end