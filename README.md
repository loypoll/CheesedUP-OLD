# Pizza Tower Decompilation
Pain is all but guaranteed

Note that when building the project, you'll have to remove the Steam related stuff before or afterwards,
or else it'll just run the unmodded game. This is not the case for testing inside GameMaker though.

# Dependencies
- The `.bank` files from the game. They hold all sounds and music for usage with FMOD.
Simply copy the `sounds` folder from the game into the `datafiles` folder in the project,
no strings attached.

- The [Steamworks SDK](https://partner.steamgames.com/downloads/steamworks_sdk.zip).
Download it somewhere in your computer and change the Steamworks extension's config to match the path. Pizza Tower's Steam App ID is `2231450`, but it's not really necessary to change. It'll default to Spacewar.

# Inaccuracies
- The `string_split` function had to be renamed to `_string_split` because of a new built-in
function conflicting with the original name.

- `tower_finalhallwaytitlecard`'s Creation Code had to be slightly changed to prevent a crash.