
// Theta Setup
var theta;
var theta_velocity;
var theta_acceleration;
var radius;

function setup() {
  createCanvas(windowWidth, windowHeight);
  //createCanvas(windowWidth, windowHeight, WEBGL);
  background(0);
  
  // Initialize all values
  radius = height * 0.45;
  theta = 0;
  theta_velocity = 0;
  theta_acceleration = 0.00001;
}

function draw() {
  // Basis
  //background(0);  
  // Typography
  textSize(32)
  fill(0, 0, 255);

  textAlign(CENTER);
  text("The Tyler Curve", windowWidth/2, 40);
  translate(width/2, height/2);
  
  // Random Colors
  var rr = random(255);
  var rg = random(255);
  var rb = random(255);
  
  // Converting Polar to Cartesian
  var x = radius * sin(theta)*cos(8*theta);
  var y = radius * cos(theta)*cos(8*theta);
  
  // Making the Orb
  ellipseMode(CENTER);
  stroke(255, 0, 255);
  fill(rr, 0, 0);
  ellipse(x, y, 32, 32);
  
  // Theta Acceleration
  theta_velocity += theta_acceleration;
  theta += theta_velocity;
}

function windowResized(){
  resizeCanvas(windowWidth, windowHeight);
}