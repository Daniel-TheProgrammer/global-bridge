# GlobalBridge

A Digital Service Concierge.

## Stack

- Flutter 3.38+
- BLoC (`flutter_bloc`)
- Clean Architecture (data/domain/presentation)
- Dependency Injection (`get_it`)
- Functional error handling (`dartz`)
- Testing (`flutter_test`, `bloc_test`, `mocktail`)
- Strict linting (`very_good_analysis`)
- Git hooks (`lefthook`) with security checks

## Project Structure

```text
lib/
  main.dart
  src/
    app/
      app.dart
    core/
      di/
      error/
      usecase/
    features/
      health/
        data/
          datasources/
          repositories/
        domain/
          entities/
          repositories/
          usecases/
        presentation/
          bloc/
          pages/
```

## Setup

1. Install Flutter and verify:
   ```bash
   flutter doctor
   ```
2. Get dependencies:
   ```bash
   flutter pub get
   ```
3. (Recommended) Install `lefthook`:
   ```bash
   brew install lefthook
   ```
4. Install git hooks in this repository:
   ```bash
   lefthook install
   ```

## Run

```bash
flutter run
```

## Quality Gates

Run these before pushing:

```bash
dart format --set-exit-if-changed lib test
flutter analyze
flutter test --coverage
sh tool/security/secret_scan.sh
```

### Lefthook commands

- `pre-commit`: format, analyze, tests, secret scan
- `pre-push`: tests with coverage

## Testing

Included test baseline:

- Domain use-case unit test
- BLoC state transition test
- Widget-level app smoke test

Run all tests:

```bash
flutter test
```

## CI

GitHub Actions workflow at `.github/workflows/ci.yml` runs:

- formatting checks
- static analysis
- full tests with coverage

## Extend This Architecture

To add a new feature:

1. Create `data/domain/presentation` folders under `lib/src/features/<feature>`.
2. Add repository contract in `domain`.
3. Implement repository in `data`.
4. Add use case(s) in `domain/usecases`.
5. Add BLoC + UI in `presentation`.
6. Register dependencies in `lib/src/core/di/injection_container.dart`.
7. Add unit/BLoC/widget tests.
