=begin
#Xero Assets API

#This is the Xero Assets API

The version of the OpenAPI document: 2.1.3
Contact: api@xero.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.0

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for WorkflowMaxRuby::Assets::AssetStatus
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'AssetStatus' do
  before do
    # run before each test
    @instance = WorkflowMaxRuby::Assets::AssetStatus.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of AssetStatus' do
    it 'should create an instance of AssetStatus' do
      expect(@instance).to be_instance_of(WorkflowMaxRuby::Assets::AssetStatus)
    end
  end
end
