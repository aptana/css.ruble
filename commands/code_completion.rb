require 'ruble'
require 'ruble/ui'
require 'properties'

command "CodeCompletion CSS Properties" do |cmd|
  cmd.key_binding = "CTRL+SPACE"
  cmd.output = :insert_as_snippet
  #cmd.input = [:selection, :line]
  cmd.input = :selection
  cmd.scope = "source.css"
  cmd.invoke do |context|
    options = CSS_PROPERTIES.keys # TODO Actual property list in Textmate is slightly different
    prefix = STDIN.read
    options = options.select {|word| word.index(prefix) == 0 } if !prefix.nil? and prefix.size > 0
    index = Ruble::UI.menu(options)
    options[index]
  end
end
