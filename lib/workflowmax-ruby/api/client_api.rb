module WorkflowMaxRuby
  class ClientApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.new)
      @api_client = api_client
    end

  end
end

