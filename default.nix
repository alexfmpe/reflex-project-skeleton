{ reflex-platform ? import ./reflex-platform {} }:

reflex-platform.project ({ pkgs, ... }: {
  packages = {
    common = ./common;
    backend = ./backend;
    frontend = ./frontend;
  };

  android.frontend = {
    executableName = "frontend";
    applicationId = "org.example.frontend";
    displayName = "Example Android App";
  };

  ios.frontend = {
    executableName = "frontend";
    bundleIdentifier = "org.example.frontend";
    bundleName = "Example iOS App";
  };

  shells = {
    ghc = ["common" "backend" "frontend"];
    ghcjs = ["common" "frontend"];
  };

  overrides = self: super: {
    dec = self.callHackageDirect {
      pkg = "dec";
      ver = "0.0.3";
      sha256 = "11b8g4nm421pr09yfb4zp18yb7sq4wah598fi3p5fb64yy4c2n4s";
    } {};

    singleton-bool = self.callHackageDirect {
      pkg = "singleton-bool";
      ver = "0.1.5";
      sha256 = "1kjn5wgwgxdw2xk32d645v3ss2a70v3bzrihjdr2wbj2l4ydcah1";
    } {};
  };
})
