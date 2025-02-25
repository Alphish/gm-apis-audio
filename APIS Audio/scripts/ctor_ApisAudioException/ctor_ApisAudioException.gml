function ApisAudioException(_code, _description) constructor {
    code = _code;
    description = _description;
    
    toString = function() {
        return description;
    }
}

// -------------------
// Creating exceptions
// -------------------

ApisAudioException.system_not_found = function() {
    return new ApisAudioException(
        $"apis_audio_system_not_found",
        $"Cannot use the APIS Audio functionality without an active APIS Audio system instance."
        );
}

ApisAudioException.system_duplicate = function() {
    return new ApisAudioException(
        $"apis_audio_system_duplicate",
        $"Cannot create another instance of APIS Audio system. Only one instance of APIS Audio system can exist at a time."
        );
}

ApisAudioException.method_not_implemented = function(_caller, _method) {
    return new ApisAudioException(
        $"apis_audio_method_not_implemented",
        $"{instanceof(_caller)}.{_method} is not implemented."
        );
}

ApisAudioException.invalid_channel_identifier = function(_identifier) {
    return new ApisAudioException(
        $"apis_audio_invalid_channel_identifier",
        $"The {typeof(_identifier)} identifier '{_identifier}' cannot be used as a channel identifier."
        );
}

ApisAudioException.duplicate_channel_identifier = function(_channel, _identifier) {
    return new ApisAudioException(
        $"apis_audio_duplicate_channel_identifier",
        $"Cannot register {instanceof(_channel)} with '{_identifier}' identifier; another channel already uses it."
        );
}

ApisAudioException.unknown_channel = function(_identifier) {
    return new ApisAudioException(
        $"apis_audio_unknown_channel",
        $"Could not find a channel with '{_identifier}' identifier."
        );
}

ApisAudioException.invalid_sound_identifier = function(_identifier) {
    return new ApisAudioException(
        $"apis_audio_invalid_sound_identifier",
        $"The {typeof(_identifier)} identifier '{_identifier}' cannot be used as a sound definition identifier."
        );
}

ApisAudioException.duplicate_sound_identifier = function(_sound, _identifier) {
    return new ApisAudioException(
        $"apis_audio_duplicate_sound_identifier",
        $"Cannot register {instanceof(_sound)} with '{_identifier}' identifier; another sound definition already uses it."
        );
}

ApisAudioException.duplicate_sound_asset = function(_sound, _asset) {
    return new ApisAudioException(
        $"apis_audio_duplicate_sound_asset",
        $"Cannot register {instanceof(_sound)} with {audio_get_name(_asset)} sound asset; another sound definition already uses it."
        );
}

ApisAudioException.unknown_sound_definition = function(_identifier) {
    return new ApisAudioException(
        $"apis_audio_unknown_sound_definition",
        $"Could not find a sound definition with '{_identifier}' identifier."
        );
}
