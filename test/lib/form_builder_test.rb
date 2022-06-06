# frozen_string_literal: true

require "test_helper"

class FormBuilderTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FormBuilder::VERSION
  end

  def test_form_builder
    user = Struct.new(:name, :job, keyword_init: true).new name: "rob"

    expected_empty_form = "<form action=\"#\" method=\"post\"></form>"
    empty_form = FormBuilder.from_for user do |f|
    end
    puts empty_form
    assert empty_form == expected_empty_form

    expected_form_wit_url = "<form action=\"/users\" method=\"post\"></form>"
    form_with_url = FormBuilder.from_for user, url: "/users" do |f|
    end
    assert form_with_url == expected_form_wit_url
  end
end
