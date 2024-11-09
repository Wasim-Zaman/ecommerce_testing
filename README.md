# Flutter E-commerce App

A modern e-commerce application built with Flutter, featuring a clean architecture and state management using BLoC pattern.

## 📱 Features

- **Product Catalog**: Browse through a wide range of products
- **Category Navigation**: Filter products by categories
- **Search Functionality**: Search products and categories
- **Product Details**: View detailed product information with image carousel
- **Favorites**: Save and manage favorite products
- **User Profile**: Personal account management
- **Dark Mode Support**: Seamless dark/light theme switching
- **Responsive Design**: Works on various screen sizes
- **Cached Images**: Efficient image loading and caching

## 🏗️ Architecture

The project follows a clean architecture pattern with the following structure:

lib/
├── core/
│ ├── constants/
│ └── theme/
├── cubits/
│ ├── category/
│ ├── favorites/
│ ├── product/
│ └── splash/
├── models/
├── view/
│ ├── screens/
│ └── widgets/
└── main.dart

## 🛠️ Technologies Used

- **Flutter**: UI framework
- **Bloc**: State management
- **Carousel Slider**: Image slideshow
- **Material Design**: UI components

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Android Studio / VS Code
- Android Emulator / iOS Simulator

### Installation

1. Clone the repository:

git clone https://github.com/wasim-zaman/ecommerce_testing.git

## 🎯 State Management

The app uses BLoC pattern with Cubit for state management:

- `ProductsCubit`: Manages product listing and filtering
- `CategoriesCubit`: Handles category operations
- `FavoritesCubit`: Manages favorite products
- `SplashCubit`: Controls app initialization

## 🎨 Theming

The app supports both light and dark themes with a custom design system:

- Custom color palette
- Typography system
- Consistent component styling
- iOS-style adaptations

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

Wasim Zaman

- Email: wasimxaman13@gmail.com
- GitHub: [@wasim-zaman](https://github.com/yourgithubusername)
