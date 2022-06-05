# frozen_string_literal: true

require "test_helper"

class TagTest < Minitest::Test
  def test_single_tag
    assert FormBuilder::Tag.build("a") == "<a>"
    assert FormBuilder::Tag.build("a", class: "link-test") == "<a class=\"link-test\">"
  end

  def test_pair_tag
    assert FormBuilder::Tag.build("div") == "<div></div>"
    assert FormBuilder::Tag.build("div", class: "test", title: "text") {
             "inner text"
           } == "<div class=\"test\" title=\"text\">inner text</div>"
  end
end
