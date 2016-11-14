# Macros and Reserved Channels
Cabbage specific macros can be used to define a range of difference identifiers, a provide tidy way of achieving a consistent look and feel across your instrument's widgets without having to hard code each and every one of a widget's identifiers. To create a macro one must define it using a #define keyword. The following code will create a macro called SLIDER1 that will define several attributes of a slider widget:

```csharp
#define SLIDER1 colour("red"), fontcolour("yellow"), outlinecolour("red"), range(0, 1000, 500)
```
The macro can then be used anywhere else in your Cabbage code by placing it on an appropriate line of Cabbage code. For example, the following code uses the above macro with an rslider.

```csharp
rslider bounds(39, 12, 50, 50), channel("rslider"), $SLIDER1
```
You can override any identifiers contained in a macro by placing them in front of the macro name. The following code will override the colour identifier from the macro with a new colour.

```csharp
rslider bounds(39, 12, 50, 50), channel("rslider"), colour("purple"), $SLIDER1
```

You can use as many macros as you wish in your Cabbage code. 

### Accessing Cabbage macros in Csound code
Macros defined in the Cabbage section of your code can also be accessed in the Csound section using the same syntax. For example, a macro named SLIDER1 is defined in the Cabbage section as:  

```csharp
#define SLIDER1 colour("red"), fontcolour("yellow"), outlinecolour("red"), range(0, 1000, 500)
``` 

It can then accessed in the Csound orchestra like this:

```csharp
prints $SLIDER1
```

> Note that macros passed from the Cabbage section to the Csound orchestra are string macros. Therefore you will need to convert to a number if you wish to pass numbered macros between Cabbage and the Csound orchestra.   


### Cabbage Csound Macros 
The following are Csound macros that are set by Cabbage when it first loads. Thee macros are accessed in Csound in the very same way that regular instrument macros are. Note however that each of these macros returns a string value. Therefore you may need to convert them to a number using the strtod opcode.  

**IS_A_PLUGIN** Defined if the instrument is running as a plugin

**SCREEN_WIDTH** Provides the instrument width in pixels as a string value. Use strtod to convert from string to number. On Android devices this will return the actual screen width. This can be useful if you wish to move widgets around in realtime using [Identifier channels](./identchannels.md).  

**SCREEN_HEIGHT** Provides the instrument height in pixels as a string value. Use strtod to convert from string to number. On Android devices this will return the actual screen height. This can be useful if you wish to move widgets around in realtime using [Identifier channels](./identchannels.md).  

**IS_ANDROID** Defined only if the instrument is being launched on an Android device. 


## Reserved Channels

Cabbage reserves several channels which are used to send information to Csound from either the host application, or from Cabbage itself. To retrieve info from any of these channels just use a chnget opcode.

**CSD_PATH** This string channel will retrieve the full path to the current csd file.

**HOST_BPM** Retrieve the currents host bpm. This will be updated whenever the host BPM changes.

**IS_PLAYING** Pressing play on the host transport dialogue will cause this channel to send a 1. Hitting stop will send a 0.

**IS_RECORDING** As above only for monitoring the record status of a session.

**TIME_IN_SECONDS** Return the current time in seconds from the start of the track.

**TIME_IN_SAMPLES** Return the current time in samples from the start of the track.

**TIME_SIG_DENOM** The signature denominator, e.g. the 4 of a 3/4 time sig 

**TIME_SIG_NUM** The signature numerator, e.g. the 3 of a 3/4 time sig 

**HOST_PPQ_POS** Return the position of the start of the last bar, in pulses-per-quarter-note.

**MOUSE_X** Returns the X coordinate of the current mouse position.

**MOUSE_Y** Returns the Y coordinate of the current mouse position

**MOUSE_DOWN_LEFT** Returns the current state of the left most mouse button; 1 if pressed, and 0 if not. 

**MOUSE_DOWN_MIDDLE** Returns the current state of the middle mouse button; 1 if pressed, and 0 if not. 

**MOUSE_DOWN_RIGHT** Returns the current state of the right mouse button; 1 if pressed, and 0 if not. 

**IS_A_PLUGIN** Returns 1 if the instrument is running as an audio plugin, and 0 if the instrument is running as a standalone. 

