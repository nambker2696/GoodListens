module ApplicationHelper
	def is_active?(page_name)
  		"active" if params[:controller] == page_name
	end
	def get_name_categories categories
		name = ""
		categories.each do |c|
			name += c.name + ", "
		end
		name = name[0..-3]
	end
end
