# encoding: utf-8

module Validic
  module Routine

    ##
    # Get Routine Activities base on `access_token`
    # 
    # @return [Hashie::Mash] with list of Routine
    def get_routines(options={})
      organization_id = options[:organization_id]
      options = {
        start_date: options[:start_date],
        end_date: options[:end_date],
        access_token: options[:access_token]
      }

      if options[:access_token] && organization_id
        response = get("/#{Validic.api_version}/organizations/#{organization_id}/routine.json", options)
      else
        response = get("/#{Validic.api_version}/routine.json", options)
      end
      response if response
    end

    ##
    # Create Routine base on `access_token`
    # 
    # @return success
    def create_routine(options={})
      options = {
        access_token: options[:access_token],
        routine: {
          steps: options[:steps],
          stairs_climbed: options[:stairs_climbed],
          calories_burned: options[:calories_burned],
          calories_consumed: options[:calories_consumed],
          timestamp: options[:timestamp],
          source: options[:source]
        }
      }

      response = post("/#{Validic.api_version}/routine.json", options)
      response if response
    end

  end
end
