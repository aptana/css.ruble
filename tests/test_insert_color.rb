require 'command_testcase'
require 'insert_color'

class InsertColorTest < CommandTestCase
  
  def command_name
    "Insert Color..."
  end
  
  def test_named_color_and_cancelled_dialog
    assert_equal("#FF0000", execute('red'))
    assert_output_type(:replace_selection)
  end
  
  def test_insert_color_takes_color_picked
    Ruble::UI.add_string_for_request("F0F0F0")
    assert_equal("F0F0F0", execute('red'))
    assert_output_type(:replace_selection)
  end
end