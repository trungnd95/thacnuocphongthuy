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

  # def homepages_cat_recursive cat
  #   content = [];
  #   content << "<div class='header-button lang-list full_mode'>"
  #   content << "<div class='header-button-title'><span class='current'>#{cat.name}</span></div>"
  #   content << "<ul>"
  #   content <<
  # end
end

# <div class="header-button lang-list full_mode">
#                 <div class="header-button-title"><span class="current">TINH DAU</span></div>
#                 <ul>
#                   <li>
#                     <a  class="selected" href="https://livedemo00.template-help.com/magento_57714/?___store=english&amp;___from_store=english" title="en_US"><span>English</span><span class="mobile-part">en</span></a>
#                   </li>
#                   <li>
#                     <a  href="https://livedemo00.template-help.com/magento_57714/?___store=german&amp;___from_store=english" title="de_DE"><span>German</span><span class="mobile-part">de</span></a>
#                   </li>
#                   <li>
#                     <a  href="https://livedemo00.template-help.com/magento_57714/?___store=spanish&amp;___from_store=english" title="es_ES"><span>Spanish</span><span class="mobile-part">es</span></a>
#                   </li>
#                   <li>
#                     <a  href="https://livedemo00.template-help.com/magento_57714/?___store=russian&amp;___from_store=english" title="ru_RU"><span>Russian</span><span class="mobile-part">ru</span></a>
#                   </li>
#                 </ul>
#               </div>
