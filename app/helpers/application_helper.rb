module ApplicationHelper
  def avatar_url(picture)
    picture || "http://placehold.it/30x30"
  end
end
