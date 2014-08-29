class Image < Base
  include Taggable

  self.describe_result_key = "images_set"
  self.primary_key = :image_id

  def name
    @name
  end

  def self.describe(params = { region: "us-east-1" })
    super(params, owners: ["self"])
  end
end
