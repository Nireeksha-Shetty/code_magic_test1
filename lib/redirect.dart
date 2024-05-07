import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

class LoginPage extends StatelessWidget {


  final FlutterAppAuth appAuth = FlutterAppAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _performLogin(context);
          },
          child: Text('Login with Identity Server'),
        ),
      ),
    );
  }

  Future<void> _performLogin(BuildContext context) async {
    try {
  final AuthorizationResponse? result = await appAuth.authorize(
  AuthorizationRequest(
    'MTM-ui-gateway-client', // Client ID
    'https://idp.reveal-dev.net/#/redirect', // Redirect URI
    discoveryUrl: 'https://idp.reveal-dev.net/.well-known/openid-configuration',
    scopes: <String>[
      'openid',
      'profile',
      'id.custom',
      'api.api1',
      'api.usermanagement',
      'api.membermanagement',
    ],
  ),
);

      // Handle the token response (e.g., store tokens, navigate to next screen)
      // _handleTokenResponse(result);
    } catch (e) {
      print('Authorization error: $e');
      // Handle authorization error
    }
  }

  // void _handleTokenResponse(AuthorizationTokenResponse response) {
  //   // Use the obtained tokens (e.g., access token) for authenticated requests
  //   String accessToken = response.accessToken;
  //   // Optionally, handle refresh token and other token properties
    
  //   // Navigate to the next screen or perform other actions upon successful authentication
  //   // For example:
  //   // Navigator.pushReplacementNamed(context, '/home');
  // }
}
