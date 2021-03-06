=begin
#Accounting API

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 2.1.3
Contact: api@xero.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.0

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for WorkflowMaxRuby::Accounting::TaxRate
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'TaxRate' do
  before do
    # run before each test
    @instance = WorkflowMaxRuby::Accounting::TaxRate.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of TaxRate' do
    it 'should create an instance of TaxRate' do
      expect(@instance).to be_instance_of(WorkflowMaxRuby::Accounting::TaxRate)
    end
  end
  describe 'test attribute "name"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "tax_type"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "tax_components"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "status"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["ACTIVE", "DELETED", "ARCHIVED", "PENDING"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.status = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "report_tax_type"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["AVALARA", "BASEXCLUDED", "CAPITALSALESOUTPUT", "CAPITALEXPENSESINPUT", "ECOUTPUT", "ECOUTPUTSERVICES", "ECINPUT", "ECACQUISITIONS", "EXEMPTEXPENSES", "EXEMPTINPUT", "EXEMPTOUTPUT", "GSTONIMPORTS", "INPUT", "INPUTTAXED", "MOSSSALES", "NONE", "NONEOUTPUT", "OUTPUT", "PURCHASESINPUT", "SALESOUTPUT", "EXEMPTCAPITAL", "EXEMPTEXPORT", "CAPITALEXINPUT", "GSTONCAPIMPORTS", "GSTONCAPITALIMPORTS", "REVERSECHARGES", "PAYMENTS", "INVOICE", "CASH", "ACCRUAL", "FLATRATECASH", "FLATRATEACCRUAL", "ACCRUALS", "TXCA", "SRCAS", "DSOUTPUT", "BLINPUT2", "EPINPUT", "IMINPUT2", "MEINPUT", "IGDSINPUT2", "ESN33OUTPUT", "OPINPUT", "OSOUTPUT", "TXN33INPUT", "TXESSINPUT", "TXREINPUT", "TXPETINPUT", "NRINPUT", "ES33OUTPUT", "ZERORATEDINPUT", "ZERORATEDOUTPUT", "DRCHARGESUPPLY", "DRCHARGE"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.report_tax_type = value }.not_to raise_error
      # end
    end
  end

  describe 'test attribute "can_apply_to_assets"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "can_apply_to_equity"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "can_apply_to_expenses"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "can_apply_to_liabilities"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "can_apply_to_revenue"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "display_tax_rate"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "effective_rate"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
