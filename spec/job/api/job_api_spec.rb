require 'spec_helper'
require 'json'

# Unit tests for WorkflowMaxRuby::JobApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'JobApi' do
  before do
    # run before each test
    @api_instance = WorkflowMaxRuby::JobApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of Job' do
    it 'should create an instance of JobApi' do
      expect(@api_instance).to be_instance_of(WorkflowMaxRuby::JobApi)
    end
  end

end
