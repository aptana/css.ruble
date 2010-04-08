require 'command_testcase'
require 'format_css_singleline'

class FormatCSSSinglelineTest < CommandTestCase
  
  def command_name
    "Format CSS Single-line"
  end
  
  def test_format_css_singeline
    input =<<EOL
body {
  color: red;
  background-color: black;
}
h1 {
  font-family: monospace;
}
EOL
    expected =<<EOL
body{color:red;background-color:black;}
h1{font-family:monospace;}
EOL
    assert_equal(expected, execute(input))
    assert_output_type(:replace_selection)
  end
end