# DevEcho

DevEcho is a Flutter-based chat application that utilizes Firebase as its backend. It offers a secure and feature-rich messaging experience tailored for developers. Users can exchange messages, including code snippets with syntax highlighting, and reply to messages with quoted references.

## Features

- **Secure Authentication**: Implements Firebase Authentication for user sign-up and login.
- **One-on-One Messaging**: Users can send and receive direct messages.
- **Code Snippet Highlighting**: Messages containing code snippets are automatically formatted with syntax highlighting. (Currently only supports Python)
- **Message Replies**: Users can reply to specific messages with quoted references, similar to Discord’s reply system.
- **Retro Pixel Theme**: The app features a nostalgic retro pixel aesthetic for a unique user experience.
- **Google Meet Integration**: Users can access Google Meet for video and voice calls within the app.
- **GitHub Access**: Integrated GitHub access within the app using `webview_flutter` to allow users to browse repositories and manage their projects.
- **Light and Dark Themes**: Uses the `provider` package for seamless theme switching between light and dark modes.
- **Loading Animations**: Implements `loading_animation_widget` to provide smooth loading animations while fetching data.
- **Enhanced Code Highlighting**: Uses `flutter_highlight` to detect and highlight code snippets in messages.

## Technologies Used

- **Flutter**: Cross-platform mobile development framework.
- **Firebase Authentication**: Secure user authentication.
- **Cloud Firestore**: Real-time NoSQL database for storing messages.
- **Firebase Cloud Messaging (FCM)**: Push notifications for new messages.
- **WebView Flutter**: Enables embedding web content like Google Meet and GitHub within the app.
- **Provider**: Manages state for theme switching.
- **Loading Animation Widget**: Provides animated loading indicators.
- **FlutterHighlight**: Enhances code snippet formatting with syntax highlighting.

## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/AshvikMishra/devecho.git
   cd devecho
   ```
2. Install dependencies:
   ```sh
   flutter pub get
   ```
3. Set up Firebase:
   - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
   - Enable Firebase Authentication and Firestore Database.
   - Download the `google-services.json` (for Android) and `GoogleService-Info.plist` (for iOS) files and place them in the appropriate directories.
   - Enable Firebase Cloud Messaging (FCM) for notifications.
4. Run the application:
   ```sh
   flutter run
   ```

## Contributing

Contributions are welcome! Feel free to submit a pull request or open an issue for discussion.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.