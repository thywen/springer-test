class SearchResultPage < SitePrismPage
  elements :search_results, 'ol#results-list li'
  elements :result_numbers_and_term, 'h1 strong'
  element :no_result_message, 'div#no-results-message'

  NUMBER_OF_ELEMENTS_ON_PAGE = 20

  def get_number_of_results
    result_numbers_and_term.first.text.gsub(',','').to_i
  end

  def get_search_term
    result_numbers_and_term.last.text.gsub("'", '')
  end

  def number_of_results_correct?
    if get_number_of_results > NUMBER_OF_ELEMENTS_ON_PAGE
      search_results.size == NUMBER_OF_ELEMENTS_ON_PAGE
    else
      search_results.size == get_number_of_results
    end
  end

  def search_term_correct?(term)
    term == get_search_term
  end

  def no_result?
    no_result_message.visible?
  end
end
