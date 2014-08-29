class RegionCollection < BaseCollection
  def describe_result_key
    "#{target_name.underscore}_info"
  end
end
