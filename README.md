# HydroTouch 💧

This is a heavily personalized and customized extension for the amazing [AquaTouch](https://community.folivora.ai/c/setup-preset-sharing/aquatouch) [Preset]() for [BetterTouchTool](https://folivora.ai) by [@yuuiko](https://github.com/yuuiko).

## [Releases](https://github.com/dnnsmnstrr/dotfiles/releases)

This is the first release, to install, just [download the preset files](https://github.com/dnnsmnstrr/dotfiles/releases/tag/v0.1) files and open them with BTT.

## [Installation](https://github.com/dnnsmnstrr/dotfiles/wiki/Installation)

Due to the existing limitations of updating presets in BTT, I have reworked HydroTouch to function as an extension layer on top of AquaTouch. Nevertheless there are some changes needed to achieve the setup I prefer:

### AquaTouch Update Steps

1. Install [latest AquaTouch version](https://community.folivora.ai/t/aquatouch-updates-only-thread/6746)
1. Disable unused notification badges (News, Safari, Skype), ensure HydroTouch-Badges still work (Mattermost)
1. Change condition for `BetterTouchTool` activation group so the custom touchbar setup can show up
1. Update/Replace Triggers in Spotify & Unsupported Apps
1. Hide AquaTouch in Configuration UI to avoid changes that will be lost in updates

## BTT Setup

- [Import duplicate presets](https://community.folivora.ai/t/cant-import-a-preset-without-replacing/10455/4)

  ```sh
  defaults write com.hegenberg.BetterTouchTool BTTImportDuplicatePresets YES
  ```

# Credits

- [yuuiko](https://community.folivora.ai/t/v3-5-0-aquatouch-supports-40-apps-and-websites-and-the-native-touchbar/1704) (click on the sponsor link uptop to support him, my preset would be nothing without the foundation his provides)
- [andrewchidden](https://community.folivora.ai/t/a-standard-set-of-responsive-energy-efficient-widgets-volume-brightness-calendar-timer-world-clock-git/3083)
- [vas3k](https://github.com/vas3k/btt-touchbar-presets)
