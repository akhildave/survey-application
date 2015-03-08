module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, { :sort => column, :direction => direction }, { :class => css_class }
  end


  def find_available_locales
    locales = {}
    I18n.available_locales.each { |locale| locales[locale] = t("locale_selector.#{locale}") }
    locales
  end

  def available_locales
    @available_locales ||= find_available_locales
  end
	def language_links
		links = []
		I18n.available_locales.each do |locale|
			locale_key = "translation.#{locale}"
			if locale == I18n.locale
				links << link_to(I18n.t(locale_key), "#", class: "btn disabled")
			else
				links << link_to(I18n.t(locale_key), url_for(locale: locale.to_s), class: "btn btn-link")
			end
		end
		links.join("\n").html_safe
	end
  
  
	def database_language_links
		links = []
		Language.all.each do |language|
      locale = language.code.to_sym
			locale_key = "translation.#{locale}"
			if locale == I18n.locale
				links << link_to(language.name, "#", class: "btn disabled")
			else
				links << link_to(language.name, url_for(locale: locale.to_s), class: "btn btn-link")
			end
		end
		links.join("\n").html_safe
	end
  
  
  
  
 
end
