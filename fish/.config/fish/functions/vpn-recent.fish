# Defined in - @ line 1
function vpn-recent --wraps='sudo protonvpn r' --description 'alias vpn-recent=sudo protonvpn r'
  sudo protonvpn r $argv;
end
