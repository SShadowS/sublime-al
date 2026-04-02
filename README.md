# AL for Sublime Text

Syntax highlighting for the AL programming language used in Microsoft Dynamics 365 Business Central.

## Features

- Full syntax highlighting for AL files (`.al`, `.dal`)
- Context-aware scoping for object declarations, procedures, var sections, and attributes
- Preprocessor directive highlighting (`#if`, `#else`, `#endif`, `#pragma`)
- Keyword completions for all AL keywords and built-in types
- Symbol indexing — jump to procedures/triggers with `Ctrl+R`
- Line and block comment toggling (`Ctrl+/`, `Ctrl+Shift+/`)
- Proper indentation rules for begin/end blocks

## Installation

### Package Control (recommended)

1. Open Command Palette (`Ctrl+Shift+P`)
2. Select `Package Control: Install Package`
3. Search for `AL` and install

### Manual

1. Clone this repo into your Sublime Text Packages directory:
   ```
   cd "%APPDATA%/Sublime Text/Packages"
   git clone https://github.com/SShadowS/sublime-al.git AL
   ```
2. Restart Sublime Text

## LSP Support

For full language intelligence (go-to-definition, diagnostics, completions), install the [LSP-AL](https://github.com/SShadowS/LSP-AL) package which connects to the AL Language Server.

## Highlighting Examples

The syntax highlights:
- **Object declarations** — `codeunit`, `table`, `page`, etc. with ID and name
- **Procedures and triggers** — with parameter types and return types
- **Attributes** — `[Scope('OnPrem')]`, `[NonDebuggable]`
- **Preprocessor** — `#if`, `#else`, `#endif` with condition highlighting
- **Strings** — single-quoted `'text'` and verbatim `@'multiline'`
- **AL-specific literals** — date (`0D`), time (`0T`), datetime (`0DT`), biginteger (`1000L`)

## Regenerating Completions

If the AL language adds new keywords, regenerate completions from the [tree-sitter-al](https://github.com/SShadowS/tree-sitter-al) grammar:

```bash
node scripts/generate-completions.js /path/to/tree-sitter-al/grammar.js
```

## License

MIT
