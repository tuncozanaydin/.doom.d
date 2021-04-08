;;; ~/.dotfiles/.doom.d/+keybinds.el -*- lexical-binding: t; -*-

(map!
(:after evil
  :map (evil-motion-state-map
        evil-normal-state-map
        evil-visual-state-map)
  "n" 'evil-next-line
  "N" 'evil-join
  "j" 'evil-ex-search-next
  "J" 'evil-ex-search-previous
  "e" 'evil-previous-line
  "E" '+lookup/documentation
  "k" 'evil-forward-word-end
  "K" 'evil-forward-WORD-end
  "i" 'evil-forward-char
  "I" 'evil-window-bottom
  "l" 'evil-undo
  "L" 'evil-redo
  "u" 'evil-insert
  "U" 'evil-insert-line))

(map!
 (:after magit
  :map magit-mode-map
  :nv "n" 'evil-next-visual-line
  :nv "j" 'evil-ex-search-next
  :nv "J" 'evil-ex-search-previous
  :nv "e" 'evil-previous-visual-line
  :nv "k" 'magit-ediff-dwim
  :nv "h" 'evil-backward-char
  :nv "H" 'evil-window-top
  :nv "z" 'magit-dispatch
  :nv "y" 'magit-gitignore
  :nv "Y" 'evil-collection-magit-stage-untracked-file-with-intent
  :nv "i" 'evil-forward-char
  :nv "I" 'evil-window-bottom))
