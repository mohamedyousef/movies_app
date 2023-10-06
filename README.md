# Movie App Task 
This documentation provides an overview of the Movie App, which is built using Flutter. The app fetches movie data from a third-party API, displays a list of movies, shows movie details when a specific movie is clicked, caches data for offline mode, and handles error states.
## Table of Contents

- [Requirements](#requirements)
- [Architecture](#architecture)
- [Installation](#installation)
- [Usage](#usage)
- [Offline Mode](#offline-mode)
- [Error Handling](#error-handling)
- [Platform-Specific Code](#platform-specific-code)
- [License](#license)

### Requirements

The Movie App should meet the following requirements:

1. The app should be built using appropriate coding standards and follow best practices for Flutter development.
2. The app should fetch movie data from a specified third-party API.
3. The app should display a list of movies fetched from the API.
4. When a specific movie is clicked, the app should show the details of that movie.
5. The app should cache data to enable offline mode functionality.
6. The app should handle error states, such as when there is no data or no internet connection.
7. The network request to fetch movie data should be executed using platform-specific code for Android and iOS.

### Architecture

The Movie App follows a modular architecture to ensure separation of concerns and maintainability. It consists of the following components:

1. **UI Components**: These components are responsible for rendering the user interface, including the movie list, movie details, and error states.
2. **Data Layer**: This layer handles data fetching, caching, and error handling. It interacts with the third-party API to fetch movie data and caches the data for offline mode. It also handles error states and provides appropriate feedback to the UI layer.
3. **Platform-Specific Code**: This component contains the platform-specific code for Android and iOS that executes the network request to fetch movie data.

### Installation

To install and run the Movie App, follow these steps:

1. Clone the repository from the provided source.
2. Install the necessary dependencies using Flutter's pub package manager.
3. Build and run the app on your desired platform (Android or iOS).

### Usage

Once the Movie App is installed and running, you can use it to:

1. View a list of movies fetched from the third-party API.
2. Click on a specific movie to view its details.
3. Enable offline mode to view cached movie data when there is no internet connection.
4. Handle error states, such as when there is no data or no internet connection.

### Offline Mode

The Movie App supports offline mode by caching movie data. When the app is launched without an internet connection, it will display the cached movie data instead of making a network request. This ensures that users can still view movie information even when they are offline.

### Error Handling

The Movie App handles error states to provide a seamless user experience. It displays appropriate error messages when there is no data or no internet connection. Error handling is implemented in both the UI layer and the data layer to ensure that users are informed of any issues and can take appropriate actions.

### Platform-Specific Code

The Movie App utilizes platform-specific code for Android and iOS to execute the network request for fetching movie data. This code is written in Kotlin for Android and Swift for iOS. By using platform-specific code, the app can leverage platform-specific features and optimize network requests for better performance.

### ScreenShot 


### Todo  
1. Remove expiration cached data 
2. Support other  http methods ( post - put - delete ) 
3. Enhance interceptors 
 