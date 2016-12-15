require './test/test_base.rb'

require 'base64'

class MIMEBuilderJsonTest < Test::Unit::TestCase
  def test_base
    test_json = { hello: 'world' }

    json_part = MIMEBuilder::JSON.new(test_json)

    assert_equal 'application/json', json_part.mime.headers.get('Content-Type')
    assert_equal Base64.encode64(MultiJson.encode(test_json)), json_part.mime.body.to_s
    assert_equal nil, json_part.mime.headers.get('Content-Id')
  end

  def test_no_base64
    test_json = { hello: 'world' }
    test_json = MultiJson.encode(test_json)

    json_part = MIMEBuilder::JSON.new test_json, encode_base64: false

    assert_equal test_json, json_part.mime.body.to_s
  end
end
