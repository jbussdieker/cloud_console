class Base
  class Collection
    include Enumerable

    attr_accessor :klass, :params

    def initialize(klass, params = {})
      @klass = klass
      @params = params
    end

    def all
      fetch_objects
    end

    def length
      all.length
    end

    def each(&block)
      fetch_objects.each do |obj|
        yield(obj)
      end
    end

    def find(id)
      super() do |item|
        item.id == id
      end
    end

    def find_by(params)
      fetch_objects.each do |obj|
        match = true
        params.each do |k,v|
          match = false unless obj.send(k) == v
        end
        return obj if match
      end
      nil
    end

    private

    def fetch_objects
      Rails.cache.fetch(klass.name.underscore.pluralize, namespace: params[:region], expires_in: 30.minutes) do
        fetch_data.each do |obj|
          klass.new(obj)
        end
      end
    end

    def fetch_data
      klass.describe(params)
    end
  end

  def initialize(data = {})
    data.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end

  def to_param
    id
  end

  def name
    if instance_variable_defined? :@name
      instance_variable_get :@name
    elsif respond_to? :[]
      self["Name"] || id
    else
      id
    end
  end

  def id
    send(self.class.primary_key)
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

  def self.belongs_to(relation)
    define_method(relation) do
      klass = relation.to_s.singularize.camelize.constantize
      klass.find(send(klass.primary_key), region: region)
    end
  end

  def self.has_many(relation)
    define_method(relation) do
      relation.to_s.singularize.camelize.constantize.all(region: region).find_all do |obj|
        obj.send(self.class.primary_key) == id
      end
    end
  end

  def self.all(params = { region: "us-east-1" })
    Collection.new(self, params).all
  end

  def self.primary_key=(value)
    @primery_key = value
  end

  def self.primary_key
    @primery_key
  end

  def self.describe_function=(value)
    @describe_function = value
  end

  def self.describe_function
    @describe_function ||= "describe_#{name.underscore.pluralize}"
  end

  def self.describe_result_key=(value)
    @describe_result_key = value
  end

  def self.describe_result_key
    @describe_result_key ||= "#{name.underscore}_set"
  end

  def self.describe_args
    @describe_args ||= {}
  end

  def self.describe_args=(value)
    @describe_args = value
  end

  def self.describe(params)
    result = client(params).send(describe_function, describe_args)
    result.data[describe_result_key.to_sym].collect do |obj|
      new(obj.merge(params))
    end
  end

  def self.find(id, params = { region: "us-east-1" })
    Collection.new(self, params).find(id)
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
