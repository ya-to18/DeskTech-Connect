module ApplicationHelper
  include Pagy::Frontend

  def page_title(page_title = '')
    base_title = 'DeskTech-Connect'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def truncate_name(name)
    truncate(name, length: 40, omission: '...')
  end
end
