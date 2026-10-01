{lib, ...}: {
  zramSwap = {
    enable = true;

    algorithm = "zstd";

    priority = 100;

    memoryPercent = 50;
  };

  boot.kernel.sysctl = {
    # vm.swappiness - Controls kernel preference for swapping (range: 0-200, default: 60)
    # For in-memory swap devices like zram/zswap, values above 100 are recommended.
    "vm.swappiness" = lib.mkDefault 180;

    # vm.watermark_boost_factor - Controls aggressiveness of memory reclaim (default: 15000)
    # Setting to 0 disables watermark boost, preventing premature memory reclamation.
    # This allows fuller memory utilization before the kernel starts reclaiming pages.
    "vm.watermark_boost_factor" = lib.mkDefault 0;

    # vm.watermark_scale_factor - Controls kswapd wakeup frequency (range: 1-1000, default: 10)
    # A higher value triggers background memory reclamation earlier (at 12.5% memory pressure).
    # Value 125 means kswapd becomes active when free memory drops below 1/125 of total memory,
    # balancing memory more proactively to prevent sudden swap storms at high swappiness values.
    "vm.watermark_scale_factor" = lib.mkDefault 125;

    # vm.page-cluster - Controls swap readahead (range: 0-6, default: 3)
    # 0 means read only 1 page (2^0) at a time, disabling readahead.
    # For low-latency devices like zram, readahead hurts performance by fetching unnecessary data.
    "vm.page-cluster" = lib.mkDefault 0;
  };
}
