require 'ruble'
 
command t(:preview) do |cmd|
  cmd.key_binding = "M1+M2+P"
  cmd.output = :show_as_html
  cmd.input = :selection 
  cmd.scope = "source.css"
  cmd.invoke do |context|
    require 'preview_generator'
    preview_css($stdin.read, ENV)
  end
end