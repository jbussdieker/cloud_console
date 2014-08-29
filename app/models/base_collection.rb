class BaseCollection
  include Enumerable

  attr_accessor :client

  def find(id)
    super() do |item|
      item.id == id
    end || raise("#{target_name} not found with id #{id}")
  end

  def each(&block)
    describe.each do |item|
      yield(item)
    end
  end

  def initialize(client)
    @client = client
  end

  private

  def target_name
    self.class.name.chomp("Collection")
  end

  def describe_func
    "describe_#{target_name.underscore.pluralize}"
  end

  def describe_result_key
    "#{target_name.underscore}_set"
  end

  def describe(params = {})
    result = client.client.send(describe_func, params)
    result.data[describe_result_key.to_sym].collect do |obj|
      target_name.constantize.new(obj, client)
    end
  end
end
