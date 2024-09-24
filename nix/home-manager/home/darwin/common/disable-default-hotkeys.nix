{ lib, ... }:
let
  # ```bash
  # cp ~/Library/Preferences/com.apple.symbolichotkeys.plist com.apple.symbolichotkeys.plist
  # plutil -convert json com.apple.symbolichotkeys.plist
  # jq '.AppleSymbolicHotKeys | to_entries | map(select(.value.enabled == 0) | {"key": .key, "value": .value }) | sort_by(.key|tonumber) | from_entries ' \
  #   < com.apple.symbolichotkeys.plist
  # ```
  disabledHotKeys = builtins.fromJSON ''
    {
      "15": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            56,
            28,
            1572864
          ]
        }
      },
      "16": {
        "enabled": 0
      },
      "17": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            94,
            24,
            1572864
          ]
        }
      },
      "18": {
        "enabled": 0
      },
      "19": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            45,
            27,
            1572864
          ]
        }
      },
      "20": {
        "enabled": 0
      },
      "21": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            56,
            28,
            1835008
          ]
        }
      },
      "22": {
        "enabled": 0
      },
      "23": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            165,
            93,
            1572864
          ]
        }
      },
      "24": {
        "enabled": 0
      },
      "25": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            46,
            47,
            1835008
          ]
        }
      },
      "26": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            44,
            43,
            1835008
          ]
        }
      },
      "32": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            126,
            10747904
          ]
        }
      },
      "33": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            125,
            10747904
          ]
        }
      },
      "34": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            126,
            10878976
          ]
        }
      },
      "35": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            125,
            10878976
          ]
        }
      },
      "36": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            103,
            8388608
          ]
        }
      },
      "37": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            103,
            8519680
          ]
        }
      },
      "64": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            49,
            1048576
          ]
        }
      },
      "65": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            49,
            1572864
          ]
        }
      },
      "75": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            100,
            0
          ]
        }
      },
      "76": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            100,
            131072
          ]
        }
      },
      "118": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            18,
            262144
          ]
        }
      },
      "119": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            19,
            262144
          ]
        }
      },
      "120": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            20,
            262144
          ]
        }
      },
      "121": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            21,
            262144
          ]
        }
      },
      "160": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            65535,
            0
          ]
        }
      },
      "163": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            65535,
            0
          ]
        }
      },
      "164": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            65535,
            0
          ]
        }
      },
      "179": {
        "enabled": 0,
        "value": {
          "type": "standard",
          "parameters": [
            65535,
            65535,
            0
          ]
        }
      }
    }
  '';

  mkDefaultWriteCommand = (
    key: val:
    let
      params =
        if builtins.hasAttr "parameters" val.value then
          "parameters = (" + builtins.concatStringsSep ", " (map toString val.value.parameters) + ");"
        else
          "";
      valueStr =
        if builtins.hasAttr "value" val then "value = {type = ${val.value.type}; ${params}};" else "";
    in
    "run /usr/bin/defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add ${key} '{enabled = ${toString val.enabled}; ${valueStr}}'"
  );
in
{
  home.activation = {
    disable-default-hotkeys = lib.hm.dag.entryAfter [ "writeBoundary" ] (
      builtins.concatStringsSep "\n" (
        map (key: mkDefaultWriteCommand key disabledHotKeys.${key}) (builtins.attrNames disabledHotKeys)
      )
    );
  };
}
