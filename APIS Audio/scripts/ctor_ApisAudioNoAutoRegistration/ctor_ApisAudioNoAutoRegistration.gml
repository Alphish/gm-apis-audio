function ApisAudioNoAutoRegistration() : ApisAudioAssetAutoRegistration() constructor {
    static register_asset = function(_asset) {
        throw ApisAudioException.invalid_sound_identifier(_asset);
    }
}
