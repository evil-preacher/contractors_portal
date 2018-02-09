module CategoriesHelper
  def generate_menu
    categories = current_user.company.categories
    cat_sort = []
    categories.each do |category|
      parent_id = category.parent_code.to_i
      if cat_sort[parent_id].nil?
        cat_sort[parent_id] = Array.new
      end
      cat_sort[parent_id] << [category]
    end

    return build_menu_tree cat_sort
  end

  def build_menu_tree(cat_sort, parent_id = 0, result = '')
    elements = cat_sort[parent_id]
    if !elements.nil?
      result += '<ul class="nav nav-sidebar nav-stacked">'
      elements.each do |category|
        result += '<li>'
        result += category[0].title
        result += build_menu_tree(cat_sort, category[0].id)
        result += '</li>'
      end
      result += '</ul>'
    end
    return result
  end
end
