require 'spec_helper'

describe WorkflowMaxRuby::Configuration do
  let(:config) { WorkflowMaxRuby::Configuration.default }

  describe 'urls' do
    it 'should have the default value' do
      expect(config.login_url).to eq('https://login.xero.com/identity/connect/authorize')
      expect(config.token_url).to eq('https://identity.xero.com/connect')
      expect(config.accounting_url).to eq('https://api.xero.com/api.xro/2.0')
      expect(config.asset_url).to eq('https://api.xero.com/assets.xro/1.0')
      expect(config.project_url).to eq('https://api.xero.com/projects.xro/2.0/')
      expect(config.files_url).to eq('https://api.xero.com/files.xro/1.0/')
      expect(config.client_url).to eq('https://api.xero.com/workflowmax/3.0/client.api/')
      expect(config.invoice_url).to eq('https://api.xero.com/workflowmax/3.0/invoice.api/')
      expect(config.job_url).to eq('https://api.xero.com/workflowmax/3.0/job.api/')
      expect(config.task_url).to eq('https://api.xero.com/workflowmax/3.0/task.api/')
      expect(config.quote_url).to eq('https://api.xero.com/workflowmax/3.0/quote.api/')
    end
  end

  describe 'config' do
    it 'should apply the default configuration options' do
      client = WorkflowMaxRuby::ApiClient.new(credentials: {})
      expect(client.config.login_url).to eq('https://login.xero.com/identity/connect/authorize')
    end

    it 'should allow you to overwrite the default configuration options' do
      client = WorkflowMaxRuby::ApiClient.new(credentials: {}, config: {login_url: 'ngrok.login.xero.test'})
      expect(client.config.login_url).to eq('ngrok.login.xero.test')
    end

    it 'should allow you to set the timeout config option' do
      client = WorkflowMaxRuby::ApiClient.new(credentials: {}, config: {timeout: 30})
      expect(client.config.timeout).to eq(30)
    end
  end
end
