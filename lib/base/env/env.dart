const bool kIsDemo = bool.fromEnvironment('IS_DEMO', defaultValue: false);
const String kApiUrl = String.fromEnvironment('API_URL',
    defaultValue: 'https://cat-fact.herokuapp.com');
