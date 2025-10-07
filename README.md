# Magazine News App

A comprehensive, production-ready Flutter news application demonstrating professional architecture, advanced state management, localization, and integration with modern Flutter technologies. This project is designed to be a portfolio-level showcase of your mobile development and architectural skills.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Project Structure](#project-structure)
- [Technologies Used](#technologies-used)
- [UI & Theming](#ui--theming)
- [Localization](#localization)
- [How to Run](#how-to-run)
- [Screenshots](#screenshots)
- [Contributions](#contributions)
- [License](#license)

---

## Overview

**Magazine News App** is a modern mobile application built with Flutter that enables users to browse, search, and read news articles in a clean, responsive interface. It utilizes advanced state management using bloc and hydarted_bloc for persistent storage to store  localization preference of user to provide a robust user experience. The codebase is structured for scalability and maintainability.

---

## Features

### 📰 News Browsing

- Browse news articles categorized by topics (politics, sports, health, business, environment, science, and more).
- Rich news cards with images, titles, sources, and publication dates.
- Pull news from external APIs with asynchronous loading and error handling.

### 🔍 Search

- Powerful on submit  search functionality to find news articles by keywords.
- Responsive search UI with instant feedback and suggestions.

### 🗂 Categories & Drawer Navigation

- Custom drawer menu for easy navigation between categories and settings.
- Dynamic category switching with state preservation.

### 🌍 Localization

- Multi-language support using Flutter's localization system (`flutter_gen`).
- Localized UI strings and category names.

### ⚙️ Settings

- User settings tab for app language customization.

### 📄 News Details & Web View

- Detailed view for articles with image, author, source, and description.
- "View Full Article" in-app web view using `webview_flutter`.

### 🧩 State Management

- Uses Bloc for reactive UI updates and state sharing.
- Bloc observer integrated for scalable state/event tracking.

### 💾 Persistent Storage

- Save user preferences (such as language) with `hydrated_bloc`.

### 🖼 Custom Theming & Typography

- Consistent look and feel across the app using custom color palettes and Google Fonts.

---

## Architecture

## Project Structure

```
lib/
├── layout/               # Main app layouts and navigation
│   └── layout.dart
├── models/               # Data models for API responses, categories, etc.
├── app_bloc/             # State management (HydratedBloc, Bloc observer)
├── body_content_screens/              # Screens (Home, HomeCategorized, Settings, Search, Article, WebScreen.)
│   ├── home_side_menu.dart   #custom Darawer 
│   ├── settings.dart               #settings where change language
│   ├── search.dart                 # Search UI content
│   ├── article.dart                 # News details view
│   ├── home_categorized.dart #browse news by source of it 
│   ├── web_screen.dart          # In-app web view for articles
│   ├── home.dart                           

├── shared/               # Shared resources (styles, theming, colors, network)
│   ├── styles/
│   │   ├── colors.dart
│   │   ├── text_styles.dart
│   │   └── theming.dart
│   └── network/remote/api_manager.dart
├── main.dart             # Entry point
```

---

## Technologies Used

| Technology               | Purpose                                      |
|--------------------------|----------------------------------------------|
| **Flutter**              | Cross-platform mobile app framework          |
| **Dart**                 | Programming language for Flutter             |
| **Hydrated_Bloc**        | Event/state observer for debugging           |
| **Google Fonts**         | Beautiful custom typography                  |
| **WebView Flutter**      | In-app web page rendering                    |
| **Cached Network Image** | Efficient image loading and caching          |
| **Flutter Localization** | Multi-language/localization support          |
| **Material Design**      | UI and widgets                              |

**Other notable integrations:**
- **Custom Drawer:** For categories and app settings.
- **API Integration:** Fetches news from a remote API (see `ApiManager`).

---

## UI & Theming

- All UI elements use a consistent color palette (see `lib/shared/styles/colors.dart`).
- Responsive layouts, rounded corners, and image assets for a modern look.
- Theming is handled via `MyThemeData` and can be switched at runtime.
- Typography is unified with Google Fonts (Poppins, Exo, Inter, El Messiri).

---

## Localization

- Uses `flutter_gen` and `AppLocalizations` for multi-language support.
- Easily add more languages by updating ARB files and rebuilding.

---

## How to Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/antonious-emad/News_flutter_app.git
   cd News_flutter_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

4. **(Optional) Generate localization and assets:**
   ```bash
   flutter gen-l10n
   ```

---

## Screenshots
<p align="center">

<img src="https://github.com/AntoniousEmadkamel/magazine_new_app/blob/main/screeshoots/splash.png" width="100"/>
<img src="https://github.com/AntoniousEmadkamel/magazine_new_app/blob/main/screeshoots/home.png" width="100"/>
<img src="https://github.com/AntoniousEmadkamel/magazine_new_app/blob/main/screeshoots/home%20%E2%80%93categorized.png" width="100"/>
<img src="https://github.com/AntoniousEmadkamel/magazine_new_app/blob/main/screeshoots/home%20%E2%80%93side%20menu.png" width="100"/>
<img src="https://github.com/AntoniousEmadkamel/magazine_new_app/blob/main/screeshoots/settings.png" width="100"/>
<img src="https://github.com/AntoniousEmadkamel/magazine_new_app/blob/main/screeshoots/home%20%E2%80%93search.png" width="100"/>
<img src="https://github.com/AntoniousEmadkamel/magazine_new_app/blob/main/screeshoots/Article.png" width="100"/>
</p>


## Contributions

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

---

## License

This project is licensed under the MIT License.

---

## Author

- **Antonious Emad**  
  [GitHub](https://github.com/AntoniousEmadkamel)

---

## Portfolio Highlights

- Production-quality app design
- Modern UI & UX
- Full localization 
- State management with  HydratedBloc for Persistent storage and
- API integration
- Custom components and code organization
---

_This README its purpose to provide a comprehensive overview and detailed technical showcase of the Magazine News  App ._
