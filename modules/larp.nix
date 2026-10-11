# currently we can do ts globally because no projects (no employment yet)
{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    neovim # terminal text editor
    vim # backup text editor

    tree-sitter # syntax highlighting

    emmylua-ls # lua lsp

    vscodium # why not, it's the industry standard

    btop # task manager
    fastfetch # system info fetch

    zip # make zip files
    unzip # unzip zip files
    p7zip # extract 7z files

    ripgrep # better grep 
    fd # better find
    eza # better ls

    wget # download files
    curl # also downloads files 

    git # version control

    age # cryptography

    rsync # sync files across devices

    fzf # fuzzy finder

    ffmpeg-full # everything media

    radare2 # ghidra + gdb i think i never used it

    file # get file metadata
    exiftool # metadata

    steghide # steganography
    stegseek # steganography
    zsteg # steganography

    openssl # ssl + tls lib

    binwalk # firmware analysis

    aircrack-ng # wifi-analysis

    sleuthkit # forensics

    # c/c++
    clang-tools
    gcc
    gdb

    cmake
    gnumake

    # stable rust toolchain
    rustc
    cargo
    rust-analyzer

    # go programming language
    go
    gopls

    nasm # netwide assembler 

    # python + relevant modules
    (python3.withPackages (p: with p; [
      pwntools # ctf framework
      pillow
      numpy
    ]))

    pyrefly

    dislocker # mount bitlocker-encrypted disk images

    # password cracking
    john
    hashcat

    # live (la)tex rendering
    texpresso
    # tex engine
    tectonic

    obsidian

    blender

  ];
}
