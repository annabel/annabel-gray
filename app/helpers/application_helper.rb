module ApplicationHelper

def meta_description(description)
  base_description = "Annabel Dunstone - Web Developer"
  description.empty? ? base_description : description
end

def meta_keywords(page_keywords)
  base_keywords = "Annabel, Dunstone, Annabel Dunstone, web, code, programming, web developer"
  if page_keywords.empty?
    base_keywords
  else
    "#{base_keywords}, #{page_keywords}"
  end
end

end