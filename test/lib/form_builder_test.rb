# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_builder
    user = Struct.new(:name, :job, keyword_init: true).new name: 'rob', job: 'hexlet'
    assert { HexletCode.form_for(user) == load_fixture('empty_form.html') }

    expected_form_wit_url = load_fixture('form.html')
    form_with_url = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert { form_with_url == expected_form_wit_url }
  end
end
