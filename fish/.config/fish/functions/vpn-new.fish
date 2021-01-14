# Defined in - @ line 1
function vpn-new --wraps='sudo protonvpn c' --description 'alias vpn-new=sudo protonvpn c'
  sudo protonvpn c $argv;
end
