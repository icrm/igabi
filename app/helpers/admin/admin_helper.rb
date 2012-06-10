# -*- coding: utf-8 -*-
module Admin::AdminHelper
  def make_menu
    controllers = []
    controllers[0] = { alias: "Home",      controller: "admin/static_pages", action: "home" }
    controllers[1] = { alias: "Notícias",  controller: "admin/posts",        action: "index" }
    controllers[2] = { alias: "Arquivos",  controller: "admin/uploads",      action: "index" }
    controllers[3] = { alias: "Parceiros", controller: "admin/partners",     action: "index" }
    controllers[4] = { alias: "Usuários",  controller: "admin/users",        action: "index" }
    cr = request.env['PATH_INFO']
    p = Rails.application.routes.recognize_path cr
    pc = p[:controller]
    menu = ""
    selected = nil

    controllers.each do |controller|
      cc = controller[:controller]
      ca = controller[:action]
      Rails.application.routes.routes.each do |route|
        n = route.name
        c = route.defaults[:controller]
        a = route.defaults[:action]
        if (!n.nil? && !c.nil? && !a.nil?) && ( cc == c && ca == a )
          controller["verb"] = n + "_path"
          break
        end
      end
      selected = 'class="active"' if pc == controller[:controller]
      menu += make_menu_item controller[:alias], controller["verb"], selected, nil, {}
      selected = nil
    end
    menu.html_safe
  end


  private
    def make_menu_item(name, verb, item_class, item_style, link_to_options = {})
      l = link_to name, eval("#{verb}")
      "<li #{item_class} #{item_style}>#{l}</li>"
    end
end
