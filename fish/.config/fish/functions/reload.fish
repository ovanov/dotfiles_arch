# Defined in - @ line 1
function reload --wraps='source ~/.config/omf/init.fish' --description 'alias reload=source ~/.config/omf/init.fish'
  source ~/.config/omf/init.fish $argv;
end
