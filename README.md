# Metaneutrons Homebrew Tap

> Homebrew tap for metaneutrons projects

## 🍺 Available Formulas

### KNX Monitor

Professional KNX/EIB bus monitoring and debugging tool built with .NET 9.

**Installation:**
```bash
brew install metaneutrons/tap/knxmonitor
```

**Features:**
- Real-time KNX bus monitoring with millisecond precision
- Multiple connection types: IP Tunneling, IP Routing, USB
- Group address resolution via CSV database import
- Data Point Type (DPT) decoding for human-readable values
- Advanced filtering with regex pattern support
- Cross-platform compatibility (Windows, macOS, Linux)

**Usage:**
```bash
# Show version information
knxmonitor --version

# Monitor KNX bus via IP tunneling
knxmonitor --connection-type tunneling --host 192.168.1.100

# Monitor with group address database
knxmonitor --connection-type routing --csv-path knx_addresses.csv
```

## 📦 Installation

### Add the Tap

```bash
brew tap metaneutrons/tap
```

### Install Formulas

```bash
# Install KNX Monitor
brew install knxmonitor

# Or install directly with tap name
brew install metaneutrons/tap/knxmonitor
```

## 🔄 Updates

```bash
# Update tap and formulas
brew update

# Upgrade installed formulas
brew upgrade

# Upgrade specific formula
brew upgrade knxmonitor
```

## 🛠️ Development

### Formula Structure

Formulas are Ruby classes that inherit from `Formula` and define:
- Package metadata (description, homepage, license)
- Download URLs and checksums
- Installation instructions
- Test procedures

### Testing Formulas

```bash
# Test formula installation
brew install --build-from-source metaneutrons/tap/knxmonitor

# Run formula tests
brew test knxmonitor

# Audit formula
brew audit --strict knxmonitor
```

### Contributing

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test the formula
5. Submit a pull request

## 📋 Formula Guidelines

- Follow [Homebrew Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- Use semantic versioning
- Include comprehensive tests
- Provide accurate checksums
- Support both Intel and Apple Silicon Macs

## 🔗 Links

- [Homebrew Documentation](https://docs.brew.sh/)
- [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Acceptable Formulae](https://docs.brew.sh/Acceptable-Formulae)
- [Metaneutrons GitHub](https://github.com/metaneutrons)

## 📄 License

This tap is available under the MIT License. Individual formulas may have different licenses as specified in their respective formula files.