=begin
#WorkflowMax Invoices API

#This is the WorkflowMax Invoices API

Contact: blair@hireassemble.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.1

=end

module WorkflowMaxRuby::Invoices
  require 'bigdecimal'

  class Task
    attr_accessor :uuid
    attr_accessor :name
    attr_accessor :description
    attr_accessor :minutes
    attr_accessor :billable_rate
    attr_accessor :billable
    attr_accessor :amount
    attr_accessor :amount_tax
    attr_accessor :amount_including_tax


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'uuid' => :'UUID',
        :'name' => :'Name',
        :'description' => :'Description',
        :'minutes' => :'Minutes',
        :'billable_rate' => :'BillableRate',
        :'billable' => :'Billable',
        :'amount' => :'Amount',
        :'amount_tax' => :'AmountTax',
        :'amount_including_tax' => :'AmountIncludingTax'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'uuid' => :'String',
        :'name' => :'String',
        :'description' => :'String',
        :'minutes' => :'Integer',
        :'billable_rate' => :'Float',
        :'billable' => :'Boolean',
        :'amount' => :'Float',
        :'amount_tax' => :'Float',
        :'amount_including_tax' => :'Float'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `WorkflowMaxRuby::Invoices::Task` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `WorkflowMaxRuby::Invoices::Task`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'uuid')
        self.uuid = attributes[:'uuid']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'minutes')
        self.minutes = attributes[:'minutes']
      end

      if attributes.key?(:'billable_rate')
        self.billable_rate = attributes[:'billable_rate']
      end

      if attributes.key?(:'billable')
        self.billable = attributes[:'billable']
      end

      if attributes.key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.key?(:'amount_tax')
        self.amount_tax = attributes[:'amount_tax']
      end

      if attributes.key?(:'amount_including_tax')
        self.amount_including_tax = attributes[:'amount_including_tax']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @name.nil?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
        uuid == o.uuid &&
        name == o.name &&
        description == o.description &&
        minutes == o.minutes &&
        billable == o.billable &&
        billable_rate == o.billable_rate &&
        amount == o.amount &&
        amount_tax == o.amount_tax &&
        amount_including_tax == o.amount_including_tax
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [uuid, name, description, minutes, billable, billable_rate, amount, amount_tax, amount_including_tax].hash
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
        WorkflowMaxRuby::Invoices.const_get(type).build_from_hash(value)
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
  end
end
