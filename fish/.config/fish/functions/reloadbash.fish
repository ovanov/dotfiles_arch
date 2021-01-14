# Defined in - @ line 1
function reloadbash --wraps='source ~/.bashrc' --description 'alias reloadbash=source ~/.bashrc'
  source ~/.bashrc $argv;
end
