module BreadCrumbsHelper
  def crumb crum =[], category
    curmb = ''
    curmb << "<li class='category7'>"
    if crum.size > 0
      curmb << "<a href='/categories/#{category.id}'>"
    end
    curmb << "<strong>#{category.name}</strong>"
    if crum.size > 0
      curmb << '</a>'
    end
    if crum.size > 0
      curmb << "<span class='fa fa-angle-right'></span>"
    end
    curmb << "</li>"
    crum.unshift(curmb)
    unless category.parent.blank?
      crumb(crum, category.parent)
    end
  end
end
