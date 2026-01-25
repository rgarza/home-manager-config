{ home, pkgs, lib, ... }: {

  imports = [ ];

home.file."./.config/nvim/" = {
  source = ./nvim;
  recursive = true;
};

 programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    withRuby = false;
    withNodeJs = true;

    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
        lazy-nvim
    ];
    initLua =
    ''
     require("lazy").setup({
        -- disable all update / install features
        -- this is handled by nix
        rocks = { enabled = false },
        pkg = { enabled = false },
        install = { missing = false },
        change_detection = { enabled = false },
        spec = {
          -- TODO
        },
      })
    '';
  };
}
