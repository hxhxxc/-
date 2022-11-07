import controlP5.*;
import peasy.*;
import nervoussystem.obj.*;
  
PeasyCam cam;
ControlP5 bar;

float Radius1;
float Radius2;
float Radius3;
float Radius4;
float Radius5;
float Radius6;

float tall;
int sides;
float R;
float G;
float B;
boolean displayMesh = false;
boolean record;


void setup() {
  size(1000, 1000, P3D);
  background(0);
  cam = new PeasyCam(this, 2000);
  UI();
}


void draw() {
  background(0);
  lights();
  fill(255);
  
    if (displayMesh) {
    stroke(0);
  }

  fill(R,G,B); 

  lightSettings(); 

  if (record) {
    beginRecord("nervoussystem.obj.OBJExport", "designWork/curvatureVase-####.obj");
  }

  drawCylinder();

  if (record) {
    endRecord();
    record = false;
  }

  UIShow();
  }
  
  
void drawCylinder() {
  float angle = 0;
  float angleIncrement = TWO_PI /sides;
  float angle2=TWO_PI/sides;
     if (Radius1 != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, 0, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(Radius1 * cos(angle), 0, Radius1 * sin(angle));
      angle += angleIncrement;
    }
    endShape();
  }
    if (Radius6 != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, tall, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(Radius2 * cos(angle+angle2), tall,Radius2 * sin(angle+angle2));
      angle += angleIncrement;
    }
    endShape();
  }
  beginShape(TRIANGLE_STRIP);
   for (int i = 0; i < sides + 1; i++) {
    vertex(Radius2 * cos(angle+angle2), tall, Radius2 * sin(angle+angle2));
    vertex(Radius1 * cos(angle), 0, Radius1* sin(angle));
    
    angle += angleIncrement;
  }
  endShape();
  beginShape(TRIANGLE_STRIP);
   for (int i = 0; i < sides+ 1; i++) {
    vertex(Radius2 * cos(angle+angle2), tall, Radius2 * sin(angle+angle2));
    vertex(Radius3 * cos(angle), tall*2, Radius3* sin(angle));
    
    angle += angleIncrement;
  }
  endShape();
    beginShape(TRIANGLE_STRIP);
   for (int i = 0; i < sides + 1; i++) {
    vertex(Radius4 * cos(angle+angle2), tall*3, Radius4 * sin(angle+angle2));
    vertex(Radius3 * cos(angle), tall*2, Radius3* sin(angle));
    
    angle += angleIncrement;
  }
  endShape();
  beginShape(TRIANGLE_STRIP);
   for (int i = 0; i < sides + 1; i++) {
    vertex(Radius4 * cos(angle+angle2), tall*3, Radius4 * sin(angle+angle2));
    vertex(Radius5 * cos(angle), tall*4, Radius5* sin(angle));
    
    angle += angleIncrement;
  }
  endShape();
  beginShape(TRIANGLE_STRIP);
   for (int i = 0; i < sides + 1; i++) {
    vertex(Radius6 * cos(angle+angle2), tall*5, Radius6 * sin(angle+angle2));
    vertex(Radius5 * cos(angle), tall*4, Radius5* sin(angle));
    
    angle += angleIncrement;
  }
  endShape();
  if (Radius6 != 0) {
    angle = 0;
    beginShape(TRIANGLE_FAN);
    vertex(0, tall*5, 0);
    for (int i = 0; i < sides + 1; i++) {
      vertex(Radius6* cos(angle+angle2), tall*5, Radius6 * sin(angle+angle2));
      angle += angleIncrement;
    }
    endShape();
  }
}
void keyPressed() {
  if (key == 's') {
    record = true;
  }
}
