module GadgetsHelper
  def no_maker(gadget)
    gadget.maker.name.presence || '-'
  end
end
