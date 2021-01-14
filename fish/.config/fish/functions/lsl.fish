# Defined in - @ line 1
function lsl --wraps='exa -l --color=always --group-directories-first' --description 'alias lsl=exa -l --color=always --group-directories-first'
  exa -l --color=always --group-directories-first $argv;
end
