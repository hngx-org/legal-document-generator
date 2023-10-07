# Legal Documents Generator

This is the codebase for a Legal Documents Generator app, developed by [@Marshal Moses](https://github.com/shockwavetech), [@VCTR](https://github.com/vicsam) and [@Olankan](https://github.com/olankan). 

> **Note**: If you're new to this codebase, we recommend reading the comments provided in the code to gain a better understanding of how it works under the hood.

> **Note**: Exercise caution when editing parts of the codebase that you don't fully understand. If you need to make changes to a file or structure you're unfamiliar with, don't hesitate to reach out to your teammates for assistance.

## Table of Contents
- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [Functions](#functions)
  - [HNG Authentication Package](#hng-authentication-package)
      - [Register User](#register-user)
      - [Sign-In](#sign-in)
  - [OpenAI Package](#openai-package)
  - [Payment Package](#payment-package)

## Introduction

The Legal Documents Generator is an app designed to generate legal documents for either individual purposes or organization purposes. It simplifies the process of getting legal documents by using OpenAI's API.

## Getting Started

To work on and contribute to the app, follow these steps:

1. **Fork the Repository**: Fork this repository to create your own copy.
2. **Setup Flutter SDK**: Ensure that your Flutter SDK is up to date.
3. **Fetch Dependencies**: Run `flutter pub get` to fetch all the required packages.
4. **Stay Updated**: Regularly perform `git pull` to keep your local repository up to date with the latest changes.
5. **Development**: Work on your assigned tasks, following best practices and code standards.
6. **Resolve Issues and Errors**: Before creating a pull request (PR), make sure to resolve any errors, including linting errors (use `dart fix --apply` to fix them).
7. **Create a Pull Request**: Submit a pull request for your changes and await feedback and merge, if applicable.

## Contributing

We welcome contributions from the community to help improve this app. If you have suggestions, bug reports, or want to contribute code, please follow these steps:

1. **Fork the Repository**: Fork this repository to create your own copy.
2. **Create a Branch**: Create a new branch for your changes (e.g., `feature/my-new-feature` or `bugfix/issue-description`).
3. **Make Changes**: Make your desired changes in your branch.
4. **Commit and Push**: Commit your changes and push them to your forked repository.
5. **Create a Pull Request**: Submit a pull request to this repository, describing your changes and why they are valuable.
6. **Review and Discussion**: Participate in discussions and make any necessary revisions based on feedback.

## Functions

Here are some of the key functions in the Legal Documents Generator app:

### HNG Authentication Package

#### Register User

```dart

void registerUser() async {
  // Get user input from controllers
  final email = emailController.text.toLowerCase().trim();
  final password = passwordController.text;
  final name = nameController.text;

  // Create an instance of the authentication repository
  final authRepository = Authentication();

  try {
    // Call the signUp method from the authentication repository
    final registrationData = await authRepository.signUp(email, name, password);

    if (registrationData != null) {
      // Registration was successful, handle the success case
      print('Registration successful');
      print('User email: ${registrationData.email}');
      print('User ID: ${registrationData.id}');
      print('User created at: ${registrationData.createdAt}');
      // Optionally, navigate to another screen or show a success message.
    } else {
      // Registration failed, handle the error case
      print('Registration failed');
      // Optionally, display an error message.
    }
  } catch (e) {
    // Handle exceptions, such as network errors or validation errors
    print('Error during registration: $e');
    // Optionally, display an error message.
  }
}
```
#### Sign-In
``` dart

void signInUser() async {
  // Get user input from controllers
  final email = emailController.text;
  final password = passwordController.text;

  // Create an instance of the authentication repository
  final authRepository = Authentication();

  try {
    final userData = await authRepository.signIn(email, password);

    if (userData != null) {
      // Sign-in successful, handle the success case
      print('Sign-in successful');
      // Optionally, navigate to another screen or show a success message.
    } else {
      // Sign-in failed, handle the error case
      print('Sign-in failed');
      // Optionally, display an error message.
    }
  } catch (e) {
    // Handle exceptions, such as network errors or validation errors
    print('Error during sign-in: $e');
    // Optionally, display an error message.
  }
}
```

### OpenAI Package

```dart
// Check for AI response and display it
Future<void> checkAiResponse() async {
  setState(() {
    isLoading = true;
  });

  try {
    final aiResponse = await postToCompletions();
    setState(() {
      responseText = aiResponse;
      isLoading = false;
    });
  } catch (e) {
    print('Error fetching AI response: $e');
    setState(() {
      isLoading = false;
    });
  }
}

// Call the checkAiResponse function in your UI, such as in a button onPressed event
CustomButton(
  onPressed: () async {
    await checkAiResponse();
  },
  buttonText: 'Get AI Response',
  backgroundColor: AppColor.primaryColor,
)
```

### Payment Package
```dart
class SubscriptionScreen extends StatefulWidget {
  // ...

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final pay = HNGPay();
  int selectedAmount = 0;

  @override
  Widget build(BuildContext context) {
    // ...

    pay.googlePay(
      amountToPay: selectedAmount.toString(),
      userID: '', // Provide the user's ID
    );
  }
}
```

Thank you for contributing to the Legal Documents Generator project!
