require './test/test_base.rb'

class MIMEBuilderTextTest < Test::Unit::TestCase
  def test_contenttype
  	test_text = 'Hello world!'

    filepart = MIMEBuilder::Text.new(test_text)

    assert_equal 'text/plain', filepart.mime.headers.get('Content-Type')

    assert_equal test_text, filepart.mime.body.to_s
  end

  def test_content_id_disable
    filepart = MIMEBuilder::Text.new 'Hello world!', :content_id_disable => true

    assert_equal nil, filepart.mime.headers.get('Content-Id')
  end
end