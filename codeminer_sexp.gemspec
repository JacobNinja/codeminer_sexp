Gem::Specification.new do |s|
  s.name = 'codeminer_sexp'
  s.version = '0.1.0'
  s.date = '2014-07-10'

  s.summary = 'RubyParser AST compatible formatters for CodeMiner'
  s.description = 'Adds compatibility to CodeMiner syntax nodes to be processed with the sexp_processor gem'

  s.authors = ['Jacob Richardson']
  s.email = 'jacob.ninja.dev@gmail.com'

  s.require_paths = %w[lib]

  s.files = %w[
    codeminer_sexp.gemspec
    lib/codeminer_sexp.rb
    lib/codeminer_sexp/formatters/call.rb
    lib/codeminer_sexp/formatters/dynamic_string.rb
    lib/codeminer_sexp/formatters/root.rb
    lib/codeminer_sexp/formatters/string.rb
    lib/codeminer_sexp/formatters/string_embexp.rb
  ]
end
