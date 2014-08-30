class Image < Base
  include Taggable

  self.describe_result_key = "images_set"
  self.primary_key = :image_id
  self.describe_args = { owners: ["self"] }
end
