class Volume < Base
  include Taggable

  def id
    volume_id
  end

  def name
    self["Name"] || id
  end
end
