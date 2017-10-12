module Admin::CategoriesHelper
  def subcategories_recursive(category)
    content = ''
    content << "<li class='action_cat_hidden'>"
    content << "#{link_to "Sửa", edit_admin_category_path(category), class: 'text-danger'}"
    content << "<a class='cat-#{category.id}' href='#modal-default' class='text-warning' data-toggle='modal' data-target='#modal-delete-cat' cat_id=#{category.id} >
                Xóa
              </a>"
    content << "</li>"
    content << "<li class='cate_content #{category.subcategories.present? ? 'treeview' : ''}'>"
    content << "<a href='#' class='cat-#{category.id} %>'><i class='fa fa-circle-o'></i>#{category.name}"
    if category.subcategories.present?
      content << "<span class='pull-right-container'>"
      content << "<i class='fa fa-angle-left pull-right'></i>"
      content << "</span>"
    end
    content << "</a>"
    if category.subcategories.present?
      content << "<ul class='treeview-menu' >"
      category.subcategories.each do |sub|
        content << subcategories_recursive(sub)
      end
      content << "</ul>"
    end
    content << "</li>"
    content.html_safe
  end
end
