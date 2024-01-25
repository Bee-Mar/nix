{lib, ...}@args:
{

  imports = [
      ./base/modules.nix
    ] 
	++ lib.optional (builtins.pathExists ./custom/modules.nix) ./custom/modules.nix;
    #++ lib.optional (builtins.pathExists ./work/modules.nix) ./work/modules.nix;
}
