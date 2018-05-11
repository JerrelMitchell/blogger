require 'rails_helper'

describe 'user creates a new article' do
  describe 'when clicking link from the articles index' do
    describe 'and fill in a title and body to text fields' do
      it 'creates a new article' do
        title = 'New Title'
        body = 'New Body'
        flash_message = "Article #{title} was created!"

        visit articles_path
        click_link 'Create A New Article'

        expect(current_path).to eq(new_article_path)

        fill_in 'article[title]', with: title
        fill_in 'article[body]',  with: body
        click_on 'Create Article'

        expect(page).to have_content(title)
        expect(page).to have_content(body)
        expect(page).to have_content(flash_message)
      end
    end
  end
end
