import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;

PImage img; // Déclare une variable pour stocker une image
int steps = 10; // Le nombre d'étapes utilisé pour l'analyse de l'image
float threshold = 0; // Seuil pour l'analyse de l'image
float offset = 6; // Décalage utilisé dans l'analyse de l'image
boolean savePDF = false; // Un indicateur pour savoir si l'utilisateur veut enregistrer la sortie en PDF

void setup() {
  size(1206, 2250); // Définit la taille de la fenêtre de l'application
  img = loadImage("MonImage.png"); // Charge une image depuis le fichier "MonImage.png"
  noFill(); // Désactive le remplissage des formes dessinées
  setupControlP5(); // Initialise l'interface utilisateur graphique
}

void draw() {
  handlePDFRecording(); // Gère l'enregistrement PDF (à l'intérieur de la fonction draw pour être mis à jour à chaque image)
  background(255); // Remplit l'arrière-plan avec la couleur blanche
  analyzeImageAndDrawLines(); // Analyse l'image et dessine des lignes en fonction des paramètres
  finishPDFRecording(); // Finalise l'enregistrement PDF
}

void keyPressed() {
  if (key == ' ') {
    savePDF = true; // Si la touche espace est enfoncée, active l'enregistrement PDF
    redraw(); // Redessine l'image pour inclure les changements liés à l'enregistrement PDF
  }
}
