//ces fonctions permettent de dessiner des lignes sur une image en utilisant des étapes 
//et des épaisseurs de trait adaptatives en fonction de la magnitude des gradients, 
//ce qui peut être utile dans des applications de traitement d'images, notamment pour 
//la détection de contours ou d'autres caractéristiques visuelles.

float calculateAdaptiveStep(float magnitudeSq) {
  float step = constrain(steps / sqrt(magnitudeSq), 0, 10);
  return step;
}
float calculateStrokeWidth(float magnitudeSq) {
  float strokeW = sqrt(map(magnitudeSq, 0, 255 * 255 * 2, 0, 255));
  strokeW = min(strokeW, 3);
  strokeW = max(strokeW, 0.5);
  return strokeW;
}

void drawLine(int x, int y, float angle, float adaptiveStep, float strokeW) {
  stroke(strokeW);
  strokeWeight(strokeW);
  line(x + offset * cos(angle), y + offset * sin(angle), x + adaptiveStep * cos(angle), y + adaptiveStep * sin(angle));
}
