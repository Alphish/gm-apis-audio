ApisAudioSingleLoopChannel.define("BGM", /* volume */ 10);

ApisAudioMultiSoundChannel.define("SFX", /* volume */ 10);

ApisAudioVariableSoundDefinition.define("any_sfx", [sfx_Test1, sfx_Test2, sfx_Test3]);
ApisAudioVariableSoundDefinition.define("vary_pitch", sfx_Test3, { pitch_variation: 1.25 });
