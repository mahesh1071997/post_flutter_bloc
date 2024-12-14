# Flutter Bloc with Local Storage Example

This Flutter application demonstrates the usage of the Bloc state management. The app retrieves a list of posts from an API.

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
