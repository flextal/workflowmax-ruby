require 'spec_helper'
require 'json'
require 'active_support/core_ext'

describe WorkflowMaxRuby::ApiClient do
  context 'initialization' do
    context 'URL config' do
      context 'host' do
        it 'removes http from host' do
          WorkflowMaxRuby.configure { |c| c.host = 'http://example.com' }
          expect(WorkflowMaxRuby::Configuration.default.host).to eq('example.com')
        end

        it 'removes https from host' do
          WorkflowMaxRuby.configure { |c| c.host = 'https://wookiee.com' }
          expect(WorkflowMaxRuby::Configuration.default.host).to eq('wookiee.com')
        end

        it 'removes trailing path from host' do
          WorkflowMaxRuby.configure { |c| c.host = 'hobo.com/v4' }
          expect(WorkflowMaxRuby::Configuration.default.host).to eq('hobo.com')
        end
      end

      context 'base_path' do
        it "prepends a slash to base_path" do
          WorkflowMaxRuby.configure { |c| c.base_path = 'v4/dog' }
          expect(WorkflowMaxRuby::Configuration.default.base_path).to eq('/v4/dog')
        end

        it "doesn't prepend a slash if one is already there" do
          WorkflowMaxRuby.configure { |c| c.base_path = '/v4/dog' }
          expect(WorkflowMaxRuby::Configuration.default.base_path).to eq('/v4/dog')
        end

        it "ends up as a blank string if nil" do
          WorkflowMaxRuby.configure { |c| c.base_path = nil }
          expect(WorkflowMaxRuby::Configuration.default.base_path).to eq('')
        end
      end

      context "creates a valid authorization_url" do
        it "passes through attributes" do
          creds = {
            client_id: 'abc',
            client_secret: '123',
            redirect_uri: 'https://mydomain.com/callback',
            scopes: 'workflowmax openid profile email offline_access',
            state: 'i-am-customer-state'
          }
          api_client = WorkflowMaxRuby::ApiClient.new(credentials: creds)
          expect(api_client.authorization_url).to eq('https://login.xero.com/identity/connect/authorize?response_type=code&client_id=abc&redirect_uri=https://mydomain.com/callback&scope=workflowmax+openid+profile+email+offline_access&state=i-am-customer-state')
        end

        it "Does not append state if it is not provided" do
          creds = {
            client_id: 'abc',
            client_secret: '123',
            redirect_uri: 'https://mydomain.com/callback',
            scopes: 'workflowmax openid profile email offline_access'
          }
          api_client = WorkflowMaxRuby::ApiClient.new(credentials: creds)
          expect(api_client.authorization_url).to eq('https://login.xero.com/identity/connect/authorize?response_type=code&client_id=abc&redirect_uri=https://mydomain.com/callback&scope=workflowmax+openid+profile+email+offline_access')
        end

        it "Validates state on callback matches @config.state" do
          creds = {
            client_id: 'abc',
            client_secret: '123',
            redirect_uri: 'https://mydomain.com/callback',
            scopes: 'workflowmax openid profile email offline_access',
            state: "custom-state"
          }
          api_client = WorkflowMaxRuby::ApiClient.new(credentials: creds)
          altered_state = {'state': 'not-original-state'}
          expect{api_client.validate_state(altered_state)}.to raise_error(StandardError, 'WARNING: @config.state: custom-state and OAuth callback state:  do not match!')
        end
      end
    end
  end

  describe 'api_client helper functions' do
    let(:api_client) { WorkflowMaxRuby::ApiClient.new }
    let(:token_set) { {'access_token': 'eyx.authorization.data', 'id_token': 'eyx.authentication.data', 'refresh_token': 'REFRESHMENTS'} }
    let(:connections) {
        [{
        "id" => "xxx-yyy-zzz",
        "tenantId" => "xxx-yyy-zzz",
        "tenantType" => "ORGANISATION",
        "tenantName" => "Demo Company (US)",
        "createdDateUtc" => "2019-11-01T20:08:03.0766400",
        "updatedDateUtc" => "2020-04-15T22:37:10.4943410"
      }]
    }

    before do 
      allow(api_client).to receive(:token_request).and_return(token_set)
    end

    it "#set_token_set" do
      api_client.set_token_set(token_set)
      expect(api_client.token_set).to eq(token_set.with_indifferent_access)
    end

    it "#set_access_token" do
      api_client.set_access_token(token_set['access_token'])
      expect(api_client.access_token).to eq(token_set['access_token'])
    end

    it "#set_id_token" do
      api_client.set_id_token(token_set['id_token'])
      expect(api_client.id_token).to eq(token_set['id_token'])
    end

    it "#refresh_token_set" do
      expect(api_client.refresh_token_set(token_set)).to eq(token_set)
    end

    it "#connections" do
      expect(api_client).to receive(:call_api).and_return(connections)
      expect(api_client.config.base_url).to eq(nil)
      expect(api_client.connections).to eq(connections[0])
      expect(api_client.config.base_url).to eq('https://api.xero.com')
    end

    it "#disconnect" do
      expect(api_client).to receive(:call_api).and_return(connections)
      expect(api_client).to receive(:connections).and_return(connections[0])
      expect(api_client.disconnect(connections[0]['id'])).to eq(connections[0])
      expect(api_client.config.base_url).to eq('https://api.xero.com')
    end

    it "sets and resets the base url based on endpoint usage of the same client" do
      expect(api_client).to receive(:call_api).and_return(connections)
    
      api_client.accounting_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/api.xro/2.0')
      
      api_client.asset_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/assets.xro/1.0')
      
      api_client.project_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/projects.xro/2.0/')
      
      api_client.files_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/files.xro/1.0/')
      
      api_client.connections
      expect(api_client.config.base_url).to eq('https://api.xero.com')

      api_client.client_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/workflowmax/3.0/client.api')

      api_client.invoice_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/workflowmax/3.0/invoice.api')

      api_client.job_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/workflowmax/3.0/job.api')

      api_client.task_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/workflowmax/3.0/task.api')

      api_client.quote_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/workflowmax/3.0/quote.api')

      api_client.time_api
      expect(api_client.config.base_url).to eq('https://api.xero.com/workflowmax/3.0/time.api')
    end

    it "does not mutate the original opts hash" do
      expect(api_client).to receive(:call_api).and_return('')
      opts = {
        where: {
          invoice_number: ['=', "INV-0060"]
        }
      }
      api_client.accounting_api.get_invoices('active_tenant_id', opts)
      expect(opts).to eq({:where=>{:invoice_number=>["=", "INV-0060"]}})
    end
  end

  # describe 'api_client actual connection' do
  #   it 'creates an actual connection' do
  #     creds = {
  #       client_id: 'EF35534570E940AEB5D9AB17D23E653E',
  #       client_secret: 'ZJOwTbIHPAa8A7iL-U8KGxZlf1FJeN2Q_tk8BTWKTTLA39z3',
  #       redirect_uri: 'http://localhost:3000/callback',
  #       scopes: 'workflowmax openid profile email offline_access'
  #     }
  #     api_client = WorkflowMaxRuby::ApiClient.new(credentials: creds)
  #     puts api_client.inspect
  #     expect(api_client.access_token).to_not eq(nil)
  #
  #   end
  # end


  # describe '#deserialize' do
  #   it "handles Array<Integer>" do
  #     api_client = WorkflowMaxRuby::ApiClient.new
  #     headers = { 'Content-Type' => 'text/xml' }
  #     response = double('response', headers: headers, body: '<response>[12, 34]</response>')
  #     data = api_client.deserialize(response, 'Array<Integer>', 'JobApi')
  #     expect(data).to be_instance_of(Array)
  #     expect(data).to eq([12, 34])
  #   end
  #
  #   it 'handles Array<Array<Integer>>' do
  #     api_client = WorkflowMaxRuby::ApiClient.new
  #     headers = { 'Content-Type' => 'text/xml' }
  #     response = double('response', headers: headers, body: '<response>[[12, 34], [56]]</response>')
  #     data = api_client.deserialize(response, 'Array<Array<Integer>>', 'JobApi')
  #     expect(data).to be_instance_of(Array)
  #     expect(data).to eq([[12, 34], [56]])
  #   end
  #
  #   it 'handles Hash<String, String>' do
  #     api_client = WorkflowMaxRuby::ApiClient.new
  #     headers = { 'Content-Type' => 'text/xml' }
  #     response = double('response', headers: headers, body: '<response>{"message": "Hello"}</response>')
  #     data = api_client.deserialize(response, 'Hash<String, String>', 'AcountingApi')
  #     expect(data).to be_instance_of(Hash)
  #     expect(data).to eq(:message => 'Hello')
  #   end
  # end

  describe "#object_to_hash modifies a hash from snake_case to PascalCase" do
    contact_after = {"Contacts"=>{"Contact"=>{"Name"=>"\"Bruce Banner\"", "EmailAddress"=>"\"hulk@avengers.com\"", "Phones"=>{"Phone"=>{"PhoneType"=>"\"MOBILE\"", "PhoneNumber"=>"\"555-1212\"", "PhoneAreaCode"=>"\"415\""}}, "PaymentTerms"=>{"PaymentTerm"=>{"Bills"=>{"Bill"=>{"Day"=>"15", "Type"=>"\"OFCURRENTMONTH\""}}, "Sales"=>{"Sale"=>{"Day"=>"10", "Type"=>"\"DAYSAFTERBILLMONTH\""}}}}}}}

    it 'Serializes snake_case object correctly' do
      contact_before = Hash.from_xml('<contacts><contact><name>"Bruce Banner"</name><email_address>"hulk@avengers.com"</email_address><phones><phone><phone_type>"MOBILE"</phone_type><phone_number>"555-1212"</phone_number><phone_area_code>"415"</phone_area_code></phone></phones><payment_terms><payment_term><bills><bill><day>15</day><type>"OFCURRENTMONTH"</type></bill></bills><sales><sale><day>10</day><type>"DAYSAFTERBILLMONTH"</type></sale></sales></payment_term></payment_terms></contact></contacts>')
      # contact_before = {:contacts=>[{:name=>"Bruce Banner", :email_address=>"hulk@avengers.com", :phones=>[{:phone_type=>"MOBILE", :phone_number=>"555-1212", :phone_area_code=>"415"}], :payment_terms=>{:bills=>{:day=>15, :type=>"OFCURRENTMONTH"}, :sales=>{:day=>10, :type=>"DAYSAFTERBILLMONTH"}}}]}
      api_client = WorkflowMaxRuby::ApiClient.new
      expect(api_client.object_to_hash(contact_before)).to eq(contact_after)
    end

    it 'Serializes camelCase object correctly' do
      xml_before = '<Root><type>ACCREC</type><invoiceNumber>INV-01</invoiceNumber><dueDate>2020-01-01</dueDate><lineItems><lineItem><quantity>1.0</quantity><unitAmount>20</unitAmount></lineItem></lineItems></Root>'
      json_before = Hash.from_xml(xml_before).deep_symbolize_keys!
      # json_before = {
      #   type: "ACCREC",
      #   invoiceNumber: "INV-01",
      #   dueDate: "2020-01-01",
      #   lineItems: [
      #     { quantity: 1.0, unitAmount: 20 }
      #   ]
      # }
      json_after = {
        Root: {
          Type: "ACCREC",
            InvoiceNumber: "INV-01",
            DueDate: "2020-01-01",
            LineItems: {
              LineItem: {
                Quantity: "1.0",
                UnitAmount: "20"
              }
            }
        }
      }

      api_client = WorkflowMaxRuby::ApiClient.new
      expect(api_client.object_to_hash(json_before)).to eq(json_after)
    end

    it 'Serializes json with multiple nested objects correctly' do
      json_before = {
        "line_Items":[
          {
            "quantity":1.0,
            "unit_amount":20,
            "sub_Items":[
              {
                "quantity":1.0,
                "unit_amount":20
              },
              {
                "quantity":1.0,
                "Unit_amount":20,
                "Deep_Items":[
                  {
                    "quantity":1.0,
                    "unit_amount":20
                  },
                  {
                    "quantity":1.0,
                    "unit_Amount":20
                  }
                ]
              }
            ]
          }
        ]
      }
       
      json_after = {
        "LineItems":[
          {
            "UnitAmount":20,
            "Quantity":1.0,
            "SubItems":[
              {
                "UnitAmount":20,
                "Quantity":1.0
              },
              {
                "UnitAmount":20,
                "Quantity":1.0,
                "DeepItems":[
                  {
                    "UnitAmount":20,
                    "Quantity":1.0
                  },
                  {
                    "UnitAmount":20,
                    "Quantity":1.0
                  }
                ]
              }
            ]
          }
        ]
      }
      api_client = WorkflowMaxRuby::ApiClient.new
      expect(api_client.object_to_hash(json_before)).to eq(json_after)
    end

    it 'Serializes mixed cased keys correctly' do
      contact_after = { :Contacts=>[{:Name=>"Bruce Banner", :EmailAddress=>"hulk@avengers.com", :Phones=>[{:PhoneType=>"MOBILE", :PhoneNumber=>"555-1212", :PhoneAreaCode=>"415"}], :PaymentTerms=>{:Bills=>{:Day=>15, :Type=>"OFCURRENTMONTH"}, :Sales=>{:Day=>10, :Type=>"DAYSAFTERBILLMONTH"}}}]}
      contact_before = {:contacts=>[{:name=>"Bruce Banner", :emailAddress=>"hulk@avengers.com", :phones=>[{:phoneType=>"MOBILE", :phone_number=>"555-1212", :phone_areaCode=>"415"}], :Payment_terms=>{:bills=>{:day=>15, :type=>"OFCURRENTMONTH"}, :sales=>{:day=>10, :type=>"DAYSAFTERBILLMONTH"}}}]}
      api_client = WorkflowMaxRuby::ApiClient.new
      expect(api_client.object_to_hash(contact_before)).to eq(contact_after)
    end
  end

  describe '#build_collection_param' do
    let(:param) { ['contact_ids', 'order', 'where'] }
    let(:api_client) { WorkflowMaxRuby::ApiClient.new }

    it 'works for csv' do
      expect(api_client.build_collection_param(param, :csv)).to eq('contact_ids,order,where')
    end

    it 'works for ssv' do
      expect(api_client.build_collection_param(param, :ssv)).to eq('contact_ids order where')
    end

    it 'works for tsv' do
      expect(api_client.build_collection_param(param, :tsv)).to eq("contact_ids\torder\twhere")
    end

    it 'works for pipes' do
      expect(api_client.build_collection_param(param, :pipes)).to eq('contact_ids|order|where')
    end

    it 'works for multi' do
      expect(api_client.build_collection_param(param, :multi)).to eq(['contact_ids', 'order', 'where'])
    end

    it 'fails for invalid collection format' do
      expect(proc { api_client.build_collection_param(param, :INVALID) }).to raise_error(RuntimeError, 'unknown collection format: :INVALID')
    end
  end

  describe '#json_mime?' do
    let(:api_client) { WorkflowMaxRuby::ApiClient.new }

    it 'works' do
      expect(api_client.json_mime?(nil)).to eq false
      expect(api_client.json_mime?('')).to eq false

      expect(api_client.json_mime?('application/json')).to eq true
      expect(api_client.json_mime?('application/json; charset=UTF8')).to eq true
      expect(api_client.json_mime?('APPLICATION/JSON')).to eq true

      expect(api_client.json_mime?('application/xml')).to eq false
      expect(api_client.json_mime?('text/plain')).to eq false
      expect(api_client.json_mime?('application/jsonp')).to eq false
    end
  end

  describe '#xml_mime?' do
    let(:api_client) { WorkflowMaxRuby::ApiClient.new }

    it 'works' do
      expect(api_client.xml_mime?(nil)).to eq false
      expect(api_client.xml_mime?('')).to eq false

      expect(api_client.xml_mime?('application/json')).to eq false
      expect(api_client.xml_mime?('application/json; charset=UTF8')).to eq false
      expect(api_client.xml_mime?('APPLICATION/JSON')).to eq false
      expect(api_client.xml_mime?('application/jsonp')).to eq false

      expect(api_client.xml_mime?('application/xml')).to eq true
      expect(api_client.xml_mime?('text/xml')).to eq true
    end
  end

  describe '#select_header_accept' do
    let(:api_client) { WorkflowMaxRuby::ApiClient.new }

    it 'works' do
      expect(api_client.select_header_accept(nil)).to be_nil
      expect(api_client.select_header_accept([])).to be_nil

      expect(api_client.select_header_accept(['application/json'])).to eq('application/json')
      expect(api_client.select_header_accept(['application/xml', 'application/json; charset=UTF8'])).to eq('application/xml')
      expect(api_client.select_header_accept(['APPLICATION/JSON', 'text/html'])).to eq('APPLICATION/JSON,text/html')

      expect(api_client.select_header_accept(['application/xml'])).to eq('application/xml')
      expect(api_client.select_header_accept(['text/html', 'application/xml'])).to eq('application/xml')
    end
  end

  describe '#select_header_content_type' do
    let(:api_client) { WorkflowMaxRuby::ApiClient.new }

    it 'works' do
      expect(api_client.select_header_content_type(nil)).to eq('application/xml')
      expect(api_client.select_header_content_type([])).to eq('application/xml')

      expect(api_client.select_header_content_type(['application/json'])).to eq('application/json')
      expect(api_client.select_header_content_type(['application/xml', 'application/json; charset=UTF8'])).to eq('application/xml')
      expect(api_client.select_header_content_type(['APPLICATION/JSON', 'text/html'])).to eq('APPLICATION/JSON')
      expect(api_client.select_header_content_type(['application/xml'])).to eq('application/xml')
      expect(api_client.select_header_content_type(['text/plain', 'application/xml'])).to eq('application/xml')
    end
  end

  describe '#sanitize_filename' do
    let(:api_client) { WorkflowMaxRuby::ApiClient.new }

    it 'works' do
      expect(api_client.sanitize_filename('sun')).to eq('sun')
      expect(api_client.sanitize_filename('sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('../sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('/var/tmp/sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('./sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('..\sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('\var\tmp\sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('c:\var\tmp\sun.gif')).to eq('sun.gif')
      expect(api_client.sanitize_filename('.\sun.gif')).to eq('sun.gif')
    end
  end

  describe 'token helper methods' do
    let(:api_client) { WorkflowMaxRuby::ApiClient.new }
    let(:id_token){'eyJhbGciOiJSUzI1NiIsImtpZCI6IjFDQUY4RTY2NzcyRDZEQzAyOEQ2NzI2RkQwMjYxNTgxNTcwRUZDMTkiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJISy1PWm5jdGJjQW8xbkp2MENZVmdWY09fQmsifQ.eyJuYmYiOjE2MTk3MTQwNDMsImV4cCI6MTYxOTcxNDM0MywiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS54ZXJvLmNvbSIsImF1ZCI6IkFEQjVBNzdEQTZCNjRFOTI4RDg0MDkwOTlBMzlDQTdCIiwiaWF0IjoxNjE5NzE0MDQzLCJhdF9oYXNoIjoiMXJNamVvUTJiOUxUNFU0ZlBXbEZJZyIsInNpZCI6ImY0YTY4ZDc0ZmM3OTQzMjc4YTgzMTg0NGM5ZWRmNzFiIiwic3ViIjoiZGI0ZjBmMzdiNTg1NTMwZTkxZjNiOWNiYjUwMzQwZTgiLCJhdXRoX3RpbWUiOjE2MTk3MTM5ODcsInhlcm9fdXNlcmlkIjoiZmFhODNlYzktZjZhNy00ODlmLTg5MTEtZTNmY2UwM2ExMTg2IiwiZ2xvYmFsX3Nlc3Npb25faWQiOiJmNGE2OGQ3NGZjNzk0MzI3OGE4MzE4NDRjOWVkZjcxYiIsInByZWZlcnJlZF91c2VybmFtZSI6ImNocmlzLmtuaWdodEB4ZXJvLmNvbSIsImVtYWlsIjoiY2hyaXMua25pZ2h0QHhlcm8uY29tIiwiZ2l2ZW5fbmFtZSI6IkNocmlzdG9waGVyIiwiZmFtaWx5X25hbWUiOiJLbmlnaHQifQ.hF04tCE1Qd-al355fQyCjWqTVWKnguor4RD1sC7rKH7zV3r3_nGwnGLMm2A96fov06fig0zusTX8onev0qFLZy-jlEXDp1f19LHhT15sBy0KH6dB0lGMrM14BnDuEP4NUGeP06nAPhQHHLw2oCc9hzYXorRVOSFDw43jgAC0vxRgDvJwgKgv6TDVEmpvwP0S4R7A0VbnFemHP_HY8gLHd7RpN7rrYmpJC4cofztdptDNLTF8Qup8qVlFdQgpJPQEQ95N1m6W-unvrh_dlO6AVMjXBjC1BJ10IGzoCCr8DSVyz2UMPnUT3oIYFVTlDc2K-ZJYkW86pigITMCdvR1hKg'}
    let(:access_token){'eyJhbGciOiJSUzI1NiIsImtpZCI6IjFDQUY4RTY2NzcyRDZEQzAyOEQ2NzI2RkQwMjYxNTgxNTcwRUZDMTkiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJISy1PWm5jdGJjQW8xbkp2MENZVmdWY09fQmsifQ.eyJuYmYiOjE2MTk3MTQwNDMsImV4cCI6MTYxOTcxNTg0MywiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS54ZXJvLmNvbSIsImF1ZCI6Imh0dHBzOi8vaWRlbnRpdHkueGVyby5jb20vcmVzb3VyY2VzIiwiY2xpZW50X2lkIjoiQURCNUE3N0RBNkI2NEU5MjhEODQwOTA5OUEzOUNBN0IiLCJzdWIiOiJkYjRmMGYzN2I1ODU1MzBlOTFmM2I5Y2JiNTAzNDBlOCIsImF1dGhfdGltZSI6MTYxOTcxMzk4NywieGVyb191c2VyaWQiOiJmYWE4M2VjOS1mNmE3LTQ4OWYtODkxMS1lM2ZjZTAzYTExODYiLCJnbG9iYWxfc2Vzc2lvbl9pZCI6ImY0YTY4ZDc0ZmM3OTQzMjc4YTgzMTg0NGM5ZWRmNzFiIiwianRpIjoiZmFmNGNkYzQ5MjM0YzhmZDE0OTA0ZjRlOWEyMWY4YmYiLCJhdXRoZW50aWNhdGlvbl9ldmVudF9pZCI6IjI0MmRjNWIyLTIwZTMtNGFjNS05NjU3LWExMGI5ZTI0ZGI1NSIsInNjb3BlIjpbImVtYWlsIiwicHJvZmlsZSIsIm9wZW5pZCIsImFjY291bnRpbmcucmVwb3J0cy5yZWFkIiwiZmlsZXMiLCJwYXlyb2xsLmVtcGxveWVlcyIsInBheXJvbGwucGF5cnVucyIsInBheXJvbGwucGF5c2xpcCIsInBheXJvbGwudGltZXNoZWV0cyIsInByb2plY3RzLnJlYWQiLCJwcm9qZWN0cyIsImFjY291bnRpbmcuc2V0dGluZ3MiLCJhY2NvdW50aW5nLmF0dGFjaG1lbnRzIiwiYWNjb3VudGluZy50cmFuc2FjdGlvbnMiLCJhY2NvdW50aW5nLmpvdXJuYWxzLnJlYWQiLCJhc3NldHMucmVhZCIsImFzc2V0cyIsImFjY291bnRpbmcuY29udGFjdHMiLCJwYXlyb2xsLnNldHRpbmdzIiwib2ZmbGluZV9hY2Nlc3MiXX0.vNV-YsgHFWKFBmyYdhg7tztdsPc9ykObadQcGFoFXJ8qCBerR3h7XXKzWAP3KzFzhOCcIpWU8Q081zuYBNxahPeeLRLUuc_3MwgwE72esE5vGuxa2_-_QidtNvMCgsX-ie_LcX7FE_KI-sXB_EZ8fDk6WAMIPC9d3GejgeuH5Uh6rZkhowN2jm5pZjEOEy_QE7PScBO0XEbiZNUsarvBUSdKuSTvVVLHzHzs0bHMRfgKEkqZySNtZlac-oyaL3PVba1S7A_vbRcNWpYR_VrKGf2g9LHSI3EA5j3Beto4pKukU-bk6rLBGul37u4tM17U-wyJLsFmt6ZC_SEJKgmluQ'}
    let(:tkn_set) {{'id_token': id_token, 'access_token': access_token, 'refresh_token': 'abc123xyz'}}

    before do
      api_client.set_token_set(tkn_set)
    end

    it '#token_expired? for an expired token' do
      expect(api_client.token_expired?).to eq(true)
    end

    it '#token_expired? for a just expired token' do
      allow(api_client).to receive(:decoded_access_token).and_return({"exp"=>Time.now.to_i})
      expect(api_client.token_expired?).to eq(true)
    end

    it '#token_expired? for a non-expired token' do
      allow(api_client).to receive(:decoded_access_token).and_return({"exp"=>(Time.now + 30.minutes).to_i})
      expect(api_client.token_expired?).to eq(false)
    end

    it '#token_expired? for an almost expired token' do
      allow(api_client).to receive(:decoded_access_token).and_return({"exp"=>(Time.now + 30.seconds).to_i})
      expect(api_client.token_expired?).to eq(false)
    end

    it '#validate_tokens' do
      expect(api_client.validate_tokens(tkn_set)).to eq(true)
    end
    it '#access_token' do
      expect(api_client.access_token).to eq(access_token)
    end
    it '#decoded_access_token' do
      expect(api_client.decoded_access_token['aud']).to eq("https://identity.xero.com/resources")
    end
    it '#id_token' do
      expect(api_client.id_token).to eq(tkn_set[:id_token])
    end
    it '#decoded_id_token' do
      expect(api_client.decoded_id_token['email']).to eq('chris.knight@xero.com')
    end

    it 'decoding an invalid access_token' do
      api_client.set_access_token("#{access_token}.NotAValidJWTstring")
      expect{api_client.decoded_access_token}.to raise_error(JSON::JWT::InvalidFormat)
    end

    it 'decoding an invalid id_token' do
      api_client.set_id_token("#{id_token}.NotAValidJWTstring")
      expect{api_client.decoded_id_token}.to raise_error(JSON::JWT::InvalidFormat)
    end
  end


  describe 'thread safety in the XeroClient' do
    let(:creds) {{
      client_id: 'abc',
      client_secret: '123',
      redirect_uri: 'https://mydomain.com/callback',
      scopes: 'openid profile email accounting.transactions'
    }}
    let(:api_client_1) {WorkflowMaxRuby::ApiClient.new(credentials: creds)}
    let(:api_client_2) {WorkflowMaxRuby::ApiClient.new(credentials: creds)}
    let(:api_client_3) {WorkflowMaxRuby::ApiClient.new(credentials: creds)}

    let(:tkn_set_1){{'id_token': "abc.123.1", 'access_token': "xxx.yyy.zzz.111"}}
    let(:tkn_set_2){{'id_token': "efg.456.2", 'access_token': "xxx.yyy.zzz.222"}}
    
    describe 'when configuration is changed, other instantiations of the client are not affected' do
      it 'applies to #set_access_token' do
        expect(api_client_1.access_token).to eq(nil)
        expect(api_client_2.access_token).to eq(nil)
        expect(api_client_3.access_token).to eq(nil)

        api_client_1.set_access_token("ACCESS_TOKEN_1")
        expect(api_client_1.access_token).to eq("ACCESS_TOKEN_1")
        expect(api_client_2.access_token).to eq(nil)
        expect(api_client_3.access_token).to eq(nil)

        api_client_2.set_access_token("ACCESS_TOKEN_2")
        expect(api_client_1.access_token).to eq("ACCESS_TOKEN_1")
        expect(api_client_2.access_token).to eq("ACCESS_TOKEN_2")
        expect(api_client_3.access_token).to eq(nil)

        api_client_3.set_access_token("ACCESS_TOKEN_3")
        expect(api_client_1.access_token).to eq("ACCESS_TOKEN_1")
        expect(api_client_2.access_token).to eq("ACCESS_TOKEN_2")
        expect(api_client_3.access_token).to eq("ACCESS_TOKEN_3")
      end

      it 'applies to #set_id_token' do
        expect(api_client_1.id_token).to eq(nil)
        expect(api_client_2.id_token).to eq(nil)

        api_client_1.set_id_token("id_token_1")
        expect(api_client_1.id_token).to eq("id_token_1")
        expect(api_client_2.id_token).to eq(nil)

        api_client_2.set_id_token("id_token_2")
        expect(api_client_1.id_token).to eq("id_token_1")
        expect(api_client_2.id_token).to eq("id_token_2")
      end

      it 'applies to #set_token_set' do 
        expect(api_client_1.token_set).to eq(nil)
        expect(api_client_2.token_set).to eq(nil)

        api_client_1.set_token_set(tkn_set_1)
        expect(api_client_1.token_set).to eq(tkn_set_1.with_indifferent_access)
        expect(api_client_2.token_set).to eq(nil)

        api_client_2.set_token_set(tkn_set_2)
        expect(api_client_1.token_set).to eq(tkn_set_1.with_indifferent_access)
        expect(api_client_2.token_set).to eq(tkn_set_2.with_indifferent_access)
      end
      
      it 'applies to #base_url' do
        expect(api_client_1.config.base_url).to eq(nil)
        expect(api_client_2.config.base_url).to eq(nil)

        api_client_1.accounting_api
        expect(api_client_1.config.base_url).to eq(api_client_1.config.accounting_url)
        expect(api_client_2.config.base_url).to eq(nil)
        
        api_client_2.files_api
        expect(api_client_1.config.base_url).to eq(api_client_1.config.accounting_url)
        expect(api_client_2.config.base_url).to eq(api_client_1.config.files_url)

        api_client_2.project_api
        expect(api_client_1.config.base_url).to eq(api_client_1.config.accounting_url)
        expect(api_client_2.config.base_url).to eq(api_client_1.config.project_url)
      end
    end
  end
end
