require 'ruble'
 
command t(:format_single_line) do |cmd|
  cmd.output = :replace_selection
  cmd.input = :selection 
  cmd.scope = "source.css"
  cmd.invoke do |context|
    code = $stdin.read
    code.gsub!(/\n{3,}/im, "\n\n")
    code.gsub!(/[ \t]+/im, " ")
    code.gsub!(/(?m)([;:])\s+/im) {|match| "#{$1}" }
    code.gsub!(/\s*\}/im, "}")
    code.gsub!(/\s*\{\s*/im, "{")
    code.gsub!(/[ \t]*,[ \t]*/im, ",")
    code.gsub!(/@import(.*?);/im) {|match| "@import#{$1};\n\n" }
    code
  end
end