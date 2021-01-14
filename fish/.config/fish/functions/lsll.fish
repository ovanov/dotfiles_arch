# Defined in - @ line 1
function lsll --wraps='exa -al --color=always --group-directories-first' --description 'alias lsll=exa -al --color=always --group-directories-first'
  exa -al --color=always --group-directories-first $argv;
end
