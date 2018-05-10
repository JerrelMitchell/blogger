require 'rails_helper'

describe 'user sees all articles' do
  describe 'they visit /articles' do
    it 'displays all articles' do
      create_link = 'Create A New Article'
      article1 = Article.create!(title: 'Title 1', body: 'Body 1')
      article2 = Article.create!(title: 'Title 2', body: 'Body 2')

      visit '/articles'

      expect(page).to have_link(article1.title)
      expect(page).to have_link(article2.title)
      expect(page).to have_link(create_link)
    end
  end
end
