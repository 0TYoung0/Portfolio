console.log("Starting Program");
var xenobackground;
var CrazyInLove, JeykllandHyde, FeelInvinceible;
var amplitude;
function preload(){
  soundFormats('mp3', 'ogg'); // Setting sound formats to mp3
  // Images
  xenobackground = loadImage("../XENOIMAGES/WorldBGround2.jpg"); // Main Screen Background Image
  // Songs
  CrazyInLove = loadSound('../XENOMUSIC/CrazyInLove-J2.mp3');
  FeelInvinceible = loadSound('../XENOMUSIC/FeelInvincible-Skillet.mp3');
  JeykllandHyde = loadSound('../XENOMUSIC/JeykllAndHyde-JonathanThulin.mp3');

}

function setup(){
  //BASE SETUPS
  createCanvas(displayWidth, displayHeight);
  tint(275,113);
  xenobackground.resize(displayWidth, displayHeight);
  //TYPOGRAPHY
  textAlign(CENTER);
  //MUSIC
  amplitude = new p5.Amplitude();   //Amplitude for Music
  fft = new p5.FFT();   //Variable for music spectrum
  CrazyInLove.loop();
}

function draw(){
  //Xeno Draw Variables
  var fps = frameRate(); // Setting the framerate as FPS
  fps = int(fps); // Sets FPS as an INT
  background(xenobackground); // Sets xenobackground as the homepage background


  //MUSIC
  var spectrum = fft.analyze();
    noStroke();
    fill(0,255,0); // spectrum is green
    /*for (var i = 0; i< spectrum.length; i++){
      var x = map(i, 0, spectrum.length, 0, width);
      var h = -height + map(spectrum[i], 0, 255, height, 0);
      rect(x, height, width / spectrum.length, h );
    }*/
    var waveform = fft.waveform();
    noFill();
    beginShape();
    stroke(random(255),random(255),random(255));
    strokeWeight(1);
    for (var i = 0; i< waveform.length; i++){
      var x = map(i, 0, waveform.length, 0, width);
      var y = map( waveform[i], -1, 1, 0, height);
      vertex(x,y);
    }
    endShape();


  // Xeno Description on Homepage
  fill(255); // Set Xeno to White
  textSize(30); // Set Xeno Text Size to 30
  text("Xeno ", width/2, height/2 ); //Put "Xeno" in the middle of the screen
  textSize(18); // Set Description Text Size to White
  text("This program will demonstrate basic JavaScript  applications, and be used as a learning tool", width/2, (height/2)+150); // Xeno Description
  textSize(18); // Set Basic Information Text Size to 18
  text("Date: "+month()+"/"+day()+" "+year(), 75, 50); // Date
  text("Time: "+hour()+":"+minute()+":"+second(), 75, 75); // Time
  //text("Current FPS: "+fps+"", 70, 100); // FPS

}

function windowResized() {
  resizeCanvas(displayWidth, displayHeight);
  xenobackground.resize(displayWidth, displayHeight);
}