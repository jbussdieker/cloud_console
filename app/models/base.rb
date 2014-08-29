class Base
  attr_accessor :client
  attr_accessor :region

  def initialize(data = {}, client = nil, region = nil)
    @client = client
    @region = region
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


  def self.describe(client)
    client.send(describe_func).data[describe_result_key.to_sym].collect do |obj|
      new(obj, client)
    end
  end

  def self.find(id, params = { region: "us-east-1" })
    all(params).find { |needle| needle.to_param == id }
  end

  private

  def method_missing(name, *args, &block)
    instance_variable_get("@#{name}")
  end
end
