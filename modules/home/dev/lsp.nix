{ config, pkgs, ... }: {

  home.packages = builtins.attrValues {
    inherit
      (pkgs.luajitPackages) 
      lua-lsp # LSP for lua.
      #lsp-zero-nvim # ?
      ;
      (pkgs.vimPlugins) lsp-zero-nvim;
  };

}
