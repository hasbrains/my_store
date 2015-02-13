class ItemsMailer < ActionMailer::Base
  
  default from: "info@mystore.localhost",
          template_path: 'mailers/items'

  def item_destroyed(item)
    @item = item
    mail to: 'romansnitko@yandex.ru',
         subject: "Item destroyed"
  end

end
