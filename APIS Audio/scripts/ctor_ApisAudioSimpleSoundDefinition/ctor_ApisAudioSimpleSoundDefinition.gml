function ApisAudioSimpleSoundDefinition(_asset, _identifier = audio_get_name(_asset)) : ApisAudioSoundDefinition(_identifier) constructor {
    asset = _asset;
    
    static play_once = function(_settings = undefined) {
        var _audio_instance = audio_play_sound(asset, 1, false);
        return new ApisAudioSimpleSoundInstance(self, _audio_instance);
    }
    
    static play_loop = function(_settings = undefined) {
        var _audio_instance = audio_play_sound(asset, 1, true);
        return new ApisAudioSimpleSoundInstance(self, _audio_instance);
    }
}
