class Base
  def initialize(data = {})
    data.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end

  def to_param
    id
  end

  def self.all(params = { region: "us-east-1" })
    Rails.cache.fetch("#{params[:region]}_#{name.underscore.pluralize}", expires: 1.minute) do
      describe(params)
    end
  end

  def self.describe_func
    "describe_#{name.underscore.pluralize}"
  end

  def self.describe_result_key
    "#{name.underscore}_set"
  end

  def self.describe(params)
    client(params).send(describe_func).data[describe_result_key.to_sym].collect { |obj| new(obj) }
  end

  def self.find(id)
    all.find { |needle| needle.to_param == id }
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
