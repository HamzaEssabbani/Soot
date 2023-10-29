//Ces deux fonctions sont utilisées pour permettre à l'utilisateur de contrôler l'enregistrement 
//de la sortie de l'application au format PDF, offrant ainsi une méthode simple pour capturer 
//les résultats de l'application dans un format de fichier portable.

void handlePDFRecording() {
  if (savePDF) {
    beginRecord(PDF, "saved_image-####.pdf");
  }
}

void finishPDFRecording() {
  if (savePDF) {
    endRecord();
    savePDF = false;
  }
}
