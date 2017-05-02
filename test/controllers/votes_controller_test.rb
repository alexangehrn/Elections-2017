require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vote = votes(:one)
  end

  test "should get index" do
    get votes_url
    assert_response :success
  end

  test "should get new" do
    get new_vote_url
    assert_response :success
  end

  test "should create vote" do
    assert_difference('Vote.count') do
      post votes_url, params: { vote: { bureau_de_vote: @vote.bureau_de_vote, code_postal: @vote.code_postal, id_candidate: @vote.id_candidate, id_tour: @vote.id_tour } }
    end

    assert_redirected_to vote_url(Vote.last)
  end

  test "should show vote" do
    get vote_url(@vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_vote_url(@vote)
    assert_response :success
  end

  test "should update vote" do
    patch vote_url(@vote), params: { vote: { bureau_de_vote: @vote.bureau_de_vote, code_postal: @vote.code_postal, id_candidate: @vote.id_candidate, id_tour: @vote.id_tour } }
    assert_redirected_to vote_url(@vote)
  end

  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete vote_url(@vote)
    end

    assert_redirected_to votes_url
  end
end
