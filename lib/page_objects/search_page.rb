class SearchPage < SitePrismPage
  element :query_field, 'input#query'
  element :search_button, 'input#search'
  set_url '/'

  def search_for_item(item)
    query_field.set(item)
    search_button.click
    SearchResultPage.new
  end

end
