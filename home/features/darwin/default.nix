{ config
, pkgs
, lib
, flake
, ... }:

{
  targets.darwin.keybindings = {
    "^u" = "deleteToBeginningOfLine:";
    "^w" = "deleteWordBackward:";
  };
}
