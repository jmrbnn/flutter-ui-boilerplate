# Flutter Boilerplate (CLEAN Architecture with Riverpod) 

  

**Flutter ([CLEAN Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html) with [Riverpod](https://riverpod.dev/)) Boilerplate** is baseline template for implementing standard Flutter projects adhering to the CLEAN Architecture principles. It provides a starting point for developing Flutter applications. This boilerplate aims to accelerate the development process and ensure consistency across Flutter applications by providing predefined structure and ready-to-use set of features.


### What is used in this boilerplate?

  

-  **Riverpod**
Used for state management

-  **Freezed**
Code generation

-  **Dartz**
Functional Programming `Either<Left,Right>`

-  **Go Route**
Navigation/Routing package

-  **Dio**
Http client for dart. Supports interceptors and global configurations

-  **Shared Preferences**
Persistent storage for simple data

-  **Shared Preferences**
Persistent storage for simple data

-  **Equatable**
For implementing value based equality

-  **Logger**
For printing readable logs

-  **Flutter and Dart**


  

### Project Description

#### Data
The data layer is the outermost layer of the application and is responsible for communicating with the server-side or a local database and data management logic. It also contains repository implementations.

  

##### a. Data Source
Describes the process of acquiring and updating the data.

Consist of remote and local Data Sources. Remote Data Source will perform HTTP requests on the API. At the same time, local Data sources will cache or persist data.

  

##### b. Repository
The bridge between the Data layer and the Domain layer.

Actual implementations of the repositories in the Domain layer. Repositories are responsible for coordinating data from the different Data Sources.

  

#### Domain

  

The domain layer is responsible for all the business logic. It is written purely in Dart without flutter elements because the domain should only be concerned with the business logic of the application, not with the implementation details.

  

##### a. Providers

  

Describes the logic processing required for the application.

Communicates directly with the repositories.

  

##### b. Repositories

  

Abstract classes that define the expected functionality of outer layers.

  

#### Presentation

  

The presentation layer is the most framework-dependent layer. It is responsible for all the UI and handling the events in the UI. It does not contain any business logic.

  

##### a. Widget (Screens/Views)

  

Widgets notify the events and listen to the states emitted from the `StateNotifierProvider`.

  

##### b. Providers

  

Describes the logic processing required for the presentation.

Communicates directly with the `Providers` from the domain layer.

  

### Project Description

  

-  `main.dart` file has services initialization code and wraps the root `MyApp` with a `ProviderScope`

-  `main/app.dart` has the root `MaterialApp` and initializes `GoRouter`to handle the route throughout the application, and the `Theme Service` .

-  `src/core/router` contains the routing configuration and routes definition.

-  `src/core/services` abstract app-level services with their implementations.

-  `src/core/shared` folder contains code shared across features

-  `src/features` folder contains the implementation code for each feature

-  `http` is implemented with Dio.

-  `storage` is implemented with SharedPreferences.

- Service locator pattern and Riverpod are used to abstract services when used in other layers.

  

For example:

  

```dart

final  netwokServiceProvider  =  Provider<DioNetworkService>((ref) {
	final  Dio  dio  =  Dio();
	return  DioNetworkService(dio);
});

  

// Usage:

// ref.watch(netwokServiceProvider);

```

  

- The `src/core/features` folder: the repository pattern is used to decouple logic required to access data sources from the domain layer. For example, the `OAuthenticationRepository` abstracts and centralizes the various functionality required to POST the `OAuthParameters` to the remote.

  

```dart

abstract  class  OAuthenticationRepository {

Future<Either<AppException, User>> oAuthLoginUser(OAuthParameters  parameters);

```

  

The repository implementation with the `OAuthenticationRepository`:

  

```dart

class  OAuthenticationRepositoryImpl  extends  OAuthenticationRepository {
	final  OAuthUserDataSource  dataSource;
	OAuthenticationRepositoryImpl(this.dataSource);

	@override
	Future<Either<AppException, User>> oAuthLoginUser(OAuthParameters  parameters) {
		return  dataSource.oAuthLoginUser(parameters);	
	}
}

```

  

Using Riverpod `Provider` to access this implementation:

  

```dart

final  oAuthRepositoryProvider  =  Provider<OAuthenticationRepository>((ref) {

	final  NetworkService  networkService  =  ref.watch(netwokServiceProvider);
	final  OAuthUserDataSource  dataSource  = ref.watch(oAuthdataSourceProvider(networkService));
	return  OAuthenticationRepositoryImpl(dataSource);
	},

);

```

  

And finally accessing the repository implementation from the Presentation layer using a Riverpod `StateNotifierProvider`:

  

```dart

final oAuthStateNotifierProvider =

StateNotifierProvider<OAuthNotifier, OAuthState>((ref) {
	final  OAuthenticationRepository  authenticationRepository  = ref.watch(oAuthRepositoryProvider);
	final  UserRepository  userRepository  = ref.watch(userLocalRepositoryProvider);

	return  OAuthNotifier(
		authRepository:  authenticationRepository,
		userRepository:  userRepository
	);

});

```

  

Notice how the abstract `NetworkService` is accessed from the repository implementation and then the abstract `OAuthenticationRepository` is accessed from the `OAuthNotifier` and how each of these layers acheive separation and scalability by providing the ability to switch implementation and make changes and/or test each layer seaparately.

  

### Testing

  

The `test` folder mirrors the `lib` folder in addition to some test utilities.

  

[`state_notifier_test`](https://pub.dev/packages/state_notifier_test) is used to test the `StateNotifier` and mock `Notifier`.

  

[`mocktail`](https://pub.dev/packages/mocktail) is used to mock dependecies.

  

#### 1. Testing the simple `Provider` provider:

  

```dart

test('oAuthDataSourceProvider is a OAuthUserDataSource', () {

oAuthDataSource = providerContainer.read

(oAuthDataSourceProvider(networkService));

  

expect(

oAuthDataSource,

isA<OAuthUserDataSource>(),

);

});

```

  

And here is how we can test it separately from Flutter:

  

```dart

void  main() {

late  OAuthUserDataSource oAuthUserDatasource;

late  OAuthenticationRepository oAuthenticationRepository;

setUpAll(() {

oAuthUserDatasource = MockRemoteDatasource();

oAuthenticationRepository = DashboardRepositoryImpl(oAuthUserDatasource);

});

test(

'Should return AppException on failure',

() async {

// arrange

when(() => oAuthUserDatasource.oAuthLoginUser()).thenAnswer((_) async => Left(ktestAppException));

  

// assert

final response = await oAuthenticationRepository.oAuthLoginUser(OAuthParameters.fromJson({}));

  

// act

expect(response.isLeft(), true);

},

);

}

  

class  MockRemoteDatasource  extends  Mock  implements  OAuthUserRemoteDataSource {}

```




### Folder Structure

  

```

lib
├── src
│    └── core
│    │    ├── configs
│    │    │    └── app_configs.dart
│    │    ├── router
│    │    │    ├── router_config.dart
│    │    │    └── routers.dart
│    │    ├── services
│    │    │    └── user_cache_service
│    │    │         ├── data
│    │    │         │    ├── datasource
│    │    │         │    │    └── user_local_datasource.dart
│    │    │         │    ├── repository
│    │    │         │    │    └── user_repository_impl.dart
│    │    │         ├── domain
│    │    │         │    ├── providers
│    │    │         │    │    └── user_cache_provider.dart
│    │    │         │    ├── repositories
│    │    │         │    │    └── user_cache_repository.dart
│    │    │         └── presentation
│    │    └── shared
│	 │	       ├── data
│	 │	       ├── domain
│	 │	       ├── exceptions
│	 │	       ├── mixins
│	 │	  	   ├── exceptions
│	 │	  	   └── globals.dart
│    └── features
│	 │	  └── ...(custom feature)
│	 │	   	   ├── data
│	 │	       │    ├── datasource
│	 │	       │    │    ├── (custom feature)_data_source.dart
│	 │	       │    │    ├── (custom feature)_local_data_source.dart
│	 │	       │    │    └── (custom feature)_remote_data_source.dart
│	 │	   	   │	└── repositories
│	 │	       │    │    └── (custom feature)_repository_impl.dart
│	 │	   	   ├── domain
│	 │	       │    ├── entities
│	 │	       │    │    ├── (custom feature)_entity.dart
│	 │	       │    ├── providers
│	 │	       │    │    └── (custom feature)_provider.dart
│	 │	   	   │	└── repositories
│	 │	       │    │    └── (custom feature)_repository.dart
│	 │	   	   └── presentation
│	 │	            ├── providers
│	 │	            │    ├── state
│	 │	            │    │    ├── (custom feature)_notifier.dart
│	 │	            │    │    └── (custom feature)_state.dart
│	 │	            │    └── (custom feature)_providers.dart
│	 │	            ├── widgets
│	 │	   	    	└── screens
│	 │	                 └── (custom feature)_screen.dart
│    └── main
│	      ├── app.dart
│	 	  ├── app_env.dart
│	 	  ├── main_dev.dart
│	 	  ├── main_staging.dart
│	 	  └── observers.dart
└── main.dart

....

```

  

### Run this project

  

##### Clone this repository

  

` git clone git@bitbucket.org:empowerteams/emp-ai-flutter-boilerplate.git`

  

##### Go to the project directory

  

` cd emp-ai-flutter-boilerplate`

  

##### Get all the packages

  

`flutter pub get`

  

##### Run the build runner command

  

`flutter pub run build_runner build `

  

##### Run the project

  

`flutter run` or simply press ` F5 key` if you are using VSCode


### Authors
 - [John Marbenn Sta. Maria](mailto:john.sta.maria@emapta.com), Artificial Intelligence, Machine Learning, Data Warehousing and Analytics Department