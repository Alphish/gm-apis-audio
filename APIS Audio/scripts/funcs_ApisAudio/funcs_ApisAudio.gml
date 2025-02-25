// ------
// System
// ------

function apis_audio_get_system() {
    if (!instance_exists(sys_ApisAudio))
        throw ApisAudioException.system_not_found();
    
    return sys_ApisAudio.id;
}

// --------
// Registry
// --------

function apis_audio_register_channel(_channel, _identifier) {
    var _system = apis_audio_get_system();
    if (is_string(_identifier))
        _system.registry.register_channel_identifier(_channel, _identifier)
    else
        throw ApisAudioException.invalid_channel_identifier(_identifier);
}

function apis_audio_get_channel(_identifier) {
    var _registry = apis_audio_get_system().registry;
    return _registry.get_channel(_identifier);
}

function apis_audio_register_sound_definition(_sound, _identifier) {
    var _system = apis_audio_get_system();
    if (is_string(_identifier))
        _system.registry.register_sound_identifier(_sound, _identifier)
    else if (audio_exists(_identifier))
        _system.registry.register_sound_asset(_sound, _identifier);
    else
        throw ApisAudioException.invalid_sound_identifier(_identifier);
}

function apis_audio_get_sound_definition(_identifier) {
    var _registry = apis_audio_get_system().registry;
    return _registry.get_sound_definition(_identifier);
}