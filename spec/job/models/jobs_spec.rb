=begin
#Jobs API

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 2.1.3
Contact: blair@hireassemble.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.0

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for WorkflowMaxRuby::Jobs
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'Jobs' do
  before do
    # run before each test
    @instance = WorkflowMaxRuby::Jobs::Jobs.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of Jobs' do
    it 'should create an instance of Jobs' do
      expect(@instance).to be_instance_of(WorkflowMaxRuby::Jobs::Jobs)
    end
  end
  describe 'test attribute "Status"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end
  describe 'test attribute "Jobs"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test build_from_hash' do
    it 'should load job data and not be empty' do
      xml_file = File.open(File.dirname(__FILE__ ) + '/../../fixtures/files/current_jobs.xml')
      data = JSON.parse(Hash.from_xml(xml_file).to_json, symbolize_names: true)[:Response]

      test_obj = @instance.build_from_hash(data)

      expect(test_obj).to_not be_nil
    end

    it 'should have 2 jobs' do
      xml_file = File.open(File.dirname(__FILE__ ) + '/../../fixtures/files/current_jobs.xml')
      data = JSON.parse(Hash.from_xml(xml_file).to_json, symbolize_names: true)[:Response]

      test_obj = @instance.build_from_hash(data)
      expect(test_obj.Jobs.length).to eq(2)
    end
  end

end
