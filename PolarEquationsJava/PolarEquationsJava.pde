// THETA
float theta;
float radius;
float theta_vel;
float theta_acc;

void setup() {
  size(1000, 1000);
  frameRate(60);
  radius = height * .45;
  theta = 0;
  theta_vel = 0;
  theta_acc = 0.00001;
  background(0);  
}
void draw() {
  float rr = random(255);
  float rg = random(255);
  float rb = random(255);
  float x = radius * cos(theta); // X AXIS
  float y = radius * sin(10*theta); // Y AXIS
  theta += theta_vel; 
  theta_vel += theta_acc;  
  translate(width/2, height /2);
  fill(rr, 0, rb);
  stroke(rr, rg, 0);
  ellipse (x, y, 24 , 24); // CIRCLE
}