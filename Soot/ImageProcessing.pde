//ce bloc de code permet de parcourir l'image, d'analyser chaque pixel en fonction de ses voisins, 
//de calculer les gradients, l'angle, la magnitude des gradients, et de décider si une ligne doit être dessinée en fonction de ces propriétés.

void analyzeImageAndDrawLines() {
  for (int x = steps * 2; x < width - steps; x += steps) {
    for (int y = steps * 2; y < height - steps; y += steps) {
      analyzePixel(x, y);
    }
  }
}

void analyzePixel(int x, int y) {
  int idx = calculateIndex(x, y);
  
  if (idx < 0 || idx >= img.pixels.length) {
    return;
  }

  float[] brightnesses = calculateBrightnessValues(idx);
  float[] gradients = calculateGradients(brightnesses);
  float angle = calculateAngle(gradients);
  float magnitudeSq = calculateMagnitudeSq(gradients);
  float adaptiveStep = calculateAdaptiveStep(magnitudeSq);
  float strokeW = calculateStrokeWidth(magnitudeSq);

  if (magnitudeSq > threshold) {
    drawLine(x, y, angle, adaptiveStep, strokeW);
  }
}

int calculateIndex(int x, int y) {
  return y * img.width + x;
}

float[] calculateBrightnessValues(int idx) {
  float bLeft = getPixelBrightness(idx - steps);
  float bRight = getPixelBrightness(idx + steps);
  float bUp = getPixelBrightness(idx - img.width * steps);
  float bDown = getPixelBrightness(idx + img.width * steps);
  
  return new float[] {bLeft, bRight, bUp, bDown};
}
