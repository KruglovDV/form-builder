# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    assert !::HexletCode::VERSION.nil?
  end

  def test_form_builder_with_empty_body
    user = create_user
    assert { HexletCode.form_for(user) == load_fixture('empty_form.html') }
  end

  def test_form_builder_wit_fields
    user = create_user
    expected_form = load_fixture('form.html')
    form = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert { form == expected_form }
  end
end
