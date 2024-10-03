# ABoutPage---Fuji Kaze

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

- **HomeView**: 
  - Main navigation hub displaying albums, popular releases, and artist information.

- **PlayerView**: 
  - Custom music player interface with play/pause functionality, progress slider, and next/previous track buttons.

- **AlbumDetailView**: 
  - Detailed album information with a scrollable description and links to purchase/stream.

- **ConcertView**: 
  - Displays upcoming concert information with embedded maps showing venue locations.

## Data Structures

- **Music**: Represents album and song information.
- **Concert**: Contains concert details including location data.

## Custom UI Elements

- Neumorphic design using custom shadows.
- Custom font implementation (Lato font family).
- Circular disc visualizations for music.

## Implementation Highlights

### Custom Color System



Project Structure
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
