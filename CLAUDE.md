# CLAUDE.md

Sublime Text syntax highlighting package for AL (Application Language) used in Microsoft Dynamics 365 Business Central.

## Project Structure

- `AL.sublime-syntax` — Main syntax definition (YAML, version 2). 42 contexts with moderate context stacking for object declarations, procedures, var sections, and attributes. Statement-level code uses flat keyword regex.
- `AL.sublime-settings` — File extensions (`.al`, `.dal`), tab/indent settings.
- `AL.tmPreferences` — Comment toggling (`//`, `/* */`), indent patterns (`begin`/`end`), symbol indexing for Goto Symbol.
- `AL.sublime-completions` — Generated keyword/type completions (228 entries). Regenerate with `node scripts/generate-completions.js <path-to-grammar.js>`.
- `tests/syntax_test_al.al` — Sublime syntax test file. Run via `Tools > Build` with `Syntax Tests` build system in Sublime.

## Related Projects

- **tree-sitter-al** (`U:/Git/tree-sitter-al/`) — Tree-sitter parser for AL. The authoritative reference for keywords, types, and language constructs. The completions generation script reads its `grammar.js`.
- **al-lsp-for-agents** (`U:/Git/claude-code-lsps/`) — Go wrapper around the AL Language Server. A future `LSP-AL` Sublime package would configure this as the LSP server.

## Development

### Syntax file format

- YAML only, no tabs (spaces only)
- All keyword matching uses `(?i:)` for case-insensitivity (AL is case-insensitive)
- Keywords matched with `\b` word boundaries
- `prototype` context auto-injects comments and preprocessor into all contexts
- Use `meta_include_prototype: false` in string/comment contexts to prevent injection

### Context stack design

```
main
├── namespace-using
├── object-header → object-body
│   ├── attributes ([ ... ])
│   ├── procedure-declarations → procedure-name → parameter-list → procedure-return
│   ├── var-sections → var-section → type-annotation
│   ├── section-keywords
│   └── nested-braces (recursive { } tracking)
├── comments (line and block)
├── preprocessor (directives with conditions)
├── strings (single-quoted and verbatim @'...')
├── quoted-identifiers ("...")
└── keywords (flat control/operator/type matching)
```

### Regenerating completions

When tree-sitter-al adds new keywords:
```bash
node scripts/generate-completions.js "U:/Git/tree-sitter-al/grammar.js"
```

### Testing

Sublime syntax tests use comment-based assertions:
- `// ^^^` tests scope at caret column positions on the line above
- `// <-` tests scope at the first non-whitespace character of the line above

Run tests in Sublime via `Tools > Build > Syntax Tests`.

## Scope Naming Conventions

| AL construct | Sublime scope |
|-------------|--------------|
| Object type keywords | `storage.type.al` |
| Control flow | `keyword.control.al` |
| Declarations (procedure, var) | `keyword.declaration.al` |
| Modifiers (local, internal) | `storage.modifier.al` |
| Section keywords (fields, actions) | `keyword.other.al` |
| Built-in types | `support.type.al` |
| Operators (and, or, not) | `keyword.operator.al` |
| Object/type names | `entity.name.type.al` |
| Procedure names | `entity.name.function.al` |
| Parameter names | `variable.parameter.al` |
| Variable names | `variable.other.al` |
| Attributes | `meta.annotation.al` / `variable.annotation.al` |
| Preprocessor | `keyword.control.import.al` |
| Strings | `string.quoted.single.al` / `string.quoted.other.al` |
| Quoted identifiers | `variable.other.quoted.al` |
| Constants | `constant.language.al` / `constant.numeric.*.al` |
