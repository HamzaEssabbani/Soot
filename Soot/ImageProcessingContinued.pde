//Ces fonctions sont destinées au traitement d'images. 
//Elles effectuent les opérations suivantes :

//getPixelBrightness(int idx): Cette fonction renvoie la luminosité d'un pixel 
//à l'indice idx d'une image après avoir vérifié que l'indice est valide.
//calculateGradients(float[] brightnesses): Elle prend un tableau de valeurs 
//de luminosité et calcule les gradients en X et en Y à partir de ces valeurs.
//calculateGradient(float brightness1, float brightness2): Cette fonction calcule 
//un gradient en soustrayant une valeur de luminosité d'un autre.
//calculateAngle(float[] gradients): Elle calcule l'angle en radians à partir des gradients en X et en Y et le décale de π/2.
//calculateMagnitudeSq(float[] gradients): Cette fonction calcule le carré de la magnitude 
//des gradients en X et en Y. Ensemble, ces fonctions peuvent être utilisées pour analyser des images,
//détecter des contours, ou déterminer des orientations.

float getPixelBrightness(int idx) {
  if (idx < 0) {
    idx = 0;
  } else if (idx >= img.pixels.length) {
    idx = img.pixels.length - 1;
  }

  return brightness(img.pixels[idx]);
}

float[] calculateGradients(float[] brightnesses) {
  float gradientX = calculateGradient(brightnesses[0], brightnesses[1]);
  float gradientY = calculateGradient(brightnesses[2], brightnesses[3]);
  
  return new float[] {gradientX, gradientY};
}

float calculateGradient(float brightness1, float brightness2) {
  return brightness1 - brightness2;
}

float calculateAngle(float[] gradients) {
  return atan2(gradients[1], gradients[0]) + PI/2;
}

float calculateMagnitudeSq(float[] gradients) {
  return gradients[0] * gradients[0] + gradients[1] * gradients[1];
}
