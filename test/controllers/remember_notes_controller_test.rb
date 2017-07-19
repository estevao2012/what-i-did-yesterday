require 'test_helper'

class RememberNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @remember_note = remember_notes(:one)
  end

  test "should get index" do
    get remember_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_remember_note_url
    assert_response :success
  end

  test "should create remember_note" do
    assert_difference('RememberNote.count') do
      post remember_notes_url, params: { remember_note: { description: @remember_note.description, title: @remember_note.title } }
    end

    assert_redirected_to remember_note_url(RememberNote.last)
  end

  test "should show remember_note" do
    get remember_note_url(@remember_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_remember_note_url(@remember_note)
    assert_response :success
  end

  test "should update remember_note" do
    patch remember_note_url(@remember_note), params: { remember_note: { description: @remember_note.description, title: @remember_note.title } }
    assert_redirected_to remember_note_url(@remember_note)
  end

  test "should destroy remember_note" do
    assert_difference('RememberNote.count', -1) do
      delete remember_note_url(@remember_note)
    end

    assert_redirected_to remember_notes_url
  end
end
