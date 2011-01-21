require 'ruble'

template "CSS Template" do |t|
  t.filetype = "*.css"
  t.invoke do |context|
    ENV['TM_DATE'] = Time.now.strftime("%Y-%m-%d")
    raw_contents = IO.read("#{ENV['TM_BUNDLE_SUPPORT']}/../templates/template.css")
    raw_contents.gsub(/\$\{([^}]*)\}/) {|match| ENV[match[2..-2]] }
 end
end