require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  def setup
		@article = Article.create(title: "Real Madrid", description: "won UCL")
		@user = User.create(username: "john", email: "ant@example.com", password: "password", admin: true)
	end

	test "should get articles index" do
		get :index
		assert_response :success
	end

	test "should get new" do
		session[:user_id] = @user.id
		get :new
		assert_response :success
	end

	# test "should get show" do
	# 	get(:show, {'id' => @article.id})
	# 	assert_response :success
	# end

	# test "should redirect create when admin not logged in" do
	# 	assert_no_difference 'Article.count' do
	# 		post :create, article: {title: "Real Madrid", description: "won UCL"}
	# 	end
	# 	assert_redirected_to articles_path
	# end
end
