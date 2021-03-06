module WorkflowMaxRuby
  class SupplierApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.new)
      @api_client = api_client
    end

    def get_suppliers(xero_tenant_id, opts = {})
      data, _status_code, _headers = get_suppliers_with_http_info(xero_tenant_id, opts)
      data
    end

    def get_suppliers_with_http_info(xero_tenant_id, options = {})
      opts = options.dup
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SupplierApi.get_suppliers ...'
      end
      # verify the required parameter 'xero_tenant_id' is set
      if @api_client.config.client_side_validation && xero_tenant_id.nil?
        fail ArgumentError, "Missing the required parameter 'xero_tenant_id' when calling SupplierApi.get_suppliers"
      end
      # resource path
      local_var_path = '/list'

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/xml'])
      header_params[:'content-type'] = 'application/xml'
      header_params[:'xero-tenant-id'] = xero_tenant_id
      header_params[:'If-Modified-Since'] = opts[:'if_modified_since'] if !opts[:'if_modified_since'].nil?

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:body]

      # return_type
      return_type = opts[:return_type] || 'Suppliers'

      # auth_names
      auth_names = opts[:auth_names] || ['OAuth2']

      new_options = opts.merge(
        :header_params => header_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, "SupplierApi", new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SupplierAPI#get_suppliers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end

