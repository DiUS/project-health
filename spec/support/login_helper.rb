module LoginHelper
  def mock_login user
    session.stub(:[]).with(anything).and_call_original
    session.stub(:[]).with(:user_id).and_return user.id
  end
end