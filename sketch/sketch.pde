import vialab.SMT.*;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress address;

void setup() {
  size(50, 50, SMT.RENDERER);
  SMT.init(this, TouchSource.AUTOMATIC);

  oscP5 = new OscP5(this, 12000);
  address = new NetAddress("127.0.0.1", 32000);
}


void draw() {
  Touch[] touches = SMT.getTouches(); 
  if (touches.length > 0) {
    OscBundle bundle = new OscBundle();
    for (Touch t : touches) {
      OscMessage message = new OscMessage("/touch");
      message.add(t.cursorID);
      message.add(t.getRawX());
      message.add(t.getRawY());
      bundle.add(message);
    }
    bundle.setTimetag(bundle.now() + 10000);
    oscP5.send(bundle, address);
  }
}
