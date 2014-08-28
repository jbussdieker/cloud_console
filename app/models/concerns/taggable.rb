module Taggable
  def [](key)
    tag = tag_set.find { |tag|
      tag[:key] == key
    }
    tag[:value] if tag
  end
end
