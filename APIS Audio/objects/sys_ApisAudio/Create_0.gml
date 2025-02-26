auto_register ??= ApisAudioNoAutoRegistration;
var _autoregister = new auto_register();
registry = new ApisAudioRegistry().with_auto_register(_autoregister);
