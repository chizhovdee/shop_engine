module CategoriesHelper
  def fetch_all_categories(&block)
    yield Category.connection.select("SELECT id, name, parent_category_id, alias FROM categories ORDER BY position ASC")
  end

  def fetch_child_categories(category, categories, &block)
    child_categories = categories.select{|c| c['parent_category_id'] == category['id']}

    if child_categories.any? && block_given?
      yield(child_categories)
    end
  end
end