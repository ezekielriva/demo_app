module ApplicationHelper

  def full_title(page_title)
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def alert_class(key)
    key unless key == 'error'
    'danger'
  end
end
