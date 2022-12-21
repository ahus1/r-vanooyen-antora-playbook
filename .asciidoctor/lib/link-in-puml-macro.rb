RUBY_ENGINE == 'opal' ? (require 'link-in-puml-macro/extension') : (require_relative 'link-in-puml-macro/extension')

Extensions.register do
  inline_macro LinkInPumlMacro
end
