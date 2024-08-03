Flutter Application

Overview
This Flutter application provides a comprehensive platform for managing various functionalities such as user profiles, favorite lists, and notifications. It includes a well-structured navigation system and custom animations for a seamless user experience.

Features

User Profile
1. User Profile Card: Displays user information such as name and profile picture.
2. Edit Profile Picture: Allows users to update their profile picture.
3. Get Verified: Users can initiate the verification process.

Favorites
1. Favorites Screen: Displays a list of favorite items categorized into default and personalized lists.
2. Create Favorite List: Users can create personalized favorite lists to organize their saved items.
3. Character Count: Limits the list name to 50 characters, displaying the character count dynamically.
4. Email Notifications: Option to receive email notifications for similar ads.
5. Custom Overlay: An overlay screen for creating favorite lists, sliding up from the bottom of the screen.

Menu
1. Menu Screen: Provides quick access to various sections such as My Ads, My Searches, Profile, Settings, Notifications, and more.
2. Logout Confirmation: A custom dialog for confirming user logout, ensuring a smooth and secure exit process.

3. Notifications
Notification Settings: Allows users to manage their notification preferences.

Custom Animations
1. Slide Up Route: Custom route transition that slides the screen up.
2. Slide Down Route: Custom route transition that slides the screen down.
3. Slide Left Route: Custom route transition that slides the screen left.

Assets
1. Organized Asset Management: Images are organized into specific folders (chat, folders, menu, notif, products) for better maintainability.
2. Dynamic Asset Loading: Ensures all images are correctly loaded by specifying paths in the pubspec.yaml file.

Folder Structure
lib/
├── navigation/
│   └── bottom_nav_bar.dart
├── provider/
│   └── navigation_provider.dart
├── screens/
│   ├── favorites_screen.dart
│   ├── home_screen.dart
│   ├── menu_screen.dart
│   └── notifications_screen.dart
├── widgets/
│   ├── cards/
│   │   ├── menu_action_card.dart
│   │   └── user_profile_card.dart
│   ├── list/
│   │   └── menu_list_item.dart
│   ├── animated_search_bar.dart
│   ├── create_list_overlay.dart
│   ├── expanded_search_bar.dart
│   ├── favorites_grid.dart
│   └── logout_confirmation_overlay.dart
├── routes/
│   ├── slide_up_route.dart
│   ├── slide_down_route.dart
│   └── slide_left_route.dart
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

Getting Started

Prerequisites
1. Flutter SDK
2. Dart SDK

Installation
1. Clone the repository:
        git clone https://github.com/your-repo/flutter-app.git
        cd flutter-app

2. Install dependencies:
        flutter pub get

3. Run the application:
        flutter run

4. Asset Configuration
Ensure all image assets are specified in the pubspec.yaml file:
text
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

Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes.

License
This project is licensed under the MIT License. See the LICENSE file for details. This README provides a comprehensive overview of your Flutter application, highlighting its features, folder structure, and steps to get started. Feel free to customize it further to match your project's specifics. If you have any additional features or sections to include, let me know!
