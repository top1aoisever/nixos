{vars, ...}: {
  age = {
    identityPaths = [ "/etc/ssh/agenix_ed25519" ];
    secrets = {
      proton-ca = {
        file = ../secrets/protonvpn/proton_ca.age;
        name = "proton-ca.conf";
      };

      proton-jp = {
        file = ../secrets/protonvpn/proton_jp.age;
        name = "proton-jp.conf";
      };

      proton-nl = {
        file = ../secrets/protonvpn/proton_nl.age;
        name = "proton-nl.conf";
      };

      proton-ro = {
        file = ../secrets/protonvpn/proton_ro.age;
        name = "proton-ro.conf";
      };

      proton-sg = {
        file = ../secrets/protonvpn/proton_sg.age;
        name = "proton-sg.conf";
      };

      proton-us = {
        file = ../secrets/protonvpn/proton_us.age;
        name = "proton-us.conf";
      };

    };
  };
}
