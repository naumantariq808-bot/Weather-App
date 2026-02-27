# Weather App

A modern, feature-rich Flutter weather application that provides real-time weather information, hourly forecasts, and daily projections. Built with clean architecture principles and state management using GetX.

## 📱 Features

- **Real-Time Weather Data**: Get current weather conditions including temperature, humidity, wind speed, and cloud coverage
- **Hourly Forecast**: View weather predictions for the next 24 hours
- **Daily Forecast**: 7-day weather forecast with detailed information
- **Location-Based**: Automatic location detection and weather data fetching
- **Responsive UI**: Beautifully designed interface that works seamlessly across different screen sizes
- **User-Friendly Interface**: Intuitive weather visualization with weather icons and detailed metrics

## 🛠️ Tech Stack

- **Framework**: Flutter 3.x
- **Language**: Dart
- **State Management**: GetX
- **HTTP Client**: http
- **Location Services**: Geolocator, Geocoding
- **Responsive Design**: Sizer
- **UI Components**: Material Design, Cupertino Icons
- **API**: OpenWeatherMap API

## 📋 Project Structure

```
lib/
├── main.dart                          # Application entry point
├── screens/
│   └── home.dart                      # Home screen
├── controller/
│   └── global_controller.dart         # Global state management
├── model/
│   └── weather_model/                 # Data models
│       ├── weather.dart
│       ├── clouds.dart
│       ├── coord.dart
│       ├── main.dart
│       ├── sys.dart
│       ├── wind.dart
│       └── weather.dart
└── widget/
    ├── header_widget.dart             # Weather header with location
    ├── current_weather_widget.dart    # Current weather display
    ├── hourly_weather_widget.dart     # Hourly forecast
    └── daily_weather_widget.dart      # Daily forecast
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)
- OpenWeatherMap API Key (free at https://openweathermap.org/api)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/naumantariq808-bot/Weather-App.git
   cd Weather-App
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API Key**
   - Get a free API key from [OpenWeatherMap](https://openweathermap.org/api)
   - Update the API call in `lib/controller/global_controller.dart` with your API key

4. **Run the application**
   ```bash
   flutter run
   ```

## 📲 Usage

### Getting Weather Data

The app automatically detects your location and fetches weather data. To manually update:

1. Launch the app
2. Grant location permissions when prompted
3. The app will automatically fetch and display weather information

### Available Information

- **Current Weather**: Temperature, weather description, humidity, wind speed, clouds
- **Hourly Forecast**: Weather conditions for the next 24 hours
- **Daily Forecast**: 7-day weather prediction

## 🏗️ Architecture

The app follows a clean architecture pattern with:

- **Controllers**: Manage state and business logic using GetX
- **Models**: Data structures for weather information
- **Widgets**: Reusable UI components
- **Screens**: Main application screens

### State Management

GetX is used for:
- Reactive state management with Observables (Rx)
- Dependency injection
- Route management
- Efficient widget rebuilding

## 🔌 API Integration

### Weather API

The application uses the OpenWeatherMap API to fetch:
- Current weather conditions
- Hourly weather forecast
- Daily weather forecast

**API Endpoints Used:**
- Current Weather: `https://api.openweathermap.org/data/2.5/weather`
- Forecast: `https://api.openweathermap.org/data/2.5/forecast`

## 📦 Dependencies

Key packages used in this project:

```yaml
dependencies:
  flutter:
    sdk: flutter
  geolocator: ^14.0.2          # Location services
  geocoding: ^4.0.0            # Address geocoding
  sleek_circular_slider: ^2.1.0 # UI slider component
  http: ^1.6.0                 # HTTP client
  get: ^4.7.3                  # State management
  sizer: ^2.0.0                # Responsive design
  cupertino_icons: ^1.0.2      # iOS style icons
```

## 🎨 UI/UX Features

- Clean, modern Material Design interface
- Responsive layouts using Sizer for various screen sizes
- Weather icons and visual indicators
- Intuitive navigation and information hierarchy
- Smooth animations and transitions

## 📍 Permissions Required

The app requires:
- **Location Permission**: To fetch current location and weather data
- **Network Permission**: To communicate with weather API

## 🐛 Known Issues

None at this time. Please report issues on the GitHub Issues page.

## 🔄 Future Enhancements

- [ ] Multiple location support
- [ ] Weather alerts and notifications
- [ ] Offline mode with caching
- [ ] Dark theme support
- [ ] Weather maps and radar
- [ ] Air quality index
- [ ] UV index information

## 📝 License

This project is open source and available under the MIT License.

## 👤 Author

**Muhammad Nauman**
- GitHub: [@naumantariq808-bot](https://github.com/naumantariq808-bot)
- Email: naumantariq808@gmail.com

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📞 Support

For support, please open an issue on the GitHub repository or contact the author.

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- GetX community for excellent state management
- OpenWeatherMap for providing the weather API
- All contributors who have helped with the project

---

**Last Updated**: February 27, 2026  
**Version**: 1.0.0
