module PagesHelper
  def page_link(page)
    if page['alias'] == Settings.pages.root_alias
      link_to(page['title'], root_path)
    elsif page['service'] == 1
      link_to(page['title'], page['alias'])
    else
      link_to(page['title'], "pages/#{ page['alias'] }")
    end
  end

  def fetch_pages
    Page.connection.select("SELECT id, title, alias, service FROM pages ORDER BY position ASC")
  end
end