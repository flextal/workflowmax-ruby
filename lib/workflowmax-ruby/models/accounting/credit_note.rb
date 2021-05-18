=begin
#Xero Accounting API

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

Contact: api@xero.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

require 'time'
require 'date'

module WorkflowMaxRuby::Accounting
  require 'bigdecimal'

  class CreditNote
    # See Credit Note Types
    attr_accessor :type
    ACCPAYCREDIT = "ACCPAYCREDIT".freeze
    ACCRECCREDIT = "ACCRECCREDIT".freeze
    

    attr_accessor :contact
    
    # The date the credit note is issued YYYY-MM-DD. If the Date element is not specified then it will default to the current date based on the timezone setting of the organisation
    attr_accessor :date
    
    # Date invoice is due – YYYY-MM-DD
    attr_accessor :due_date
    
    # See Credit Note Status Codes
    attr_accessor :status
    DRAFT = "DRAFT".freeze
    SUBMITTED = "SUBMITTED".freeze
    DELETED = "DELETED".freeze
    AUTHORISED = "AUTHORISED".freeze
    PAID = "PAID".freeze
    VOIDED = "VOIDED".freeze
    

    attr_accessor :line_amount_types
    
    # See Invoice Line Items
    attr_accessor :line_items
    
    # The subtotal of the credit note excluding taxes
    attr_accessor :sub_total
    
    # The total tax on the credit note
    attr_accessor :total_tax
    
    # The total of the Credit Note(subtotal + total tax)
    attr_accessor :total
    
    # CIS deduction for UK contractors
    attr_accessor :cis_deduction
    
    # CIS Deduction rate for the organisation
    attr_accessor :cis_rate
    
    # UTC timestamp of last update to the credit note
    attr_accessor :updated_date_utc
    

    attr_accessor :currency_code
    
    # Date when credit note was fully paid(UTC format)
    attr_accessor :fully_paid_on_date
    
    # Xero generated unique identifier
    attr_accessor :credit_note_id
    
    # ACCRECCREDIT – Unique alpha numeric code identifying credit note (when missing will auto-generate from your Organisation Invoice Settings)
    attr_accessor :credit_note_number
    
    # ACCRECCREDIT only – additional reference number
    attr_accessor :reference
    
    # boolean to indicate if a credit note has been sent to a contact via  the Xero app (currently read only)
    attr_accessor :sent_to_contact
    
    # The currency rate for a multicurrency invoice. If no rate is specified, the XE.com day rate is used
    attr_accessor :currency_rate
    
    # The remaining credit balance on the Credit Note
    attr_accessor :remaining_credit
    
    # See Allocations
    attr_accessor :allocations
    
    # The amount of applied to an invoice
    attr_accessor :applied_amount
    
    # See Payments
    attr_accessor :payments
    
    # See BrandingThemes
    attr_accessor :branding_theme_id
    
    # A string to indicate if a invoice status
    attr_accessor :status_attribute_string
    
    # boolean to indicate if a credit note has an attachment
    attr_accessor :has_attachments
    
    # A boolean to indicate if a credit note has an validation errors
    attr_accessor :has_errors
    
    # Displays array of validation error messages from the API
    attr_accessor :validation_errors
    
    # Displays array of warning messages from the API
    attr_accessor :warnings
    
    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'type' => :'Type',
        :'contact' => :'Contact',
        :'date' => :'Date',
        :'due_date' => :'DueDate',
        :'status' => :'Status',
        :'line_amount_types' => :'LineAmountTypes',
        :'line_items' => :'LineItems',
        :'sub_total' => :'SubTotal',
        :'total_tax' => :'TotalTax',
        :'total' => :'Total',
        :'cis_deduction' => :'CISDeduction',
        :'cis_rate' => :'CISRate',
        :'updated_date_utc' => :'UpdatedDateUTC',
        :'currency_code' => :'CurrencyCode',
        :'fully_paid_on_date' => :'FullyPaidOnDate',
        :'credit_note_id' => :'CreditNoteID',
        :'credit_note_number' => :'CreditNoteNumber',
        :'reference' => :'Reference',
        :'sent_to_contact' => :'SentToContact',
        :'currency_rate' => :'CurrencyRate',
        :'remaining_credit' => :'RemainingCredit',
        :'allocations' => :'Allocations',
        :'applied_amount' => :'AppliedAmount',
        :'payments' => :'Payments',
        :'branding_theme_id' => :'BrandingThemeID',
        :'status_attribute_string' => :'StatusAttributeString',
        :'has_attachments' => :'HasAttachments',
        :'has_errors' => :'HasErrors',
        :'validation_errors' => :'ValidationErrors',
        :'warnings' => :'Warnings'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'type' => :'String',
        :'contact' => :'Contact',
        :'date' => :'Date',
        :'due_date' => :'Date',
        :'status' => :'String',
        :'line_amount_types' => :'LineAmountTypes',
        :'line_items' => :'Array<LineItem>',
        :'sub_total' => :'BigDecimal',
        :'total_tax' => :'BigDecimal',
        :'total' => :'BigDecimal',
        :'cis_deduction' => :'BigDecimal',
        :'cis_rate' => :'BigDecimal',
        :'updated_date_utc' => :'DateTime',
        :'currency_code' => :'CurrencyCode',
        :'fully_paid_on_date' => :'Date',
        :'credit_note_id' => :'String',
        :'credit_note_number' => :'String',
        :'reference' => :'String',
        :'sent_to_contact' => :'Boolean',
        :'currency_rate' => :'BigDecimal',
        :'remaining_credit' => :'BigDecimal',
        :'allocations' => :'Array<Allocation>',
        :'applied_amount' => :'BigDecimal',
        :'payments' => :'Array<Payment>',
        :'branding_theme_id' => :'String',
        :'status_attribute_string' => :'String',
        :'has_attachments' => :'Boolean',
        :'has_errors' => :'Boolean',
        :'validation_errors' => :'Array<ValidationError>',
        :'warnings' => :'Array<ValidationError>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `WorkflowMaxRuby::Accounting::CreditNote` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `WorkflowMaxRuby::Accounting::CreditNote`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.key?(:'contact')
        self.contact = attributes[:'contact']
      end

      if attributes.key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.key?(:'due_date')
        self.due_date = attributes[:'due_date']
      end

      if attributes.key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.key?(:'line_amount_types')
        self.line_amount_types = attributes[:'line_amount_types']
      end

      if attributes.key?(:'line_items')
        if (value = attributes[:'line_items']).is_a?(Array)
          self.line_items = value
        end
      end

      if attributes.key?(:'sub_total')
        self.sub_total = attributes[:'sub_total']
      end

      if attributes.key?(:'total_tax')
        self.total_tax = attributes[:'total_tax']
      end

      if attributes.key?(:'total')
        self.total = attributes[:'total']
      end

      if attributes.key?(:'cis_deduction')
        self.cis_deduction = attributes[:'cis_deduction']
      end

      if attributes.key?(:'cis_rate')
        self.cis_rate = attributes[:'cis_rate']
      end

      if attributes.key?(:'updated_date_utc')
        self.updated_date_utc = attributes[:'updated_date_utc']
      end

      if attributes.key?(:'currency_code')
        self.currency_code = attributes[:'currency_code']
      end

      if attributes.key?(:'fully_paid_on_date')
        self.fully_paid_on_date = attributes[:'fully_paid_on_date']
      end

      if attributes.key?(:'credit_note_id')
        self.credit_note_id = attributes[:'credit_note_id']
      end

      if attributes.key?(:'credit_note_number')
        self.credit_note_number = attributes[:'credit_note_number']
      end

      if attributes.key?(:'reference')
        self.reference = attributes[:'reference']
      end

      if attributes.key?(:'sent_to_contact')
        self.sent_to_contact = attributes[:'sent_to_contact']
      end

      if attributes.key?(:'currency_rate')
        self.currency_rate = attributes[:'currency_rate']
      end

      if attributes.key?(:'remaining_credit')
        self.remaining_credit = attributes[:'remaining_credit']
      end

      if attributes.key?(:'allocations')
        if (value = attributes[:'allocations']).is_a?(Array)
          self.allocations = value
        end
      end

      if attributes.key?(:'applied_amount')
        self.applied_amount = attributes[:'applied_amount']
      end

      if attributes.key?(:'payments')
        if (value = attributes[:'payments']).is_a?(Array)
          self.payments = value
        end
      end

      if attributes.key?(:'branding_theme_id')
        self.branding_theme_id = attributes[:'branding_theme_id']
      end

      if attributes.key?(:'status_attribute_string')
        self.status_attribute_string = attributes[:'status_attribute_string']
      end

      if attributes.key?(:'has_attachments')
        self.has_attachments = attributes[:'has_attachments']
      else
        self.has_attachments = false
      end

      if attributes.key?(:'has_errors')
        self.has_errors = attributes[:'has_errors']
      else
        self.has_errors = false
      end

      if attributes.key?(:'validation_errors')
        if (value = attributes[:'validation_errors']).is_a?(Array)
          self.validation_errors = value
        end
      end

      if attributes.key?(:'warnings')
        if (value = attributes[:'warnings']).is_a?(Array)
          self.warnings = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      type_validator = EnumAttributeValidator.new('String', ["ACCPAYCREDIT", "ACCRECCREDIT"])
      return false unless type_validator.valid?(@type)
      status_validator = EnumAttributeValidator.new('String', ["DRAFT", "SUBMITTED", "DELETED", "AUTHORISED", "PAID", "VOIDED"])
      return false unless status_validator.valid?(@status)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ["ACCPAYCREDIT", "ACCRECCREDIT"])
      unless validator.valid?(type)
        fail ArgumentError, "invalid value for \"type\", must be one of #{validator.allowable_values}."
      end
      @type = type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ["DRAFT", "SUBMITTED", "DELETED", "AUTHORISED", "PAID", "VOIDED"])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for \"status\", must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          type == o.type &&
          contact == o.contact &&
          date == o.date &&
          due_date == o.due_date &&
          status == o.status &&
          line_amount_types == o.line_amount_types &&
          line_items == o.line_items &&
          sub_total == o.sub_total &&
          total_tax == o.total_tax &&
          total == o.total &&
          cis_deduction == o.cis_deduction &&
          cis_rate == o.cis_rate &&
          updated_date_utc == o.updated_date_utc &&
          currency_code == o.currency_code &&
          fully_paid_on_date == o.fully_paid_on_date &&
          credit_note_id == o.credit_note_id &&
          credit_note_number == o.credit_note_number &&
          reference == o.reference &&
          sent_to_contact == o.sent_to_contact &&
          currency_rate == o.currency_rate &&
          remaining_credit == o.remaining_credit &&
          allocations == o.allocations &&
          applied_amount == o.applied_amount &&
          payments == o.payments &&
          branding_theme_id == o.branding_theme_id &&
          status_attribute_string == o.status_attribute_string &&
          has_attachments == o.has_attachments &&
          has_errors == o.has_errors &&
          validation_errors == o.validation_errors &&
          warnings == o.warnings
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [type, contact, date, due_date, status, line_amount_types, line_items, sub_total, total_tax, total, cis_deduction, cis_rate, updated_date_utc, currency_code, fully_paid_on_date, credit_note_id, credit_note_number, reference, sent_to_contact, currency_rate, remaining_credit, allocations, applied_amount, payments, branding_theme_id, status_attribute_string, has_attachments, has_errors, validation_errors, warnings].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(parse_date(value))
      when :Date
        Date.parse(parse_date(value))
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BigDecimal
        BigDecimal(value.to_s)
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        WorkflowMaxRuby::Accounting.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash(downcase: false)
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        key = downcase ? attr : param
        hash[key] = _to_hash(value, downcase: downcase)
      end
      hash
    end

    # Returns the object in the form of hash with snake_case
    def to_attributes
      to_hash(downcase: true)
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value, downcase: false)
      if value.is_a?(Array)
        value.map do |v|
          v.to_hash(downcase: downcase)
        end
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.map { |k, v| hash[k] = _to_hash(v, downcase: downcase) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash(downcase: downcase)
      else
        value
      end
    end

    def parse_date(datestring)
      if datestring.include?('Date')
        date_pattern = /\/Date\((-?\d+)(\+\d+)?\)\//
        original, date, timezone = *date_pattern.match(datestring)
        date = (date.to_i / 1000)
        Time.at(date).utc.strftime('%Y-%m-%dT%H:%M:%S%z').to_s
      else # handle date 'types' for small subset of payroll API's
        Time.parse(datestring).strftime('%Y-%m-%dT%H:%M:%S').to_s
      end
    end
  end
end
