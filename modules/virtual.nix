{pkgs , ...}: {
  environment.systemPackages = with pkgs; [
    qemu # qemu virtualizer  
    qemu_kvm

    quickemu # optimized virtual machines config
  ];
}
