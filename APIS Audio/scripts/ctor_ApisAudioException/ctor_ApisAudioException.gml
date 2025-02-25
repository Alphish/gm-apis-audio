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
        $"apis_audio_not_implemented",
        $"{instanceof(_caller)}.{_method} is not implemented."
        );
}
