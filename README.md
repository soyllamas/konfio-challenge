# Dogs We Love™

Dogs We Love™ 🎉 is an app that shows a lists of dogs.

The goal of the project is to showcase my knowledge on Flutter and it's technologies. My
architectural decisions followed simple principles: Simplicity, testability, modularity, scalability
and maintainability to name a few.

I named simplicity first, because that is my _modus operandi_, that's how I usually work, that's
when I feel comfortable. But don't be fooled, the project is simple yet robust. It lives on a
rock-solid foundation suitable for new features, improvements and life-long development.

## 🏛 Architecture

Clean Architecture, SOLID Principles and Domain-Driven Design are at the core of this app's
architecture. First I divided the app into 3 layers with distinct set of responsibilities. Data,
Domain and Presentation.

![Layers: Domain, Data, Presentation](/docs/layers.png)

#### Domain Layer

This layer is the foundation of the whole application. I started here to match my code structure to
the business domain. In this case, delivering dog objects to the user. Notice that the `Domain`
layer is
independent from any other layers. Actually if we exclude Equatable, it only depends on the Dart
language itself.

This approach allows the domain to be independent from the `Data` and `Presentation` layer. Ideally
decisions made on what database to use or how to display the list of dogs to the user should not
result in
any code change to the `Domain` layer.

#### Data Layer

This layer manages data access and exposes said data using `Domain`'s Repositories. This layer is
responsible to retrieve data from the internet and/or local cache (e.g.
[retrofit](https://pub.dev/packages/retrofit), [Floor](https://pub.dev/packages/floor)
, [SharedPreferences](https://pub.dev/packages/shared_preferences)).

We call _data source_ any library, service or client used to retrieve data. In this app we have two
_data sources_.

- Remote: Implemented using [retrofit](https://pub.dev/packages/retrofit), it handles http calls for
  us and automatically casts data into our DTOs.
- Local: Implemented using [floor](https://pub.dev/packages/floor), it caches remote data into a
  local database.

#### Presentation Layer

This layer is closest to what the user sees on the screen. The presentation layer is made easy by
the [bloc](https://pub.dev/packages/bloc) library. Even though we use the _bloc_
library, I decided to use cubits since they are simple yet robust, following the principles
mentioned above.

## 📚 Libraries

This project takes advantage of many popular libraries and tools in the Flutter ecosystem. Here is a
list of the relevant libraries used in the project.

- [bloc](https://pub.dev/packages/bloc): A predictable state management library that helps implement
  the BLoC (Business Logic Component) design pattern.
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): Easy to implement the BLoC (Business Logic
  Component) design pattern.
- [google_fonts](https://pub.dev/packages/google_fonts): Fonts from fonts.google.com in your Flutter
  app.
- [retrofit](https://pub.dev/packages/retrofit): An dio client generator using source_gen and
  inspired by [Chopper](https://pub.dev/packages/chopper)
  and [Retrofit](https://square.github.io/retrofit/).
- [get_it](https://pub.dev/packages/get_it): A simple Service Locator for Dart and Flutter.
- [equatable](https://pub.dev/packages/equatable): Value based equality without needing to
  explicitly override == and hashCode.
- [mocktail](https://pub.dev/packages/mocktail): A Dart mock library which simplifies mocking with
  null safety support and no manual mocks or code generation.

## 🧪 Coverage

To calculate the coverage you should have `lcov` in your computer. If that is not the case, you can
install it by running the following command. ⚠️ Note: you should have [homebrew](https://brew.sh/)
installed.

```shell
brew install lcov
```

Once installed, you can run the following command at the root of the project. This will run all
tests, output a `lcov.info` file and finally, the script will _auto-magically_ open a report in your
browser.

```shell
sh coverage.sh
```

## 👋🏼 Author

![Daniel Llamas](/docs/profile.jpg)
Daniel Llamas, Android Developer
[soyllamas.com](https://soyllamas.com)

Made with ❤️ by @soyllamas.

