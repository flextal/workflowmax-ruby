=begin
#Xero Projects API

#This is the Xero Projects API

The version of the OpenAPI document: 2.2.2
Contact: api@xero.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for WorkflowMaxRuby::Projects::TimeEntries
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'TimeEntries' do
  before do
    # run before each test
    @instance = WorkflowMaxRuby::Projects::TimeEntries.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TimeEntries' do
    it 'should create an instance of TimeEntries' do
      expect(@instance).to be_instance_of(WorkflowMaxRuby::Projects::TimeEntries)
    end
  end
  describe 'test attribute "pagination"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "items"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
