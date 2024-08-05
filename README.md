# Flutter Application

## Overview

In an attempt to build a replica of the Dubizzle application, this Flutter application so far has various static screens implemented such as the home screen, menu, list city, favorites and chat. There are other sub screens and overlays. It includes a well-structured navigation system and custom animations for a seamless user experience. It is static for now, so no stateful widgets yet.

## Features

### User Profile
- **User Profile Card**: Displays user information such as name and profile picture.
- **Edit Profile Picture**: Users can initiate  editing their profile.
- **Get Verified**: Users can initiate the verification process.

### Favorites
- **Favorites Screen**: Displays a list of favorite items categorized into default and personalized lists.
- **Create Favorite List**: Users can create personalized favorite lists to organize their saved items.
- **Character Count**: Limits the list name to 50 characters, displaying the character count dynamically.
- **Email Notifications**: Option to receive email notifications for similar ads.
- **Custom Overlay**: An overlay screen for creating favorite lists, sliding up from the bottom of the screen.

### Menu
- **Menu Screen**: Provides quick access to various sections such as My Ads, My Searches, Profile, Settings, Notifications, and more.
- **Logout Confirmation**: A custom dialog for confirming user logout, ensuring a smooth and secure exit process.

### Notifications
- **Notification Settings**: Allows users to manage their notification preferences.

### Custom Animations
- **Slide Up Route**: Custom route transition that slides the screen up.
- **Slide Down Route**: Custom route transition that slides the screen down.
- **Slide Left Route**: Custom route transition that slides the screen left.

### Assets
- **Organized Asset Management**: Images are organized into specific folders (chat, folders, menu, notif, products) for better maintainability.
- **Dynamic Asset Loading**: Ensures all images are correctly loaded by specifying paths in the `pubspec.yaml` file.

## Folder Structure

lib/
├── navigation/
│ └── bottom_nav_bar.dart
├── provider/
│ └── navigation_provider.dart
├── screens/
│ ├── favorites_screen.dart
│ ├── home_screen.dart
│ ├── menu_screen.dart
│ └── notifications_screen.dart
├── widgets/
│ ├── cards/
│ │ ├── menu_action_card.dart
│ │ └── user_profile_card.dart
│ ├── list/
│ │ └── menu_list_item.dart
│ ├── animated_search_bar.dart
│ ├── create_list_overlay.dart
│ ├── expanded_search_bar.dart
│ ├── favorites_grid.dart
│ └── logout_confirmation_overlay.dart
├── routes/
│ ├── slide_up_route.dart
│ ├── slide_down_route.dart
│ └── slide_left_route.dart
assets/
└── images/
├── chat/
├── folders/
├── menu/
├── notif/
└── products/
├── residents/
├── cars/
└── computers/


## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK

### Installation
1. **Clone the repository**:
   ```bash
   git clone https://github.com/wesley-akumbom/dubizzle.git
   cd dubizzle
2. **Install dependencies**:
   ```bash
   flutter pub get
3. **Run the application**
   ```bash
   flutter run

## Asset Configuration
Ensure all assets are specified in the 'pubspec.yaml' file:
flutter:
assets:
- assets/images/
- assets/images/chat/
- assets/images/folders/
- assets/images/menu/
- assets/images/notif/
- assets/images/products/
- assets/images/products/residents/
- assets/images/products/cars/
- assets/images/products/computers/

## Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License
This project is licensed under the MIT License. See the LICENSE file for details
