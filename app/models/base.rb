class Base
  def initialize(data = {})
    data.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end

  def to_param
    id
  end

  def self.find(id)
    all.find { |needle| needle.to_param == id }
  end

  private

  def method_missing(name, *args, &block)
    instance_variable_get("@#{name}")
  end
end
