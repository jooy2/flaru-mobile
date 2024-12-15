![flare-logo](assets/images/logo/app-logo.webp)

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/jooy2/flare-mobile/blob/master/LICENSE)
![Programming Language Usage](https://img.shields.io/github/languages/top/jooy2/flare-mobile)
![Languages](https://img.shields.io/github/languages/count/jooy2/flare-mobile)
[![Followers](https://img.shields.io/github/followers/jooy2?style=social)](https://github.com/jooy2)
![Stars](https://img.shields.io/github/stars/jooy2/flare-mobile?style=social)


> [!IMPORTANT]
>
> The mobile Flare app is intended for proof-of-concept purposes only and is not intended for release. For another Ruffle native mobile app, check out these major projects: https://github.com/torokati44/ruffle-android

> Flare for desktop is here: https://github.com/jooy2/flare

> [!IMPORTANT]
>
> An app utilizing this project has been released to the app store and the project is no longer maintained.

> [!NOTE]
>
> This application is an emulator and does not contain Flash game files (SWF).

This is **Unofficial Ruffle Flash Player** Based on [Ruffle Flash Emulator](https://ruffle.rs).

I'm not the official developer of Ruffle. For issues and documentation related to the emulator, please refer to the official Ruffle repository documentation below.

**Official Ruffle Desktop Player** is here!: https://github.com/ruffle-rs/ruffle

(*This is just an emulator and does not contain any games.)


---

# Flare for Mobile (POC)

> Flutter + Ruffle Self-hosted package wrapped in Flutter Webview

## 📢 Compatibility

This app plots the emulator (built for self-hosted use) in a webview, so there may be a performance difference compared to the official Ruffle Desktop Application.

There is no built-in automatic update in the app. It is recommended to download the updated emulator version by referring to the GitHub Release page on a monthly basis.

## 🔨 Build & Run

This project is written in Dart + Flutter. For Flutter environment settings, please refer to the following documentation.

https://docs.flutter.dev/get-started/install

```shell
$ flutter pub get
```

Once everything is ready, proceed with the steps below. If you do not proceed, the execution may not work correctly.

The project sources do not include the `Ruffle` source files. So, before building or testing, you need to get the latest version of Ruffle self-hosted distribution.

Download the latest version of the self-hosted version from the Ruffle Release Page, unzip it and paste it in the following path: `/assets/www/js/ruffle`

You only need to paste the `.map`, `.js`, `.wasm` files inside the compressed file.

The webview code is located in `assets/www`. We recommend applying the `eslint` and `prettier` settings to work with files located here.

### 🔧 Technical Specifications

- [Flutter 3.10.x](https://flutter.dev)
- [Ruffle](https://ruffle.rs)

## 📋 License

Copyright © 2022-2024 [Jooy2](https://jooy2.com) <[jooy2.contact@gmail.com](mailto:jooy2.contact@gmail.com)> Released under the MIT license. (Source code excluding Ruffle and external modules)

> [!IMPORTANT]
>
> Please use the build package only for personal testing. **Distribution of packages for production/commercial use is not permitted.**

For detailed license of Ruffle, please refer to the following document: [https://github.com/ruffle-rs/ruffle/blob/master/LICENSE.md](https://github.com/ruffle-rs/ruffle/blob/master/LICENSE.md)
