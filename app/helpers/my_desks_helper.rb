module MyDesksHelper
  def my_desk_gadgets_present?(my_desk, gadgets)
    if gadgets.present?
      render partial: 'gadget', locals: { my_desk: my_desk, gadgets: gadgets }
    else
      render 'no_gadget'
    end
  end
end
