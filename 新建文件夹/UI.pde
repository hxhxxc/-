import processing.pdf.*;
import processing.dxf.*;
import processing.dxf.*;

int canvasLeftCornerX = 30;
int canvasLeftCornerY = 60;

void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));

  int barSize = 100;
  int barHeight = 20;
  int barInterval = barHeight + 10;

  bar.addSlider("Radius1", 10, 1000,50, canvasLeftCornerX, canvasLeftCornerY, barSize, barHeight).setLabel("距离1");
  bar.addSlider("Radius2", 10, 1000,50, canvasLeftCornerX, canvasLeftCornerY+barInterval, barSize, barHeight).setLabel("距离2");
  bar.addSlider("Radius3", 10, 1000,50, canvasLeftCornerX, canvasLeftCornerY+barInterval*2, barSize, barHeight).setLabel("距离3");
  bar.addSlider("Radius4", 10, 1000,50, canvasLeftCornerX, canvasLeftCornerY+barInterval*3, barSize, barHeight).setLabel("距离4");
  bar.addSlider("Radius5", 10, 1000,50, canvasLeftCornerX, canvasLeftCornerY+barInterval*4, barSize, barHeight).setLabel("距离5");
  bar.addSlider("Radius6", 10, 1000,50, canvasLeftCornerX, canvasLeftCornerY+barInterval*5, barSize, barHeight).setLabel("距离6");

  bar.addSlider("tall", 10, 1000, 500, canvasLeftCornerX, canvasLeftCornerY+barInterval*7, barSize, barHeight).setLabel("高度");
  bar.addSlider("sides", 3, 100, 5, canvasLeftCornerX, canvasLeftCornerY+barInterval*8, barSize, barHeight).setLabel("面数");
  bar.addSlider("R", 0, 255, 155, canvasLeftCornerX, canvasLeftCornerY+barInterval*10, barSize, barHeight).setLabel("R");
  bar.addSlider("G", 0, 255, 155, canvasLeftCornerX, canvasLeftCornerY+barInterval*11, barSize, barHeight).setLabel("G");
  bar.addSlider("B", 0, 255, 155, canvasLeftCornerX, canvasLeftCornerY+barInterval*12, barSize, barHeight).setLabel("B");

  bar.setAutoDraw(false);
}

void lightSettings() {
  lightSpecular(255, 255, 255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);
  specular(200, 200, 200);
  shininess(15);
}

void UIShow() {
  cam.beginHUD();  
  lights();
  bar.draw();
  cam.endHUD();

  if (mouseX<400 && mouseY< height) {
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}
