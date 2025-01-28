class InitialSettingsModel {
  String? appName;
  String? fcmKey;
  String? defaultTheme;
  LightTheme? lightTheme;
  DarkTheme? darkTheme;
  String? googleMapsKey;
  String? mobileLanguage;
  String? appVersion;
  String? enableVersion;
  String? fontFamily;
  String? defaultEnvKey;
  int? applicationTypeId;
  Env? env;

  InitialSettingsModel(
      {this.appName,
        this.fcmKey,
        this.defaultTheme,
        this.lightTheme,
        this.darkTheme,
        this.googleMapsKey,
        this.mobileLanguage,
        this.appVersion,
        this.enableVersion,
        this.fontFamily,
        this.defaultEnvKey,
        this.applicationTypeId,
        this.env});

  InitialSettingsModel.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'];
    fcmKey = json['fcm_key'];
    defaultTheme = json['default_theme'];
    lightTheme = json['light_theme'] != null
        ? LightTheme.fromJson(json['light_theme'])
        : null;
    darkTheme = json['dark_theme'] != null
        ? DarkTheme.fromJson(json['dark_theme'])
        : null;
    googleMapsKey = json['google_maps_key'];
    mobileLanguage = json['mobile_language'];
    appVersion = json['app_version'];
    enableVersion = json['enable_version'];
    fontFamily = json['font_family'];
    defaultEnvKey = json['default_env_key'];
    env = json['env'] != null ? Env.fromJson(json['env']) : null;
    applicationTypeId = json['application_type_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['app_name'] = appName;
    data['fcm_key'] = fcmKey;
    data['default_theme'] = defaultTheme;
    if (lightTheme != null) {
      data['light_theme'] = lightTheme!.toJson();
    }
    if (darkTheme != null) {
      data['dark_theme'] = darkTheme!.toJson();
    }
    data['google_maps_key'] = googleMapsKey;
    data['mobile_language'] = mobileLanguage;
    data['app_version'] = appVersion;
    data['enable_version'] = enableVersion;
    data['font_family'] = fontFamily;
    data['default_env_key'] = defaultEnvKey;
    if (env != null) {
      data['env'] = env!.toJson();
    }
    data['application_type_id'] = applicationTypeId;
    return data;
  }
}

 class LightTheme {
  String? primaryColor;
  String? primaryDarkColor;
  String? accentColor;
  String? accentDarkColor;
  String? scaffoldColor;
  String? textColor;
  String? hintColor;

  LightTheme(
      {this.primaryColor,
        this.primaryDarkColor,
        this.accentColor,
        this.accentDarkColor,
        this.scaffoldColor,
        this.textColor,
        this.hintColor});

  LightTheme.fromJson(Map<String, dynamic> json) {
    primaryColor = json['primary_color'];
    primaryDarkColor = json['primary_dark_color'];
    accentColor = json['accent_color'];
    accentDarkColor = json['accent_dark_color'];
    scaffoldColor = json['scaffold_color'];
    textColor = json['text_color'];
    hintColor = json['hint_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primary_color'] = primaryColor;
    data['primary_dark_color'] = primaryDarkColor;
    data['accent_color'] = accentColor;
    data['accent_dark_color'] = accentDarkColor;
    data['scaffold_color'] = scaffoldColor;
    data['text_color'] = textColor;
    data['hint_color'] = hintColor;
    return data;
  }
}

 class DarkTheme {
  String? primaryColor;
  String? primaryDarkColor;
  String? accentColor;
  String? accentDarkColor;
  String? scaffoldDarkColor;
  String? scaffoldColor;
  String? textColor;
  String? hintColor;

  DarkTheme(
      {this.primaryColor,
        this.primaryDarkColor,
        this.accentColor,
        this.accentDarkColor,
        this.scaffoldDarkColor,
        this.scaffoldColor,
        this.textColor,
        this.hintColor});

  DarkTheme.fromJson(Map<String, dynamic> json) {
    primaryColor = json['primary_color'];
    primaryDarkColor = json['primary_dark_color'];
    accentColor = json['accent_color'];
    accentDarkColor = json['accent_dark_color'];
    scaffoldDarkColor = json['scaffold_dark_color'];
    scaffoldColor = json['scaffold_color'];
    textColor = json['text_color'];
    hintColor = json['hint_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['primary_color'] = primaryColor;
    data['primary_dark_color'] = primaryDarkColor;
    data['accent_color'] = accentColor;
    data['accent_dark_color'] = accentDarkColor;
    data['scaffold_dark_color'] = scaffoldDarkColor;
    data['scaffold_color'] = scaffoldColor;
    data['text_color'] = textColor;
    data['hint_color'] = hintColor;
    return data;
  }
}

 class Env {
  Dev1? dev1;
  Dev1? dev2;
  Dev1? demo;

  Env({this.dev1, this.dev2, this.demo});

  Env.fromJson(Map<String, dynamic> json) {
    dev1 = json['dev1'] != null ? Dev1.fromJson(json['dev1']) : null;
    dev2 = json['dev2'] != null ? Dev1.fromJson(json['dev2']) : null;
    demo = json['demo'] != null ? Dev1.fromJson(json['demo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dev1 != null) {
      data['dev1'] = dev1!.toJson();
    }
    if (dev2 != null) {
      data['dev2'] = dev2!.toJson();
    }
    if (demo != null) {
      data['demo'] = demo!.toJson();
    }
    return data;
  }
}

 class Dev1 {
  String? baseUrl;
  String? apiKey;

  Dev1({this.baseUrl, this.apiKey});

  Dev1.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    apiKey = json['api_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_url'] = baseUrl;
    data['api_key'] = apiKey;
    return data;
  }
}