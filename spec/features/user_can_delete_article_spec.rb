require 'rails_helper'

describe 'user can delete an article' do
  describe 'when visiting the article\'s show page' do
    it 'displays all articles except deleted article' do
      article1 = Article.create(title: 'Example 1', body: 'Example Body 1')
      article2 = Article.create(title: 'Example 2', body: 'Example Body 2')
      flash_message = 'Article deleted!'

      visit articles_path

      expect(page).to have_content(article1.title)
      expect(page).to have_content(article2.title)

      visit article_path(article1)
      click_link 'Delete'

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article2.title)
      expect(page).to_not have_content(article1.title)
      expect(page).to have_content(flash_message)
    end
  end
end
