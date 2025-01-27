# { ... }:

[
  { "key" = "ctrl+,"; "command" = "-workbench.action.openSettings"; }
  { "key" = "ctrl+,"; "command" = "extension.toggleComma"; "when" = "editorTextFocus"; }
  { "key" = "ctrl+;"; "command" = "extension.toggleSemicolon"; "when" = "editorTextFocus"; }
  { "key" = "ctrl+'"; "command" = "workbench.action.terminal.toggleTerminal"; "when" = "terminal.active"; }
  { "key" = "ctrl+i"; "command" = "-emojisense.quickEmoji"; "when" = "editorTextFocus"; }
  { "key" = "ctrl+q"; "command" = "-workbench.action.quit"; "when" = "editorTextFocus"; }
  { "key" = "ctrl+q"; "command" = "workbench.action.navigateToLastEditLocation"; "when" = "editorTextFocus"; }
  # Essa aqui eu não faço a menor ideia do que fazia
  { "key" = "ctrl+shift+;"; "command" = "-breadcrumbs.focus"; "when" = "breadcrumbsPossible && breadcrumbsVisible"; }
  { "key" = "ctrl+shift+;"; "command" = "extension.toggleColon"; "when" = "editorTextFocus"; }
  { "key" = "ctrl+shift+i"; "command" = "-emojisense.quickEmojitext"; "when" = "editorTextFocus"; }
  { "key" = "ctrl+shift+[BracketLeft]"; "command" = "-workbench.action.terminal.toggleTerminal"; "when" = "terminal.active"; }
  { "key" = "ctrl+shift+d"; "command" = "-workbench.view.debug"; "when" = "viewContainer.workbench.view.debug.enabled"; }
  { "key" = "ctrl+shift+d"; "command" = "lafe.duplicateCode"; "when" = "editorTextFocus"; }
]
