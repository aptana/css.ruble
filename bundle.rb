require 'ruble'

# its ruby, so this just adds commands/snippets in bundle (or replaces those with same name)
# many ruby files could add to a single bundle
bundle do |bundle|
  bundle.author = "Christopher Williams"
  bundle.copyright = "� Copyright 2010 Aptana Inc. Distributed under the MIT license."
  bundle.display_name = 'CSS'
  bundle.description = "CSS bundle for RadRails"
  bundle.repository = "git://github.com/aptana/css.ruble.git"
  # Set up folding
  folding_start_marker = /\/\*\*(?!\*)|\{\s*($|\/\*(?!.*?\*\/.*\S))/
  folding_stop_marker = /(?<!\*)\*\*\/|^\s*\}/
  bundle.folding['source.css'] = folding_start_marker, folding_stop_marker
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
    css_menu.menu "CodeCompletion" do |completion_menu|
      completion_menu.command "CodeCompletion CSS"
      completion_menu.command "CodeCompletion CSS Properties"
      completion_menu.command "CodeCompletion CSS Property Values"
    end
    css_menu.separator
    css_menu.command "Format CSS"
    css_menu.command "Format CSS Single-line"
  end
end

# Extend Ruble::Editor to add special ENV vars
module Ruble
  class Editor
    unless method_defined?(:modify_env_pre_css_bundle)
      alias :modify_env_pre_css_bundle :modify_env
      def modify_env(scope, env)
        env_hash = modify_env_pre_css_bundle(scope, env)
        if scope.start_with? "source.css"
          env_hash['TM_COMMENT_START'] = "/*"
          env_hash['TM_COMMENT_END'] = "*/"
          env_hash.delete('TM_COMMENT_START_2')
          env_hash.delete('TM_COMMENT_END_2')
          env_hash['TM_COMMENT_DISABLE_INDENT'] = 'yes'
        end
        env_hash
      end
    end
  end
end