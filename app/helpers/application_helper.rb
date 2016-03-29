module ApplicationHelper
	def full_title(page_title='')
		base_title = "MyCues"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def object_title(name = nil)
		session[:obj] = name
	end

	def existing?(bol = false)
		session[:exs] = bol
	end

	def def_action(action = nil)
		session[:act] = action
	end
end
