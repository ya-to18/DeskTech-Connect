module GadgetsHelper
  def truncate_name(name)
    truncate(name, length: 40, omission: '...')
  end
end
