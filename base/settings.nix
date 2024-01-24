{ nix, ... }@args:

{
	nix.settings.experimental-features = "nix-command flakes";
}
