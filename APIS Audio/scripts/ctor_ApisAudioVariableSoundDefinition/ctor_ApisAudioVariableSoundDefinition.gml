function ApisAudioVariableSoundDefinition(_identifier, _asset, _config = undefined) : ApisAudioSoundDefinition(_identifier) constructor {
    assets = is_array(_asset) ? _asset : [_asset];
    
    _config ??= {};
    pitch_variation = _config[$ "pitch_variation"] ?? 1;
    
    static play_once = function(_settings = undefined) {
        var _idx = irandom(array_length(assets) - 1);
        var _audio_instance = audio_play_sound(assets[_idx], 1, false);
        
        if (pitch_variation > 1) {
            var _pitch = random_range(1 / pitch_variation, pitch_variation);
            audio_sound_pitch(_audio_instance, _pitch);
        }
        
        return new ApisAudioSimpleSoundInstance(self, _audio_instance);
    }
    
    static play_loop = function(_settings = undefined) {
        throw ApisAudioException.method_not_supported(self, nameof(play_loop));
    }
}

ApisAudioVariableSoundDefinition.define = function(_identifier, _asset, _config) {
    var _sound = new ApisAudioVariableSoundDefinition(_identifier, _asset, _config);
    apis_audio_register_sound_definition(_sound, _identifier);
    return _sound;
}
