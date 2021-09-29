=begin
#Times API

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 2.1.3
Contact: blair@hireassemble.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.0

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for WorkflowMaxRuby::Times
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'Times' do
  before do
    # run before each test
    @instance = WorkflowMaxRuby::Times::Times.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of Times' do
    it 'should create an instance of Times' do
      expect(@instance).to be_instance_of(WorkflowMaxRuby::Times::Times)
    end
  end

  describe 'test build_from_hash' do
    it 'should load Timesheet data and not be empty' do
      xml_file = File.open(File.dirname(__FILE__ ) + '/../../fixtures/files/timesheet_list.xml')
      data = JSON.parse(Hash.from_xml(xml_file).to_json, symbolize_names: true)[:Response]

      test_obj = @instance.build_from_hash(data)

      expect(test_obj.times).to_not be_nil
    end

    it 'should have 2 Times' do
      xml_file = File.open(File.dirname(__FILE__ ) + '/../../fixtures/files/timesheet_list.xml')
      data = JSON.parse(Hash.from_xml(xml_file).to_json, symbolize_names: true)[:Response]

      test_obj = @instance.build_from_hash(data)
      expect(test_obj.times.length).to eq(3139)
    end

  end

end
