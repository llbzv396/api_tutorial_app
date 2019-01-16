module ApplicationHelper
  def full_title(other_title = "")
    base_title = "Tutorial App"
    if other_title.empty?
      base_title
    else
      "#{other_title} | #{base_title}"
    end
  end
end
