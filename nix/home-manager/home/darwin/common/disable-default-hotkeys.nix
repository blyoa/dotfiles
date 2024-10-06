{ lib, ... }:
let
  # ```bash
  # defaults export com.apple.symbolichotkeys - | \
  # plutil -convert json - -o - | \
  # jq '.AppleSymbolicHotKeys | to_entries | map(select(.value.enabled == false or .value.enabled == 0) | .key) | sort_by(.|tonumber)'
  # ```
  disabledHotKeyActions = builtins.fromJSON ''
    [
      "7",
      "8",
      "9",
      "10",
      "11",
      "12",
      "13",
      "15",
      "17",
      "19",
      "23",
      "27",
      "32",
      "33",
      "36",
      "53",
      "54",
      "57",
      "64",
      "65",
      "159",
      "163",
      "175",
      "179",
      "222"
    ]
  '';

  mkDefaultWriteCommand = (
    actionId:
    "run /usr/bin/plutil -replace AppleSymbolicHotKeys.${actionId}.enabled -bool false ~/Library/Preferences/com.apple.symbolichotkeys.plist"
  );
in
{
  home.activation = {
    disable-default-hotkeys = lib.hm.dag.entryAfter [ "writeBoundary" ] (
      builtins.concatStringsSep "\n" (
        map (actionId: mkDefaultWriteCommand actionId) disabledHotKeyActions
      )
    );
  };
}
