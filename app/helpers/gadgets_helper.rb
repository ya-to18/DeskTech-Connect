module GadgetsHelper
  def no_maker(gadget)
    if gadget.maker.name.present?
      gadget.maker.name
    else
      "-"
    end
  end
end