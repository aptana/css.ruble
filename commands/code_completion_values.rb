require 'radrails'
require 'radrails/ui'
require 'property_values'

command "CodeCompletion CSS Property Values" do |cmd|
  cmd.key_binding = "M1+SHIFT+`" # FIXME: should be "M1+~"
  cmd.output = :insert_as_snippet
  #cmd.input = [:selection, :line]
  cmd.input = :selection
  cmd.scope = "source.css"
  cmd.invoke do |context|
    options = CSS_PROPERTY_VALUES
    prefix = context.in.read
    options = options.select {|word| word.index(prefix) == 0 } if !prefix.nil? and prefix.size > 0
    index = RadRails::UI.menu(options)
    options[index]
  end
end
