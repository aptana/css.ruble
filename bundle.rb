require 'ruble'
 
# its ruby, so this just adds commands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
bundle do |bundle|
  bundle.author = "Christopher Williams"
  bundle.copyright = "Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.display_name = t(:bundle_name)
  bundle.description = "CSS bundle for RadRails"
  bundle.repository = "git://github.com/aptana/css.ruble.git"
  
  # Folding is now done in Java code for this language, using AST from parse
  # Indentation
  indent_regexp = /\/\*\*(?!\*)|\{\s*($|\/\*(?!.*?\*\/.*\S))/
  dedent_regexp = /\*\*\/|^\s*\}/
  bundle.indent['source.css'] = indent_regexp, dedent_regexp
  bundle.indent['source.tss'] = indent_regexp, dedent_regexp

  # most commands install into a dedicated CSS menu
  bundle.menu t(:bundle_name) do |css_menu|
    # this menu should be shown when any of the following scopes is active:
    css_menu.scope = [ "source.css" ]
    
	  # command/snippet names must be unique within bundle and are case insensitive
	  css_menu.command t(:docs_for_property)
    css_menu.command t(:validate)
    css_menu.command t(:preview)
    css_menu.separator
    css_menu.command t(:insert_color)
    css_menu.separator 
    css_menu.command t(:format_single_line)
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
