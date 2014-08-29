class InstanceStatus < Base
  self.describe_function = :describe_instance_status
  self.primary_key = :instance_id
end
