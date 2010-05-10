# require 'ruble'
# require 'ruble/ui'
# require 'property_values'
# 
# command "CodeCompletion CSS Property Values" do |cmd|
#   cmd.key_binding = "CTRL+SPACE"
#   cmd.output = :insert_as_snippet
#   #cmd.input = [:selection, :line]
#   cmd.input = :selection
#   cmd.scope = "source.css"
#   cmd.invoke do |context|
#     options = CSS_PROPERTY_VALUES
#     prefix = STDIN.read
#     options = options.select {|word| word.index(prefix) == 0 } if !prefix.nil? and prefix.size > 0
#     if options && !options.empty?
#       index = Ruble::UI.menu(options)
#       options[index]
#     else
#       prefix
#     end
#   end
# end
