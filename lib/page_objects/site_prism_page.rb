class SitePrismPage < SitePrism::Page
  element :search_input_field, 'input#lst-ib'

  def wait_for_ajax
     Timeout.timeout(Capybara.default_max_wait_time) do
       active = self.evaluate_script('jQuery.active')
       active = self.evaluate_script('jQuery.active') until active == 0
     end
  end
end
