void drawRect(int x1, int y1, int w1, int h1, int value) {
  stroke(1);
  float hStart = randomHue - 0.1;
  float hEnd = randomHue + 0.1;
  float h = random(hStart, hEnd);
  float s = random(0.01, 0.35);
  float b = random(0.5, 0.95);
  fill(h, s, b);
  rect(x1, y1, w1, h1); // Makes each rectangle    
  fill(1);
  String myPcntStr ;
  int myPcnt = int(round ((value / totalValue) *100)) ;
  float myPcntDecimal = int(round ((value / totalValue) *1000)) ;
  myPcntDecimal = myPcntDecimal/10;
  if (myPcntDecimal > 10) { //If the decimal is > 10, round up 
    myPcntStr = str(myPcnt) + "%";
  } else {
    myPcntStr = str (myPcntDecimal) + "%";
  }
  text(myPcntStr, x1+(w1/2)-10, y1+(h1/2)+5); 
  println("++++ totalValue = "+totalValue);
}
// How to split the numbers
int getPerfectSplitNumber(int[] numbers, int blockW, int blockH) {
  int valueA = numbers[0]; // Value A is the biggest Number (%)
  int valueB = 0;// Corresponds to the total amount of rectangles 
  for ( int i=1; i < numbers.length; i++ ) {
    valueB += numbers[i];
  }
  float ratio = float(valueA) / float(valueB + valueA);
  int heightA, widthA;
  if (blockW >= blockH) {
    heightA = blockH;
    widthA  = floor(blockW * ratio);
  } else {
    heightA = floor(blockH * ratio);
    widthA  = blockW;
  }
  float ratioWH = float(widthA) / float(heightA) ;
  float ratioHW = float(heightA) / float(widthA);
  float diff;
  if (widthA >= heightA) {
    diff = 1 - ratioHW ;
  } else {
    diff = 1- ratioWH;
  }
  if ((diff > 0.5) && (numbers.length >= 3)) {
    return 2; 
  } else {  
    return 1;
  }
}