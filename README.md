# Flutter Ecommerce App

A fully-featured ecommerce mobile app built using Flutter and Firebase, designed for seamless user experience across Android and iOS. This app integrates product listings, user authentication, cart management, and order placement.

## Features

- **Firebase Authentication**: Sign up, login, and password reset via Firebase.
- **Product Management**: Browse products with category filters.
- **Cart and Checkout**: Add/remove products, manage cart items, and place orders.
- **User Profiles**: View and edit user details, manage orders.
- **Responsive Design**: Optimized for both iOS and Android devices.

## Firebase Setup

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/).
2. Enable Firebase Authentication and Firestore Database.
3. Download the `google-services.json` file for Android and `GoogleService-Info.plist` for iOS, and place them in their respective directories.

## Getting Started

### Prerequisites

- Flutter SDK installed ([Installation Guide](https://flutter.dev/docs/get-started/install))
- Firebase project setup

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/burakpekisik/flutter_ecommerce.git
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Set up Firebase by placing `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) into the correct directories.

4. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

- **Firebase**: Authentication, Firestore for user and product data
- **Flutter Fire**: Firebase integration in Flutter
- **Cloud Firestore**: Real-time database for products, user info, and orders

## Firebase Configuration

1. Enable **Firestore** and **Authentication** in Firebase.
2. Configure the rules in Firestore:
   ```plaintext
   service cloud.firestore {
     match /databases/{database}/documents {
       match /{document=**} {
         allow read, write: if request.auth != null;
       }
     }
   }
   ```
   
## License

This project is licensed under the MIT License.
