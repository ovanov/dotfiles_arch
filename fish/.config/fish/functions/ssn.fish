# Defined in - @ line 1
function ssn --wraps='sudo shutdown now' --description 'alias ssn=sudo shutdown now'
  sudo shutdown now $argv;
end
