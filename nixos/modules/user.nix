{pkgs, ... }: {
	programs.zsh.enable = true;

	users = {
		defaultUserShell = pkgs.zsh;

		users.songlin = {
			isNormalUser = true;
			description = "Songlin Bai";
			extraGroups = [ "networkmanager" "wheel" "users" "input" ];
			packages = with pkgs;[];
		      hashedPassword = "$y$j9T$szngGVNGpEIkeQLlD9WPg1$wLHBhNIJDcDNESV1DjYNo.9ytXXE6XCSD/58tXs9s//";
		      openssh.authorizedKeys.keys = [
		      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK8fGTL9GS3s7InbMnJcOJqtRJUb5Au2J+NBsPBRRDut songlin2610@outlook.com"
		      ];
		};
	};
	  # enable openssh service
	  services.openssh = {
	    enable = true;
	    settings = {
	      X11Forwarding = true;
	      PermitRootLogin = "no"; # disable root login
	      PasswordAuthentication = false; # disable password login
	    };
	    openFirewall = true;
	  };

	services.getty.autologinUser = "songlin";
}
