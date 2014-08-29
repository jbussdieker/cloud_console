class Image < Base
  self.primary_key = :image_id
  self.describe_result_key = :images_set

  def self.describe(params = { region: "us-east-1" })
    super(params, owners: ["self"])
  end
end
