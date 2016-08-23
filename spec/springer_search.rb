require_relative 'spec_helper'

RSpec.describe 'springer_search' do


  before do
    @homepage = SearchPage.new
    @homepage.load
  end

  describe '#search' do

    context 'working' do
      let(:search_term) { Faker::Hipster.word }
      it '#search for random word' do
        @resultpage = @homepage.search_for_item(search_term)
        expect(@resultpage.number_of_results_correct?).to be_truthy
      end
    end
    context 'search for non existing content' do
      let(:search_term) { Faker::Hipster.words(15).join }
      it 'has no result' do
        @resultpage = @homepage.search_for_item(search_term)
        expect(@resultpage.no_result?).to be_truthy
      end
    end
  end
end
