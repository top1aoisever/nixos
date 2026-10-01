{vars, ...}: {  
  users.users.${vars.userName} = {
    isNormalUser = true;
    description = vars.fullName;
    extraGroups = [
      "wheel"
      "networkmanager"
      "wireshark"
      "wireguardvpn"
    ];
  };
}
