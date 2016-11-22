<h1 align="center">osc-smt-broadcaster</h1>
<h3 align="center"><a href="http://multitouch.com/g4-spec.html">PQLAB MTScreen</a> via OSC</h3>
<div align="center">
  <!-- License -->
  <a href="https://raw.githubusercontent.com/arnaudjuracek/xy/master/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square" alt="License" />
  </a>
</div>

## Installation

Either build the sources from `sketch/` or download the latest [release](https://github.com/chevalvert/osc-smt-broadcaster/releases).

## Usage

Launch the _.app_ then listen to the port `32000`. 
When a finger is detected, an OSC message is sent on `/touch`, with the following data structure :

|position|datatype|description|
|:-:|---|---|
|0|`int`|finger ID (usually between 0 and 6)|
|1|`float`|X position of the finger on the screen, in %|
|2|`float`|Y position of the finger on the screen, in %|

#### Example with Processing
```processing
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress serverLocation;

void setup() {
  oscP5 = new OscP5(this, 32000);
  serverLocation = new NetAddress("127.0.0.1", 12000);
}

public void oscEvent(OscMessage message) {
  if (message.checkAddrPattern("/touch")) {
    if (message.checkTypetag("iff")) {
      int id = message.get(0).intValue();
      float x = message.get(1).floatValue();
      float y = message.get(2).floatValue();

      println("new touch event :");
      println("touchID :" + id);
      println("x % :" + x);
      println("y % :" + y);
    }
  }
}
```

## Development
#### Requirements
- Processing <=2.2.1
- `vialab.SMT` lib (on the lib manager, or https://github.com/vialab/SMT)
- SMT drivers : http://multitouch.com/support-g4.html

#### Ressources

- https://github.com/vialab/SMT
- http://vialab.science.uoit.ca/smt/reference.php
- http://vialab.science.uoit.ca/smt/javadoc/

## License

[MIT](https://tldrlegal.com/license/mit-license).