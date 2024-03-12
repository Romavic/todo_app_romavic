/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app_romavic/core/services/firebase/auth_firebase_services.dart';
import 'package:todo_app_romavic/core/services/firebase/auth_firebase_services_impl.dart';

class MockFirebaseAuth extends Mock implements AuthFirebaseServices {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late AuthFirebaseServicesImpl authService;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockGoogleSignInAccount mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication mockGoogleSignInAuth;
  late MockUserCredential mockUserCredential;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuth = MockGoogleSignInAuthentication();
    mockUserCredential = MockUserCredential();

    authService = AuthFirebaseServicesImpl(firebaseAuth: mockFirebaseAuth);
  });

  test('getLoginWithGoogle should sign in with Google', () async {
    // Arrange
    when(() => mockGoogleSignIn.signIn())
        .thenAnswer((_) async => mockGoogleSignInAccount);
    when(() => mockGoogleSignInAccount.authentication)
        .thenAnswer((_) async => mockGoogleSignInAuth);
    when(() => mockGoogleSignInAuth.accessToken).thenReturn('mockAccessToken');
    when(() => mockGoogleSignInAuth.idToken).thenReturn('mockIdToken');
    when(() => mockFirebaseAuth.signInWithCredential(any()))
        .thenAnswer((_) async => mockUserCredential);

    // Act
    final result = await authService.getLoginWithGoogle();

    // Assert
    verify(() => mockGoogleSignIn.signIn()).called(1);
    verify(() => mockFirebaseAuth.signInWithCredential(captureAny())).called(1);
    expect(result, equals(mockUserCredential));
  });

  // Add more tests as needed for other scenarios or methods.
}
*/
