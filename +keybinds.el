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

