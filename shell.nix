{ pkgs ? import <nixpkgs> {} }:
let
  my-python-packages = ps: with ps; [
    numpy
    matplotlib
    astropy
    scipy
    tensorflow
    keras
    jupyter
    cython
    (
      buildPythonPackage rec {
        pname = "sep";
        version = "1.2.1";
        src = fetchPypi {
          inherit pname version;
          sha256 = "sha256-G2o2pVSzsxWpqW0ZFZ8a452drXW+9RCx3AhMWqmkSJs=";
        };
        doCheck = false;
        propagatedBuildInputs = [
          numpy
          cython
        ];
      }
    )
  ];

  my-python = pkgs.python3.withPackages my-python-packages;
in my-python.env
