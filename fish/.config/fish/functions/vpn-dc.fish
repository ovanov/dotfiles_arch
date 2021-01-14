# Defined in - @ line 1
function vpn-dc --wraps='sudo protonvpn d' --description 'alias vpn-dc=sudo protonvpn d'
  sudo protonvpn d $argv;
end
