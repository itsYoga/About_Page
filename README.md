# About Page---Fuji Kaze

A SwiftUI-based iOS application showcasing the music and upcoming concerts of Japanese singer-songwriter Fuji Kaze.

## Features

- Browse Fuji Kaze's albums and popular releases
- Interactive music player interface
- Detailed album view with descriptions
- Artist profile section
- Upcoming concerts with interactive maps

## Technical Details

### Requirements
- iOS 14.0 or later
- Xcode 12 or later
- Swift 5.3 or later

### Key Components

1. **HomeView**
   - Main navigation hub
   - Displays albums, popular releases, and artist information

2. **PlayerView**
   - Custom music player interface
   - Play/pause functionality
   - Progress slider
   - Next/previous track buttons

3. **AlbumDetailView**
   - Detailed album information
   - Scrollable description
   - Link to purchase/stream

4. **ConcertView**
   - Displays upcoming concert information
   - Embedded maps showing venue locations

### Data Structures

- `Music`: Represents album and song information
- `Concert`: Contains concert details including location data

### Custom UI Elements

- Neumorphic design using custom shadows
- Custom font implementation (Lato font family)
- Circular disc visualizations for music

## Implementation Highlights

### Custom Color System
```swift
extension Color {
    static let primary_color = Color(white: 1)
    static let main_color = Color(hex: "657592")
    // ... other color definitions
}
```

### Reusable Components
- `FontModifier`: Custom font styling
- `NeuShadow`: Neumorphic shadow effect
- Custom view components for albums and music discs

## Getting Started

1. Clone the repository
2. Open the project in Xcode
3. Build and run on simulator or device

## Project Structure

```
├── Views
│   ├── HomeView.swift
│   ├── PlayerView.swift
│   ├── AlbumDetailView.swift
│   └── ConcertView.swift
├── Models
│   ├── Music.swift
│   └── Concert.swift
├── Extensions
│   └── Color+Extensions.swift
└── Resources
    └── Assets.xcassets
```

## Dependencies

This project uses SwiftUI and MapKit frameworks from the standard iOS SDK. No external dependencies are required.

## Notes

- The app uses static data for demonstration purposes
- Music playback functionality is simulated
- External links open in the default browser

## Future Enhancements

- Implement actual music playback
- Add a backend service for dynamic content
- Implement user favorites and playlists
- Add social sharing features

## Credits

- All music and artist information belongs to Fuji Kaze
- App designed and developed by Jesse Liang
