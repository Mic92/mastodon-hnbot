with import <nixpkgs> {};

with python3Packages;

let
  http_ece = buildPythonPackage rec {
    pname = "http_ece";
    version = "1.0.5";
    src = fetchPypi {
      inherit pname version;
      sha256 = "1k06843n5q1rp3wh8qx1akl9lmcsvl2p1qxi9a9w581i1ija0c9g";
    };
    propagatedBuildInputs = [
      cryptography
    ];
    checkInputs = [
      flake8
      nose
      mock
      coverage
    ];
  };
  Mastodon = buildPythonPackage rec {
    pname = "Mastodon.py";
    version = "1.3.1";
    src = fetchPypi {
      inherit pname version;
      sha256 = "1xih3wq47ki5wxm04v4haqnxc38hvnkx28yrmpyr02klw8s0y01z";
    };
    propagatedBuildInputs = [
      requests
      dateutil
      pytz
      decorator
      http_ece
      cryptography
    ];
    buildInputs = [
      pytestrunner
    ];
    # not all deps packaged yet
    doCheck = false;
    checkInputs = [
      pytestcov
      pytest-mock
      vcrpy
    ];
  };
in buildPythonApplication {
  name = "mastodon-hnbot";
  src = ./.;
  propagatedBuildInputs = [
    python3Packages.feedparser
    Mastodon
  ];
}
