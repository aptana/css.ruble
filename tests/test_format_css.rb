require 'command_testcase'
require 'format_css'

class FormatCSSTest < CommandTestCase
  
  def command_name
    "Format CSS"
  end
  
  def test_format_css
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
body {
  color: red;
  background-color: black;
}
h1 {
  font-family: monospace;
}
EOL
    assert_equal(expected, execute(input))
    assert_output_type(:replace_selection)
  end
end