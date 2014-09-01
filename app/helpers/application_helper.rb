module ApplicationHelper
	def title(page_title)
		content_for :title, page_title.to_s
	end

	def breadcrumb_str options, is_admin
		items = []
		char_sep = "".html_safe
		if(options.size !=0 )
			items <<  content_tag(:li , :class => "active") do
				if is_admin
				link_to("Dashboard", admin_path) + content_tag(:span, char_sep, :class => "divider")
				else
				link_to("Home", root_path) + content_tag(:span, char_sep, :class => "divider")
				end
			end
			options.each do |option|
				option.each do |key, value|
					if !value.nil?
						items << content_tag(:li) do
							link_to(key, value) + content_tag(:span, char_sep, :class => "divider")
						end
					else
						items << content_tag(:li, key, :class =>"active")
					end
				end
			end
		else
			if is_admin
				items << content_tag(:li, "Dashboard", :class => "active")
			else
				items << content_tag(:li, "Home", :class => "active")
			end
		end

		items.join("").html_safe
	end

	def breadcrumb options, is_admin = false
		content_tag(:ol, breadcrumb_str(options, is_admin), :class => "breadcrumb")
	end
end
