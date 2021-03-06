require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    	@user = User.create(username: "john", email: "ant@example.com", password: "password", admin: true)
  end

  test "get new article form and create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "olympics", description: "it might get cancelled"}
    end
    assert_template 'articles/show'
  end

end
