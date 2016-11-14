# Button (Information button)

Infobuttons can be used to open html files in the system's default web browser. When clicked, the file passed to the file() identifier will be opened, if it is a valid file. This widget can be useful for providing help files or any other additional information about your instruments. 

```csharp
infobutton bounds(x, y, width, height), text("name"), \
colour("colour"), fontcolour("colour") file("file name"), \
identchannel("chan"), alpha(val), visible(val), \
rotate(radians, pivotx, pivoty), widgetarray("chan", number), \
popuptext("text"), active(val), svgfile("type", "file")
```
<!--(End of syntax)/-->

## Identifiers
**bounds(x, y, width, height)** integer values that set position and size on screen(in pixels)

**text("name")** "name" will be the text that appears on the top of the info button.  

**colour("colour")** This sets the colour of the button. infobuttons only have a single state, therefore they don't need a unique on and off colour. Any CSS or HTML colour string can be passed to this identifier. The colour identifier can also be passed an RBG, or RGBA value. All channel values must be between 0 and 255. For instance colour(0, 0, 255) will create a blue, while colour(0, 255, 0, 255) will create a green with an alpha channel set to full.  

**fontcolour("colour")** Sets the colour of the text that appears with the slider. See above for details on valid colours. .

**file("file name")** Sets the file that will be opened when a user clicks on the button. For convenience, the file passed to the file() identifier should reside in the same directory as the current .csd file. If not you will need to provide a full path to the requested file.  

**identchannel("channel")** Sets the channel which messages from Csound are sent to the widget on. When used with a chnset opcode users can override widget attributes. See [Identifier channels](./identchannels.md) 

**alpha(val)** A value between 0 and 1 will set the alpha blend value for the entire component. Can be useful if you need to fade widgets in and out. 

**visible(val)** A value of 0 will cause the widget to become invisible. Widgets have their visibility set to 1 by default. 

**rotate(radians, pivotx, pivoty)** Rotates the widget by a number of radians(2xPI=full rotation). pivotx and pivoty will determine the rotation pivot points, where 0, 0 represents the component's top-left position. 

**widgetarray("chan", number)** Creates an number of widgets in a single pass. See [Widget arrays](./widget_arrays.md)

**popuptext("text")** Displays a popup text box when a user hovers over the widget.

**active(val)** Will deactivate a control if 0 is passed. Controls which are deactivate can still be updated from Csound.

**svgfile("type", "file")** Use this identifier to set a unique .svg file to use instead of the default look and feel. "type" should be one of the following:

- "on" : sets the button image when it is on
- "off" : sets the button image when it is off

For more information see [Using SVGs](./using_svgs.md)

<!--(End of identifiers)/-->

##Example
```csharp
<Cabbage>
form size(400, 500), caption("Untitled"), pluginID("plu1"), colour(39, 40, 34)
button bounds(20, 16, 100, 30), channel("button"),  text("Push me"), fontcolour("white")
infobutton bounds(120, 16, 100, 30), channel("button"),  file("README.txt"), text("Info")
filebutton bounds(220, 16, 100, 30), channel("button"),  populate("*.wav", ""), text("Browse")
</Cabbage>
```

![](images/buttonExample.png)