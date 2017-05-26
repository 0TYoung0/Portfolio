var theta;
var theta_velocity;
var theta_acceleration;
var radius;
function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  var fov = 60/180 * PI;
  var cameraZ = (height/2.0) / tan(fov/2.0);
  radius = height * 0.45;
  theta = 0;
  theta_velocity = 0;
  theta_acceleration = 0.00001;
  perspective(60/180*PI, width/height, cameraZ *0.1, cameraZ*10);
  //background(200);
}

function draw() {
  background(200);  
  var x = radius * sin(theta) * cos(6*theta);
  var y = radius * cos(theta) * cos(6*theta);
  var z = radius * cos(theta);
  //var x1 = (mouseX/2)^2;
  //var y1 = (mouseY/2)^2;
  orbitControl();
  translate(x, y);
  ellipsoid(x, y, z);
  //point(x1, y1);
  theta_velocity += theta_acceleration;
  theta += theta_velocity;
  //theta = 5;
}