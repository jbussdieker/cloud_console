class SecurityGroup < Base
  include Taggable

  self.describe_result_key = "#{name.underscore}_info"
  self.primary_key = :group_id

  belongs_to :vpc

  def name
    group_name
  end

  def instances
    Instance.all(region: region).find_all do |instance|
      instance.groups.find { |group| group.id == id } != nil
    end
  end
end

