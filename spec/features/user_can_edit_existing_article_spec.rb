require 'rails_helper'

describe 'when a user is visiting an article\'s show page' do
  describe 'user clicks edit button' do
    describe 'user fills out edit forms and clicks submit' do
      it 'they can edit an article\'s name and/or body' do
        article1 = Article.create(title: 'Example 1', body: 'Example Body 1')
        updated_title = 'Updated Title'
        updated_body = 'Updated Body'

        visit article_path(article1)
        click_on 'Edit'

        expect(current_path).to eq(edit_article_path)

        fill_in 'article[title]', with: updated_title
        fill_in 'article[body]',  with: updated_body
        click_on 'Edit Article'

        expect(page).to have_content(updated_title)
        expect(page).to have_content(updated_body)
      end
    end
  end
end
