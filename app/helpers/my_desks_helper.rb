module MyDesksHelper
  def my_desk_gadgets_present?(mydesk, gadget)
    if gadget.present?
      render 'gadget', my_desk: mydesk, gadgets: gadget
    else
      render 'no_gadget'
    end
  end
end
