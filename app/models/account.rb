class Account < ActiveRecord::Base
  belongs_to :user

  def regions
    RegionCollection.new(ec2)
  end

  def ec2
    AWS::EC2.new(
      access_key_id: access_key_id,
      secret_access_key: secret_access_key,
    )
  end
end
