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

// --------
// Playback
// --------

function apis_audio_play_on(_channel, _sound, _settings = undefined) {
    var _resolved_channel = apis_audio_get_channel(_channel);
    var _resolved_sound = apis_audio_get_sound_definition(_sound);
    _resolved_channel.play(_resolved_sound, _settings);
}

function apis_audio_get_volume(_channel) {
    return apis_audio_get_channel(_channel).get_volume();
}

function apis_audio_set_volume(_channel, _volume) {
    return apis_audio_get_channel(_channel).set_volume(_volume);
}

function apis_audio_change_volume(_channel, _amount) {
    var _resolved_channel = apis_audio_get_channel(_channel);
    var _current_volume = _resolved_channel.get_volume();
    _resolved_channel.set_volume(_current_volume + _amount);
}

function apis_audio_mute(_channel) {
    apis_audio_get_channel(_channel).mute();
}

function apis_audio_unmute(_channel) {
    apis_audio_get_channel(_channel).unmute();
}

function apis_audio_toggle_mute(_channel) {
    apis_audio_get_channel(_channel).toggle_mute();
}
