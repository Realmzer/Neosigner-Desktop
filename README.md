# Neosigner-Desktop

A user-friendly GUI wrapper for zsign and ideviceinstaller, making iOS app sideloading simpler for everyone.

Forked for Windows support.

## Features

- Simple drag-and-drop interface for IPA files
- One-click signing with custom certificates
- Bundle ID and app name modification
- Dylib injection support
- Direct installation to connected iOS devices | Coming soon
- Ad-hoc signing support
- Support for macOS & Windows, coming soon for Linux

## Requirements
- Windows 10+ (YMMV on Windows 7+)
- Python 3.6 or newer
- Internet connection for initial setup

## Installation

### Option 1: Download Release

1. Download the latest release from the [Releases](https://github.com/Realmzer/Neosigner-Desktop-Windows) page
2. Extract the ZIP file
3. Run the setup script to install dependencies: `setup.bat`
4. Launch the app: `python zsign_gui.py`

### Option 2: Clone from Source

```bash
# Clone the repository
git clone https://github.com/Realmzer/Neosigner-Desktop-Windows.git
cd Neosigner-Desktop-Windows

# Install dependencies
setup.bat

# Run the app
python zsign_gui.py
```

## Setting Up Dependencies

iPASideloader requires zsign and ideviceinstaller to function. The setup script will install these automatically, or you can install them manually:


## Usage

1. **Launch iPASideloader**
   - Run `python zsign_gui.py` in  terminal

2. **Sign an IPA**
   - Drag and drop IPA file into the app
   - Select  signing certificate and provisioning profile
   - Adjust settings as needed (bundle ID, app name, etc.)
   - Click "Sign"

3. **Install to Device**
   - Connect your iOS device via USB
   - Trust the computer on your device if prompted
   - Click "Install" to deploy the signed app

4. **Advanced Options**
   - Inject dylibs by clicking "Add Dylib" and selecting your files
   - Enable ad-hoc signing for testing without a developer account
   - Customize zip compression level for smaller IPAs

## Troubleshooting

### App Won't Install

- Ensure your device is connected and trusted
- Check that your provisioning profile matches your certificate
- Verify your device is included in the provisioning profile

### Signing Fails

- Make sure your certificate and provisioning profile are valid
- Check that zsign is properly installed
- Try reinstalling dependencies through the setup script

### Device Not Detected

- Reconnect your device and trust the computer
- Try running the setup.bat script again
- Restart your computer and iOS device

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Credits
- [Neosigner Desktop](https://github.com/neoarz/Neosigner-Desktop) - Original Mac version
- [zsign](https://github.com/zhlynn/zsign) - The core signing tool
- [libimobiledevice](https://github.com/libimobiledevice/libimobiledevice) - iOS communication library
- [ideviceinstaller](https://github.com/libimobiledevice/ideviceinstaller) - App installation tool

## Disclaimer

iPASideloader is meant for legitimate app development and testing purposes only. Always respect copyright and terms of service for all applications. The developers of iPASideloader are not responsible for any misuse of this software. 
