# Flutter Bloc with Local Storage Example

This Flutter application demonstrates the usage of the Bloc state management. The app retrieves a list of posts from an API.

here i have use this main pakages
flutter_bloc: ^8.1.6
http: ^1.2.2
shared_preferences: ^2.3.3

---

## File Structure

```plaintext
lib/
|-- models/
|   |-- post.dart                # Data model for the Post object
|
|-- blocs/
|   |-- post_event.dart          # Bloc events for handling actions
|   |-- post_state.dart          # Bloc states for managing UI changes
|   |-- post_bloc.dart           # Bloc logic for managing API calls and local storage
|
|-- screens/
|   |-- post_list_screen.dart    # UI for displaying the list of posts
|   |-- post_detail_screen.dart    # UI for displaying the list of posts
|
|-- service/
|   |-- local_service.dart    # save data local 
|   |-- api_service.dart      # get data from serve
|
|-- main.dart                    # Application entry point
```


## How to Run the Application

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/mahesh1071997/post_flutter_bloc.git
   cd <repository>
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the Application**:
   ```bash
   flutter run
   ```

## Conclusion
This application serves as a starting point for combining state management, local storage, and API integration in Flutter. Feel free to extend it as per your requirements!
