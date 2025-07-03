with import <nixpkgs> {};

python3.pkgs.buildPythonApplication {
  name = "mastodon-hnbot";
  src = ./.;
  propagatedBuildInputs = [
    python3.pkgs.feedparser
    python3.pkgs.mastodon-py
  ];
}
