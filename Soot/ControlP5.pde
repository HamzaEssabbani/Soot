void setupControlP5() {
  cp5 = new ControlP5(this); // Initialise la bibliothèque ControlP5 avec l'objet courant (généralement la classe principale).

  // Ajoute un curseur ("slider") pour régler la densité des opérations sur l'image.
  cp5.addSlider("Density")
     .setPosition(20, 20) // Position du curseur sur l'interface graphique.
     .setRange(1, 10) // Plage de valeurs possibles (de 1 à 10).
     .setValue(steps); // Définit la valeur initiale à partir de la variable "steps".

  // Ajoute un curseur pour régler le seuil pour le traitement de l'image.
  cp5.addSlider("threshold")
     .setPosition(20, 60)
     .setRange(0, 255) // Plage de valeurs de 0 à 255.
     .setValue(threshold); // Définit la valeur initiale à partir de la variable "threshold".

  // Ajoute un curseur pour régler la taille des lignes dessinées sur l'image.
  cp5.addSlider("Line Size")
     .setPosition(20, 100)
     .setRange(1, 9) // Plage de valeurs de 1 à 9.
     .setValue(offset); // Définit la valeur initiale à partir de la variable "offset".
}
