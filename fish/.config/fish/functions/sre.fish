# Defined in - @ line 1
function sre --wraps='sudo reboot' --description 'alias sre=sudo reboot'
  sudo reboot $argv;
end
