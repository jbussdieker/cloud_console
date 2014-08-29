class Base
  class_attribute :describe_function, instance_writer: false
  class_attribute :describe_result_key, instance_writer: false
  class_attribute :primary_key, instance_writer: false

  def self.describe_function
    @@describe_function = "describe_#{name.underscore.pluralize}"
  end

  def self.describe_result_key
    @@describe_result_key = "#{name.underscore}_set"
  end

  def initialize(data = {})
    data.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end

  def to_param
    id
  end

  def id
    send(self.primary_key)
  end

  def to_s
    name
  end

  def sort_key
    :name
  end

  def <=>(other)
    self.send(sort_key) <=> other.send(sort_key)
  end

  def self.all(params = { region: "us-east-1" })
    Rails.cache.fetch(name.underscore.pluralize, namespace: params[:region], expires_in: 10.seconds) do
      describe(params)
    end
  end

  def self.describe(client_params, describe_params = {})
    result = client(client_params).send(describe_function, describe_params)
    result.data[describe_result_key.to_sym].collect do |obj|
      new(obj.merge(client_params))
    end
  end

  def self.find(id, params = { region: "us-east-1" })
    all(params).find { |needle| needle.to_param == id }
  end

  private

  def self.client(params)
    AWS::EC2.new(params).client
  end

  def client(params)
    AWS::EC2.new(params).client
  end

  def method_missing(name, *args, &block)
    instance_variable_get("@#{name}")
  end
end
