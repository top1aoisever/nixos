let
  agenixKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL8TeTt31YOzVXV4OH7jwh2ejXJ3/qtpDjkvmf80gcIo";
in {
  "protonvpn/proton_nl.age".publicKeys = [ agenixKey ];
  "protonvpn/proton_ca.age".publicKeys = [ agenixKey ];
  "protonvpn/proton_jp.age".publicKeys = [ agenixKey ];
  "protonvpn/proton_sg.age".publicKeys = [ agenixKey ];
  "protonvpn/proton_us.age".publicKeys = [ agenixKey ];
  "protonvpn/proton_ro.age".publicKeys = [ agenixKey ];
}
