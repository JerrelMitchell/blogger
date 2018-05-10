require 'spec_helper'

describe 'user sees one article' do
  describe 'when visiting from link in articles index' do
    it 'displays information for one article' do
      article = Article.create!(title: 'Another New Title Dude',
                                body: 'Whoa no way')
      visit articles_path
      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end
