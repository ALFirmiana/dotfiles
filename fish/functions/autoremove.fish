function autoremove --wraps='sudo pacman -R $(pacman -Qdtq)' --description 'alias autoremove=sudo pacman -R $(pacman -Qdtq)'
  sudo pacman -R $(pacman -Qdtq) $argv
        
end
