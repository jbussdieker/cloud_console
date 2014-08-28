class Base
  def initialize(data = {})
    data.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end

  def to_param
    id
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
    Rails.cache.fetch(name.underscore.pluralize, namespace: params[:region], expires_in: 90.minutes) do
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
    client(params).send(describe_func).data[describe_result_key.to_sym].collect do |obj|
      new(obj.merge(params))
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
