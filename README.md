# News App 📰

A clean, lightweight news application built with **Flutter**, powered by the [NewsAPI](https://newsapi.org/). The app lets users browse top headlines by category, search for any topic, read full article details, and open the original article in a browser — all wrapped in a smooth, localized (English/Arabic) UI.

---

## ✨ Features

- **Top Headlines** — Fetches and displays the latest US top headlines on launch.
- **Category Filtering** — Filter headlines by category (Business, Entertainment, General, Health, Science, Sports, Technology) with a single tap; tapping the same category again clears the filter.
- **Search** — Search NewsAPI's full article index (`everything` endpoint) by keyword.
- **Article Details** — A dedicated screen showing the article's image, title, author, publish date, and full content.
- **Open Original Article** — Opens the source article in an in-app web view, falling back to an external browser if that fails.
- **Simple In-Memory Caching** — Headlines are cached per category so switching between tabs doesn't trigger a new network call every time.
- **Loading / Error / Empty States** — Dedicated widgets for loading spinners, network errors, generic errors, and "no image" placeholders.
- **Localization** — Full English and Arabic translations via `easy_localization`.
- **Responsive UI** — Layout scales across device sizes using `flutter_screenutil`.
- **Custom Route Transitions** — Fade transitions between screens using `go_router`.

---

## 🧱 Tech Stack

| Concern                | Package                                                                  |
|-------------------------|---------------------------------------------------------------------------|
| Networking              | [`dio`](https://pub.dev/packages/dio)                                     |
| Routing                 | [`go_router`](https://pub.dev/packages/go_router)                         |
| State management        | Plain `ChangeNotifier` + `ListenableBuilder` (no external state library)  |
| Localization             | [`easy_localization`](https://pub.dev/packages/easy_localization)         |
| Responsive sizing        | [`flutter_screenutil`](https://pub.dev/packages/flutter_screenutil)       |
| Image loading/caching    | [`cached_network_image`](https://pub.dev/packages/cached_network_image)   |
| Fonts                    | [`google_fonts`](https://pub.dev/packages/google_fonts)                   |
| Date formatting          | [`intl`](https://pub.dev/packages/intl)                                   |
| Launching URLs           | [`url_launcher`](https://pub.dev/packages/url_launcher)                   |
| Spacing widgets          | [`gap`](https://pub.dev/packages/gap)                                     |

---

## 🗂️ Project Structure

The project follows a **feature-first** architecture: shared code lives under `core/`, while each screen/flow lives under its own folder in `features/`.

```
lib/
├── main.dart                     # App entry point: init localization + Dio, run the app
├── app.dart                      # Root widget: ScreenUtil + MaterialApp.router setup
│
├── core/
│   ├── components/                # Widgets shared across features
│   │   ├── custom_main_image.dart     # Cached network image with loading/error placeholders
│   │   ├── loading_widget.dart        # Sliver loading spinner shown while fetching data
│   │   ├── my_error_widget.dart       # Sliver error state (network vs. generic) with a retry button
│   │   ├── news_content_view.dart     # Decides which state to render: loading / error / list / empty
│   │   ├── news_list_view.dart        # Sliver list of articles (first item styled differently on Home)
│   │   ├── news_tile.dart             # Compact article row (title, author, date, thumbnail)
│   │   ├── primary_outlined_button.dart # Reusable outlined "Open Article" button
│   │   └── top_headline_item.dart     # Larger featured card for the first headline on Home
│   │
│   ├── constants/
│   │   ├── app_colors.dart            # App-wide color palette
│   │   ├── app_icons.dart             # Icon constants
│   │   └── app_sizes.dart             # Spacing, radius, and font-size constants (via ScreenUtil)
│   │
│   ├── models/
│   │   ├── article_model.dart         # Article data model + JSON parsing/date formatting
│   │   ├── category_model.dart        # Simple (name, id) pair used for the category chips
│   │   └── source_model.dart          # News source (id, name) model
│   │
│   ├── networking/
│   │   ├── api_endpoints.dart         # Base URL + endpoint paths (top-headlines, everything)
│   │   ├── api_infos.dart             # ⚠️ Not committed — holds the NewsAPI key (see Setup below)
│   │   └── dio_helper.dart            # Configured Dio instance + generic GET request wrapper
│   │
│   ├── repositories/
│   │   ├── home_repository.dart       # Bridges HomeServices + NewsCache, returns parsed articles
│   │   └── search_repository.dart     # Bridges SearchServices, returns parsed search results
│   │
│   ├── routes/
│   │   ├── app_router.dart            # go_router route table + fade page transitions
│   │   └── route_names.dart           # Route path/name constants (home, search, details)
│   │
│   ├── services/
│   │   ├── home_services.dart         # Raw API call for top headlines (optionally by category)
│   │   ├── search_services.dart       # Raw API call for keyword search
│   │   └── news_cache.dart            # In-memory cache keyed by category
│   │
│   └── styles/
│       ├── container_styles.dart      # Decoration presets (e.g. selected/unselected category chip)
│       └── text_styles.dart           # Centralized TextStyle definitions
│
└── features/
    ├── home/
    │   ├── controllers/home_controller.dart     # ChangeNotifier: category selection + fetch/loading/error state
    │   ├── screens/home.dart                    # Home screen: app bar, category list, headline feed
    │   └── widgets/
    │       ├── categories_list_view.dart          # Horizontal scrollable list of category chips
    │       ├── category_card.dart                 # A single selectable category chip
    │       └── home_app_bar.dart                  # Custom app bar with the search icon action
    │
    ├── search/
    │   ├── controllers/search_controller.dart   # ChangeNotifier: query, results, loading/error state
    │   ├── screens/search_screen.dart           # Search screen: text field + results list
    │   └── widgets/custom_text_field.dart         # Styled search input field
    │
    └── article_view/
        ├── screens/article_view.dart            # Full article screen: hero image + scrollable content
        └── widgets/article_action_section.dart    # "Open Article" button + in-app/external browser launch logic
```

---

## 🔍 How It Works

### App startup (`main.dart` → `app.dart`)
1. `main.dart` initializes Flutter bindings, initializes `easy_localization`, and calls `DioHelper.initDio()` to set up the shared `Dio` client.
2. The app is wrapped in `EasyLocalization` with English and Arabic support (`assets/translations/en.json`, `ar.json`), falling back to English.
3. `News` (`app.dart`) wraps everything in `ScreenUtilInit` for responsive sizing, then boots `MaterialApp.router` using the route table defined in `AppRouter`.

### Networking layer
- `ApiEndpoints` holds the NewsAPI base URL and the two endpoints used: `top-headlines` and `everything`.
- `DioHelper` lazily creates a single `Dio` instance with a 10-second connect/receive timeout and exposes a generic `getRequest` method that throws a readable `Exception` on failure.
- `HomeServices` and `SearchServices` each build the query parameters (API key, country/category, or search term) and call `DioHelper.getRequest`.

### Repositories & caching
- `HomeRepository` first checks `NewsCache` for the requested category; if nothing is cached, it calls `HomeServices`, maps the raw JSON `articles` array into a list of `ArticleModel`, caches it, and returns it.
- `SearchRepository` calls `SearchServices` and maps the results into `ArticleModel` the same way (search results aren't cached, since each query is different).

### State management (Home & Search)
Both `HomeController` and `MySearchController` are plain `ChangeNotifier`s — no external state-management package is used:
- They expose `isLoading`, `errorMessage`, and the fetched `articles` list.
- Screens wrap their UI in a `ListenableBuilder` that rebuilds whenever `notifyListeners()` fires.
- `HomeController` additionally tracks `selectedCategoryId`; tapping the currently-selected category again clears the filter and re-fetches unfiltered headlines.
- `MySearchController` remembers the `_currentQuery` so the "Try Again" button on an error can re-run the last search.

### UI states
`NewsContentView` is the single widget both Home and Search use to decide what to render:
- **Loading** → `LoadingWidget` (spinner + "Loading..." text).
- **Error** → `MyErrorWidget`, which shows a Wi-Fi-off icon and message for network errors, or a generic error icon/message otherwise, plus a "Try Again" button.
- **Data** → `NewsListView`, which renders a `TopHeadlineItem` (large card) as the first item on Home, or a `NewsTile` (compact row) as the first item on Search — every following item is a `NewsTile`.
- **Empty** → an empty `SizedBox` (no crash, no placeholder — deliberately minimal).

### Routing
`AppRouter` defines three routes with `go_router`, each using a `CustomTransitionPage` with a 400ms fade transition:
- `/home` → `Home`
- `/search` → `SearchScreen`
- `/details` → `ArticleView`, receiving the tapped `ArticleModel` via `state.extra`

### Article details & opening the source
- `ArticleView` shows the article image at the top (via `CustomMainImage`, which handles loading/error states with `cached_network_image`), then a rounded white sheet with the title, `author · publishedAt`, and content.
- `ArticleActionSection` renders the "Open Article" button. On tap, it validates the URL, tries to launch it in an in-app web view, falls back to the external browser if that fails, and shows a localized error snackbar if both attempts fail.

### Data model
`ArticleModel.fromJson` parses NewsAPI's article JSON, falling back to friendly defaults (`"Unknown Author"`, `"No title available"`, etc.) for any missing field, and reformats `publishedAt` into `yyyy-MM-dd HH:mm` local time using `intl`.

### Localization
All user-facing strings (button labels, error messages, category names, hints) are pulled from `assets/translations/en.json` and `ar.json` via the `.tr()` extension, so the entire app can switch between English and Arabic.

---

## ⚙️ Setup & Running the App

This project uses the free [NewsAPI](https://newsapi.org/) service, which requires an API key that is **not committed to the repo** for security reasons (see `.gitignore`).

1. **Clone the repo**
   ```bash
   git clone https://github.com/Ziad-Yaseen/News_App.git
   cd News_App
   ```

2. **Get a free API key** from [newsapi.org](https://newsapi.org/register).

3. **Create the missing config file** at `lib/core/networking/api_infos.dart`:
   ```dart
   class ApiInfos {
     static const String apiKey = 'YOUR_NEWSAPI_KEY_HERE';
   }
   ```

4. **Install dependencies**
   ```bash
   flutter pub get
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

> **Note:** NewsAPI's free tier only allows requests from `localhost` for browser-based testing and has a limited daily request quota — this is a NewsAPI limitation, not an app bug.

---

## 📌 Status

This is an ongoing learning/portfolio project. Current focus areas include refining state handling and cleaning up small typos/edge cases as they're found.