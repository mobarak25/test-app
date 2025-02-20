# 📌 Flutter Repository Explorer

A Flutter application that fetches and displays the most popular **Flutter** repositories from GitHub, sorted by star count. Built using **Clean Code Architecture** with **Bloc for state management**, **Dio for API calls**, and **Hive for caching**.

---

## 📌 Features
👉 List of **Flutter repositories** sorted by star count (most popular first).  
👉 **Infinite Scroll Pagination** (Loads more repositories as you scroll).  
👉 **Repository Details Page** (Shows owner, description, and last update).  
👉 **Error Handling & Caching** (Offline support with Hive).  
👉 **Follows Clean Architecture (SOLID Principles)**.  

---

## 📌 Tech Stack
- **Flutter**: `3.x.x`
- **Dart**: `>=3.0.0`
- **State Management**: `flutter_bloc`
- **HTTP Requests**: `HTTP`
- **Caching**: `Hive`
- **Dependency Injection**: `GetIt`

---

## 📌 Installation

### 1️⃣ Clone the Repository
```sh
git clone https://github.com/your_username/repo_explorer.git
cd repo_explorer
```

### 2️⃣ Install Dependencies
```sh
flutter pub get
```

### 3️⃣ Run the App
```sh
flutter run
```

---

## 📌 API Details
We use the **GitHub Search API** to fetch repositories:

```
https://api.github.com/search/repositories?q=flutter&sort=stars&order=desc&page=1&per_page=10
```

📌 **Sorting:** Most popular repositories appear **first**.  
📌 **Pagination:** Fetches repositories **10 at a time**.

---

## 📌 Project Structure (Clean Architecture)
```
lib/
│── core/                  # Core utilities (network, error handling)
│── data/                  # Data sources, models, repository implementation
│── domain/                # Business logic (use cases, entities, repository interfaces)
│── presentation/          # UI layer (Blocs, Pages, Widgets)
│── main.dart              # Entry point
```

---

## 📌 Step-by-Step Implementation

### 1️⃣ **Setup Dependencies**
Install required packages:
```sh
flutter pub add dio flutter_bloc get_it hive hive_flutter
flutter pub add hive_generator build_runner --dev
```

### 2️⃣ **Setup API Call (`RepositoryRemoteDataSource`)**
```dart
class RepositoryRemoteDataSource {
  final Dio dio;

  RepositoryRemoteDataSource(this.dio);

  Future<List<RepositoryModel>> fetchRepositories(int page) async {
    final response = await dio.get(
      "https://api.github.com/search/repositories",
      queryParameters: {
        "q": "flutter",
        "sort": "stars",
        "order": "desc",
        "page": page,
        "per_page": 10,
      },
    );

    if (response.statusCode == 200) {
      List data = response.data['items'];
      return data.map((e) => RepositoryModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load repositories");
    }
  }
}
```

### 3️⃣ **Repository Model**
```dart
class RepositoryModel {
  final String name;
  final String owner;
  final int stars;
  final String description;
  final String lastUpdated;

  RepositoryModel({
    required this.name,
    required this.owner,
    required this.stars,
    required this.description,
    required this.lastUpdated,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'],
      owner: json['owner']['login'],
      stars: json['stargazers_count'],
      description: json['description'] ?? '',
      lastUpdated: json['updated_at'],
    );
  }
}
```

### 4️⃣ **Implement Bloc for State Management**
```dart
class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  final GetRepositories getRepositories;

  RepositoryBloc(this.getRepositories) : super(RepositoryLoading()) {
    on<FetchRepositories>((event, emit) async {
      final result = await getRepositories(event.page);
      result.fold(
        (failure) => emit(RepositoryError("Failed to load data")),
        (repositories) => emit(RepositoryLoaded(repositories)),
      );
    });
  }
}
```

### 5️⃣ **Create the Repository List Page**
```dart
class RepositoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Repositories")),
      body: BlocBuilder<RepositoryBloc, RepositoryState>(
        builder: (context, state) {
          if (state is RepositoryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RepositoryLoaded) {
            return ListView.builder(
              itemCount: state.repositories.length,
              itemBuilder: (context, index) {
                final repo = state.repositories[index];
                return ListTile(
                  title: Text(repo.name),
                  subtitle: Text("⭐ ${repo.stars} - ${repo.owner}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RepositoryDetailPage(repo: repo),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text("Error loading repositories"));
          }
        },
      ),
    );
  }
}
```

---

## 📌 Future Enhancements
- ✅ **Offline Support** (Cache API responses).
- ✅ **Dark Mode Support**.
- ✅ **Unit & Widget Tests**.


---

## 📌 License
This project is licensed under the **MIT License**.

---
🔗 **GitHub Repository:** [https://github.com/mobarak25/test-app](https://github.com/mobarak25/test-app)


