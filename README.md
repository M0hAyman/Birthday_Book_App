# Birthday Book App

The Recipe Book App is a Flutter-based mobile application that allows users to browse a list of user profiles, mark users as favorites, and view upcoming birthdays of their favorite users. The app dynamically fetches user data from an external JSON endpoint and offers smooth state management, making it an excellent resource for organizing and managing contacts.

## Features

- **User List**: Displays a list of user profiles with essential details like name, phone number, and profile image.
- **Favorites Management**: Users can mark individuals as favorites by tapping a heart icon. The icon toggles to track which users are favorited.
- **Birthday Reminders**: A dedicated screen lists the birthdays of favorite users in chronological order, allowing users to easily track upcoming birthdays.
- **Dynamic Loading Indicator**: Shows a loading indicator while user data is being fetched from the external JSON endpoint.
- **Intuitive Navigation**: A bottom navigation bar provides access to three main screens—Home, User List, and Birthdays.

## Screens

- **Home Screen**: A welcome screen with a title and a birthday-themed image.
- **User List Screen**: A list view that displays each user's name, phone number, and profile image, along with a heart icon to add or remove users from favorites.
- **Birthday List Screen**: Shows a sorted list of favorite users' birthdays, displaying the most recent ones at the top.

## Getting Started

### Prerequisites

- **Flutter**: Make sure Flutter SDK is installed. Follow the installation guide at [Flutter.dev](https://flutter.dev/docs/get-started/install).
- **Android Studio or Visual Studio Code**: For easier development and device emulation.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/recipe-book-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd recipe-book-app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

## Running the App

1. Connect a device or start an emulator.
2. Run the app with:
   ```bash
   flutter pub get
   ```

## Folder Structure

```
lib/
├── main.dart # Main entry point of the app
├── screens/
│   ├── home_screen.dart # Home screen displaying welcome message
│   ├── user_list_screen.dart # Displays a list of user profiles
│   └── birthday_list_screen.dart # Displays favorite users' birthdays
```

## How It Works

1. **Fetching Data**: User data is fetched from an external JSON endpoint using the http package in UserListScreen.
2. **Favorites Management**: Users can be added or removed from the favorites list. The favoriteUsers list updates in real time.
3. **Birthday Sorting**: The app sorts favorite users' birthdays in ascending order so that the upcoming birthdays appear first.
4. **Loading Indicator**: A loading indicator is shown in the UserListScreen while the user data is being fetched.

## Dependencies

- **flutter**: Flutter SDK for building the app.
- **http**: HTTP client for fetching data from the JSON endpoint.

## Future Improvements

- **Push Notifications**: Add notifications to remind users of upcoming birthdays.
- **User Profile Details**: Enable users to view detailed profiles with additional information.
- **Search Functionality**: Implement a search bar to filter users by name.
