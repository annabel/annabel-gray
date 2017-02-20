module ApplicationHelper

def full_title(page_title)
  base_title = "Annabel"
  page_title.empty? ? base_title : "#{base_title} | #{page_title}"
end

def meta_description(description)
  base_description = "Annabel Dunstone Gray"
  description.empty? ? base_description : description
end

def meta_keywords(page_keywords)
  base_keywords = "Annabel, Dunstone, Gray, Annabel Dunstone Gray, web, code, programming, web developer"
  if page_keywords.empty?
    base_keywords
  else
    "#{base_keywords}, #{page_keywords}"
  end
end

def nav_link(link_text, link_path, class_name=nil)
  if current_page?(link_path) || request.path.include?(link_path)
    content_tag(:li, class: "active #{class_name}") do
      link_to(link_text, link_path)
    end
  else
    content_tag(:li, class: class_name) do
      link_to(link_text, link_path)
    end
  end
end

end
