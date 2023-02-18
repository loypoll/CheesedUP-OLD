{
  "resourceType": "GMExtension",
  "resourceVersion": "1.2",
  "name": "fmod_gms",
  "androidactivityinject": "",
  "androidclassname": "",
  "androidcodeinjection": "",
  "androidinject": "",
  "androidmanifestinject": "",
  "androidPermissions": [],
  "androidProps": false,
  "androidsourcedir": "",
  "author": "",
  "classname": "",
  "copyToTargets": -1,
  "date": "2023-01-27T09:18:12.3699006-05:00",
  "description": "",
  "exportToGame": true,
  "extensionVersion": "0.0.1",
  "files": [
    {"resourceType":"GMExtensionFile","resourceVersion":"1.0","name":"","constants":[],"copyToTargets":3026418971067809998,"filename":"fmod-gamemaker.dll","final":"","functions":[
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_init","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_Init","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_destroy","argCount":0,"args":[],"documentation":"","externalName":"FMOD_Destroy","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_load","argCount":2,"args":[
            1,
            2,
          ],"documentation":"","externalName":"FMOD_Bank_Load","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_load","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Event_Load","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_update","argCount":0,"args":[],"documentation":"","externalName":"FMOD_Update","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_create_instance","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Event_CreateInstance","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_play","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Play","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_stop","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Stop","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_release","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Release","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_3d_attributes","argCount":3,"args":[
            2,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_Set3DAttributes","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_listener_attributes","argCount":3,"args":[
            2,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_SetListenerAttributes","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_num_listeners","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_SetNumListeners","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_parameter","argCount":4,"args":[
            2,
            1,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_parameter","argCount":2,"args":[
            2,
            1,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_set_parameter","argCount":3,"args":[
            1,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_SetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_get_parameter","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_GetParameter","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_paused","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetPaused","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_paused","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetPaused","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_paused_all","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetPaused_All","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_one_shot","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Event_OneShot","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_one_shot_3d","argCount":3,"args":[
            1,
            2,
            2,
          ],"documentation":"","externalName":"FMOD_Event_OneShot_3D","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_is_playing","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_IsPlaying","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_get_timeline_pos","argCount":1,"args":[
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_GetTimelinePosition","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_instance_set_timeline_pos","argCount":2,"args":[
            2,
            2,
          ],"documentation":"","externalName":"FMOD_EventInstance_SetTimelinePosition","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_bank_load_sample_data","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Bank_LoadSampleData","help":"","hidden":false,"kind":1,"returnType":2,},
        {"resourceType":"GMExtensionFunction","resourceVersion":"1.0","name":"fmod_event_get_length","argCount":1,"args":[
            1,
          ],"documentation":"","externalName":"FMOD_Event_GetLength","help":"","hidden":false,"kind":1,"returnType":2,},
      ],"init":"","kind":1,"order":[],"origname":"","ProxyFiles":[],"uncompress":false,"usesRunnerInterface":false,},
  ],
  "gradleinject": "",
  "hasConvertedCodeInjection": true,
  "helpfile": "",
  "IncludedResources": [],
  "installdir": "",
  "iosCocoaPodDependencies": "",
  "iosCocoaPods": "",
  "ioscodeinjection": "",
  "iosdelegatename": "",
  "iosplistinject": "",
  "iosProps": false,
  "iosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "license": "",
  "maccompilerflags": "",
  "maclinkerflags": "",
  "macsourcedir": "",
  "options": [],
  "optionsFile": "options.json",
  "packageId": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "productId": "",
  "sourcedir": "",
  "supportedTargets": -1,
  "tvosclassname": null,
  "tvosCocoaPodDependencies": "",
  "tvosCocoaPods": "",
  "tvoscodeinjection": "",
  "tvosdelegatename": null,
  "tvosmaccompilerflags": "",
  "tvosmaclinkerflags": "",
  "tvosplistinject": "",
  "tvosProps": false,
  "tvosSystemFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
}