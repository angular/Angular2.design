class TemplateConfig {
  final List<Module> modules = [];
  // used by compiler to create selector for directive matching
  final List<DirectiveDescriptor> directives = [];
  // usde by Parser during expression parsing.
  final List<FormatterDescriptor> formatters = [];
}

