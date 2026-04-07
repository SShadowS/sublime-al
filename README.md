# AL for Sublime Text

Syntax highlighting, completions, and symbol indexing for the AL programming language used in Microsoft Dynamics 365 Business Central.

[![Package Control](https://img.shields.io/packagecontrol/dt/AL)](https://packagecontrol.io/packages/AL)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Overview

| Metric | Value |
|--------|-------|
| Syntax rules | 409 lines, 90 scopes |
| Completions | 228 keyword/type completions |
| File types | `.al`, `.dal` |
| Sublime version | 4 (syntax v2) |
| Tests | syntax_test_al.al |

## Features

| Feature | Details |
|---------|---------|
| **Syntax highlighting** | Full context-aware scoping for all AL constructs |
| **Object declarations** | `codeunit`, `table`, `page`, `report`, `enum`, etc. with ID and name |
| **Procedures and triggers** | Parameter types, return types, access modifiers |
| **Attributes** | `[Scope('OnPrem')]`, `[NonDebuggable]`, `[EventSubscriber]` |
| **Preprocessor** | `#if`, `#else`, `#endif`, `#pragma` with condition highlighting |
| **Strings** | Single-quoted `'text'` and verbatim `@'multiline'` |
| **AL-specific literals** | Date (`0D`), time (`0T`), datetime (`0DT`), biginteger (`1000L`) |
| **Keyword completions** | All AL keywords and built-in types |
| **Symbol indexing** | Jump to procedures/triggers with `Ctrl+R` |
| **Comment toggling** | Line (`Ctrl+/`) and block (`Ctrl+Shift+/`) |
| **Indentation** | Automatic begin/end block indentation |

## Installation

### Package Control (recommended)

1. Open Command Palette (`Ctrl+Shift+P`)
2. Select `Package Control: Install Package`
3. Search for `AL` and install

### Manual

```bash
cd "%APPDATA%/Sublime Text/Packages"
git clone https://github.com/SShadowS/sublime-al.git AL
```

## LSP Support

For full language intelligence (go-to-definition, hover, diagnostics, call hierarchy, code lens), install [LSP-AL](https://github.com/SShadowS/sublime-lsp-al):

1. Install `LSP-AL` via Package Control
2. The AL Language Server is downloaded automatically — no VS Code required

## Key Files

| File | Purpose |
|------|---------|
| `AL.sublime-syntax` | Syntax definition (context-aware, v2 format) |
| `AL.sublime-completions` | 228 keyword and type completions |
| `AL.tmPreferences` | Comment toggling and indentation rules |
| `AL.sublime-settings` | Default editor settings for AL files |
| `tests/syntax_test_al.al` | Syntax highlighting test suite |

## Regenerating Completions

If the AL language adds new keywords, regenerate completions from the [tree-sitter-al](https://github.com/SShadowS/tree-sitter-al) grammar:

```bash
node scripts/generate-completions.js /path/to/tree-sitter-al/grammar.js
```

---

**Author**: Torben Leth (sshadows@sshadows.dk)
**License**: MIT (see [LICENSE](LICENSE))
