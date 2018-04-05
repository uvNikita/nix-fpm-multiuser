let
  pkgs = import <nixpkgs> {};
  nix = (import ./nix/release.nix {}).build.x86_64-linux;
  tarball = (import ./nix/release.nix {}).binaryTarball.x86_64-linux;
  closureInfo = pkgs.closureInfo { rootPaths = [ nix ]; };
in rec {

  # Profile script installed to /etc/profile.d
  profileScript = pkgs.writeText "nix.sh" ''
    if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
      source $HOME/.nix-profile/etc/profile.d/nix.sh
      export PATH="$PATH:/opt/nix-multiuser/nix/bin"
    elif [ -e /opt/nix-multiuser/nix/etc/profile.d/nix.sh ]; then
      source /opt/nix-multiuser/nix/etc/profile.d/nix.sh
      export PATH="$PATH:/opt/nix-multiuser/nix/bin"
    else
      # Generally, this should never happen, but be defensive just in case we somehow
      # end up with the package installed without running the post-install script.
      echo "nix-multiuser: warning: couldn't locate a Nix profile script to source." >&2
    fi
  '';

  deb = pkgs.stdenv.mkDerivation {
    name = "nix-fpm-multiuser";

    nativeBuildInputs = with pkgs; [ fpm tree ];

    packageDescription = ''
      The Nix software deployment system
      Nix is a purely functional package manager. It allows multiple
      versions of a package to be installed side-by-side, ensures that
      dependency specifications are complete, supports atomic upgrades and
      rollbacks, allows non-root users to install software, and has many
      other features. It is the basis of the NixOS Linux distribution, but
      it can be used equally well under other Unix systems.
    '';

    buildCommand = ''
      pathsToCopy=""

      ln -s ${nix} nix
      pathsToCopy+=" nix=/opt/nix-multiuser/nix"
      pathsToCopy+=" ${profileScript}=/etc/profile.d/nix.sh"
      pathsToCopy+=" ${nix}/lib/systemd/system/nix-daemon.socket=/lib/systemd/system/nix-daemon.socket"
      pathsToCopy+=" ${nix}/lib/systemd/system/nix-daemon.service=/lib/systemd/system/nix-daemon.service"
      pathsToCopy+=" ${closureInfo}/registration=/opt/nix-multiuser/reginfo"

      for f in $(cat ${closureInfo}/store-paths); do
        # XXX: fpm can't recreate a directory hierarchy if the directories lack write permission.
        # So make a local copy with +w added to directories, include that, and fixup in post-install script.
        cp -r $f .
        find $(basename $f) -type d -exec chmod +w {} \;

        pathsToCopy+=" $(basename $f)=/opt/nix-multiuser/bootstrap-store"
      done

      # --verbose 
      # --debug 
      # --debug-workspace

      # TODO:
      # --config-files /etc/nix
      # Vcs-Browser:, Vcs-Git:

      fpm \
        --input-type dir \
        --output-type deb \
        --name nix \
        --version 42-FIXME \
        --maintainer "Eelco Dolstra <eelco.dolstra@logicblox.com>" \
        --vendor NixOS \
        --url https://nixos.org/nix/ \
        --description "$packageDescription" \
        --license 'LGPLv2+' \
        --directories /nix \
        --deb-no-default-config-files \
        --after-install ${./after-install-linux.sh} \
        --before-remove ${./before-remove-linux.sh} \
        --after-remove ${./after-remove-linux.sh} \
        $pathsToCopy

      ar x *.deb
      mkdir -p unpack
      (cd unpack && tar xf ../data.tar.gz)
      (cd unpack && tree)

      echo
      ls -lah

      mkdir -p $out
      cp *.deb $out/
    '';
  };
}
