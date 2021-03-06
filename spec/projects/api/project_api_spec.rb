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

# Unit tests for WorkflowMaxRuby::ProjectApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'ProjectApi' do
  before do
    # run before each test
    @api_instance = WorkflowMaxRuby::ProjectApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of ProjectApi' do
    it 'should create an instance of ProjectApi' do
      expect(@api_instance).to be_instance_of(WorkflowMaxRuby::ProjectApi)
    end
  end

  # unit tests for create_project
  # create one or more new projects
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_create_or_update Create a new project with ProjectCreateOrUpdate object
  # @param [Hash] opts the optional parameters
  # @return [Project]
  describe 'create_project test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for create_time_entry
  # Allows you to create a task
  # Allows you to create a specific task
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id You can specify an individual project by appending the projectId to the endpoint
  # @param time_entry_create_or_update The time entry object you are creating
  # @param [Hash] opts the optional parameters
  # @return [TimeEntry]
  describe 'create_time_entry test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for delete_time_entry
  # Allows you to delete a time entry
  # Allows you to delete a specific time entry
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id You can specify an individual project by appending the projectId to the endpoint
  # @param time_entry_id You can specify an individual task by appending the id to the endpoint
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_time_entry test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_project
  # Allows you to retrieve a single project
  # Allows you to retrieve a specific project
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id You can specify an individual project by appending the projectId to the endpoint
  # @param [Hash] opts the optional parameters
  # @return [Project]
  describe 'get_project test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_project_users
  # list all project users
  # Allows you to retrieve the users on a projects.
  # @param xero_tenant_id Xero identifier for Tenant
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :page set to 1 by default. The requested number of the page in paged response - Must be a number greater than 0.
  # @option opts [Integer] :page_size Optional, it is set to 50 by default. The number of items to return per page in a paged response - Must be a number between 1 and 500.
  # @return [ProjectUsers]
  describe 'get_project_users test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_projects
  # list all projects
  # Allows you to retrieve, create and update projects.
  # @param xero_tenant_id Xero identifier for Tenant
  # @param [Hash] opts the optional parameters
  # @option opts [Array<String>] :project_ids Search for all projects that match a comma separated list of projectIds
  # @option opts [String] :contact_id Filter for projects for a specific contact
  # @option opts [String] :states Filter for projects in a particular state (INPROGRESS or CLOSED)
  # @option opts [Integer] :page set to 1 by default. The requested number of the page in paged response - Must be a number greater than 0.
  # @option opts [Integer] :page_size Optional, it is set to 50 by default. The number of items to return per page in a paged response - Must be a number between 1 and 500.
  # @return [Projects]
  describe 'get_projects test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_task
  # Allows you to retrieve a single project
  # Allows you to retrieve a specific project
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id You can specify an individual project by appending the projectId to the endpoint
  # @param task_id You can specify an individual task by appending the taskId to the endpoint, i.e. GET https://.../tasks/{taskId}
  # @param [Hash] opts the optional parameters
  # @return [Task]
  describe 'get_task test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_tasks
  # Allows you to retrieve a single project
  # Allows you to retrieve a specific project
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id You can specify an individual project by appending the projectId to the endpoint
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :page Set to 1 by default. The requested number of the page in paged response - Must be a number greater than 0.
  # @option opts [Integer] :page_size Optional, it is set to 50 by default. The number of items to return per page in a paged response - Must be a number between 1 and 500.
  # @option opts [String] :task_ids taskIdsSearch for all tasks that match a comma separated list of taskIds, i.e. GET https://.../tasks?taskIds&#x3D;{taskId},{taskId}
  # @return [Tasks]
  describe 'get_tasks test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_time_entries
  # Allows you to retrieve the time entries associated with a specific project
  # Allows you to retrieve the time entries associated with a specific project
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id Identifier of the project, that the task (which the time entry is logged against) belongs to.
  # @param [Hash] opts the optional parameters
  # @option opts [String] :user_id The xero user identifier of the person who logged time.
  # @option opts [String] :task_id Identifier of the task that time entry is logged against.
  # @option opts [String] :invoice_id Finds all time entries for this invoice.
  # @option opts [String] :contact_id Finds all time entries for this contact identifier.
  # @option opts [Integer] :page Set to 1 by default. The requested number of the page in paged response - Must be a number greater than 0.
  # @option opts [Integer] :page_size Optional, it is set to 50 by default. The number of items to return per page in a paged response - Must be a number between 1 and 500.
  # @option opts [Array<String>] :states Comma-separated list of states to find. Will find all time entries that are in the status of whatever???s specified.
  # @option opts [Boolean] :is_chargeable Finds all time entries which relate to tasks with the charge type &#x60;TIME&#x60; or &#x60;FIXED&#x60;.
  # @option opts [DateTime] :date_after_utc ISO 8601 UTC date. Finds all time entries on or after this date filtered on the &#x60;dateUtc&#x60; field.
  # @option opts [DateTime] :date_before_utc ISO 8601 UTC date. Finds all time entries on or before this date filtered on the &#x60;dateUtc&#x60; field.
  # @return [TimeEntries]
  describe 'get_time_entries test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_time_entry
  # Allows you to get a single time entry in a project
  # Allows you to upget a single time entry in a project
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id You can specify an individual project by appending the projectId to the endpoint
  # @param time_entry_id You can specify an individual time entry by appending the id to the endpoint
  # @param [Hash] opts the optional parameters
  # @return [TimeEntry]
  describe 'get_time_entry test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for patch_project
  # creates a project for the specified contact
  # Allows you to update a specific projects.
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id You can specify an individual project by appending the projectId to the endpoint
  # @param project_patch Update the status of an existing Project
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'patch_project test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_project
  # update a specific project
  # Allows you to update a specific projects.
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id You can specify an individual project by appending the projectId to the endpoint
  # @param project_create_or_update Request of type ProjectCreateOrUpdate
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'update_project test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for update_time_entry
  # Allows you to update time entry in a project
  # Allows you to update time entry in a project
  # @param xero_tenant_id Xero identifier for Tenant
  # @param project_id You can specify an individual project by appending the projectId to the endpoint
  # @param time_entry_id You can specify an individual time entry by appending the id to the endpoint
  # @param time_entry_create_or_update The time entry object you are updating
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'update_time_entry test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
