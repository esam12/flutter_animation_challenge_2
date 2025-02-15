# Flutter Hero Animation Demo 🚀

[![Flutter Version](https://img.shields.io/badge/flutter-3.13.0+-blue.svg)](https://flutter.dev)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://opensource.org/licenses/MIT)

A sophisticated demonstration of Flutter Hero animations with custom transition effects using `flightShuttleBuilder`. This app showcases smooth transitions between a list view and detail screen with personalized animation configurations.

![Hero Animation Demo](https://example.com/path-to-your-gif.gif) *Replace with actual demo GIF*

## Features ✨

- 🎭 Custom Hero animations with scale transitions
- 🌑 Built-in dark theme support
- 📱 Responsive design for all screen sizes
- 🔄 Different animations for push/pop navigation
- 👤 Sample user data with emoji avatars
- 🛠️ Custom `flightShuttleBuilder` implementation
- � Smooth page transitions with `MaterialPageRoute`

## Installation 🛠️

### Prerequisites
- Flutter SDK 3.0.0+
- Dart 3.0.0+
- Android Studio/VSCode with Flutter extension

### Steps
1. Clone the repository:
```bash
git clone https://github.com/your-username/flutter-hero-animation-demo.git
```

2. Navigate to project directory:
```bash
cd flutter-hero-animation-demo
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Code Overview 💻

### Main Components
1. **Person Model**
```dart
@immutable
class Person {
  final String name;
  final int age;
  final String emoji;
  // Const constructor for immutable data class
}
```

2. **Home Page**
- `ListView.builder` with person data
- Hero-wrapped emoji avatars
- Navigation to detail page

3. **Detail Page**
- Custom AppBar with Hero animation
- Flight shuttle builder for custom transitions
- Scale animation for push navigation

### Key Implementation
**Hero Configuration** (`home_page.dart`)
```dart
// Source Hero
Hero(
  tag: person.name,
  child: Text(person.emoji, style: TextStyle(fontSize: 40)),
)

// Destination Hero
Hero(
  tag: person.name,
  flightShuttleBuilder: (/* parameters */) {
    // Custom transition logic
  },
  child: Text(person.emoji, style: TextStyle(fontSize: 50)),
)
```

**Custom Transition Logic**
```dart
flightShuttleBuilder: (
  flightContext,
  animation,
  flightDirection,
  fromHeroContext,
  toHeroContext,
) {
  switch (flightDirection) {
    case HeroFlightDirection.push:
      return ScaleTransition(
        scale: animation.drive(
          Tween(begin: 0.0, end: 1.0).chain(
            CurveTween(curve: Curves.fastOutSlowIn),
          ),
        ),
        child: toHeroContext.widget,
      );
    case HeroFlightDirection.pop:
      return fromHeroContext.widget;
  }
}
```

## Customization Options 🎨

1. **Change Animation Curve**
```dart
CurveTween(curve: Curves.easeInOutCubic) // Alternative curves
```

2. **Add Fade Animation**
```dart
Opacity(
  opacity: animation.value,
  child: ScaleTransition(...),
)
```

3. **Modify Transition Direction**
```dart
// For horizontal scaling
scale: Tween(begin: 0.5, end: 1.0),
```

4. **Combine Multiple Effects**
```dart
RotationTransition(
  turns: animation,
  child: ScaleTransition(...),
)
```

## Project Structure 📂

```
lib/
├── main.dart            # Entry point & app configuration
├── home_page.dart       # List view implementation
├── detail_page.dart     # Detail screen implementation
└── models/
    └── person.dart      # Data model definition
```

## Best Practices ✅

1. **Tag Management**
- Use unique tags for each Hero pair
- Consider using UUIDs for dynamic content

2. **Performance**
- Keep Hero widgets simple
- Avoid complex layouts in Hero transitions

3. **State Management**
- Use immutable data models
- Consider providers for larger apps

4. **Accessibility**
- Add semantic labels
- Include proper text scaling

## Contributing 🤝

We welcome contributions! Please follow these guidelines:
1. Fork the repository
2. Create feature branch: `git checkout -b feature/your-feature`
3. Commit changes: `git commit -m 'Add awesome feature'`
4. Push to branch: `git push origin feature/your-feature`
5. Open a Pull Request
