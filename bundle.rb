require 'ruble'
 
# its ruby, so this just adds commands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
bundle do |bundle|
  bundle.author = "Christopher Williams"
  bundle.copyright = "Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.display_name = 'CSS'
  bundle.description = "CSS bundle for RadRails"
  bundle.repository = "git://github.com/aptana/css.ruble.git"
  # Set up folding. Folding is now done in Java code for this language
  folding_start_marker = /\/\*\*(?!\*)|\{\s*($|\/\*(?!.*?\*\/.*\S))/
  folding_stop_marker = /(?<!\*)\*\*\/|^\s*\}/
  # bundle.folding['source.css'] = folding_start_marker, folding_stop_marker
  # Indentation
  # FIXME Textmate had none defined, does re-using the folding regexps make sense?
  bundle.indent['source.css'] = folding_start_marker, folding_stop_marker

  # most commands install into a dedicated CSS menu
  bundle.menu "CSS" do |css_menu|
    # this menu should be shown when any of the following scopes is active:
    css_menu.scope = [ "source.css" ]
    
	  # command/snippet names must be unique within bundle and are case insensitive
	  css_menu.command "Documentation for Property"
    css_menu.command "Validate Selected CSS"
    css_menu.command "Preview"
    css_menu.separator
    css_menu.command "Insert Color..."
    css_menu.separator 
    css_menu.command "Format CSS Single-line"
  end
end

# Extend Ruble::Editor to add special ENV vars
env "source.css" do |e|
  e['TM_COMMENT_START'] = "/*"
  e['TM_COMMENT_END'] = "*/"
  e.delete('TM_COMMENT_START_2')
  e.delete('TM_COMMENT_END_2')
  e['TM_COMMENT_DISABLE_INDENT'] = 'yes'
end

smart_typing_pairs["source.css"] = ['"', '"', '(', ')', '{', '}', '[', ']', "'", "'", '`', '`']