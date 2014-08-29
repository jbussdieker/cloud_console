class Image < Base
  self.describe_result_key = "images_set"

  def id
    image_id
  end

  def self.describe(params = { region: "us-east-1" })
    super(params, owners: ["self"])
  end
end
