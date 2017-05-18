float randomHue = random(0, 1);
float totalValue = 0;

void setup() {
  colorMode(HSB, 1.0);
  size( 750, 750 ); 
  noLoop();
  smooth();
}

void mousePressed() {
  redraw();
}

void draw() {
  background(1);
  randomHue = random(0, 1);
  int nbItems = floor(random(5, 50)); // Decides how many blocks there will be 
  println("nbItems = "+nbItems); 
  int[] numbers = new int[nbItems]; 
  totalValue = 0;
  for ( int i=0; i <= numbers.length-1; i++ ) {
    float tempVal = random(3, 1000);
    if (tempVal > 500) { // Random function using recursion
      tempVal = tempVal + (tempVal *random (1*3));
    } else {
      tempVal = tempVal / random(0, tempVal/500);
    }
    numbers[i] = floor(tempVal); 
    println( totalValue + " + " + numbers[i] + " = ...");
    totalValue += numbers[i];
  }  
  // Basis for each block
  int blockW = width-20;
  int  blockH = height-20; 
  int  refX = 5;
  int  refY = 5;

  makeBlock(refX, refY, blockW, blockH, numbers); //X, Y, Width, Height
} 

void makeBlock(int refX, int refY, int blockW, int blockH, int[] numbers) {
  numbers = reverse(sort(numbers)); // Sort array from largest to smallest, blocks on top > blocks on bottom, blocks to the left > blocks to the right
  int nbItemsInABlock= getPerfectSplitNumber(numbers, blockW, blockH); 
  int valueA = 0;
  int valueB = 0;
  int[] numbersA = { }; 
  int[] numbersB = { }; 

  for ( int i=0; i < numbers.length; i++ ) {
    if (i < nbItemsInABlock) {
      numbersA = append(numbersA, numbers[i]); 
      valueA += numbers[i];
    } else {
      numbersB = append(numbersB, numbers[i]); 
      valueB += numbers[i];
    }
  }
  float ratio = float(valueA) / float(valueB + valueA);
  // Print out ratio of the values
  println("Ratio = " + ratio);
  println("A value = " + valueA);
  println("B value = " + valueB);

  // SET THE X, Y, WIDTH, AND HEIGHT VALUES FOR RECTANGLES (MATH STUFF)
  int xA, yA, heightA, widthA, xB, yB, heightB, widthB;
  if (blockW > blockH) { 
    xA = refX;
    yA = refY;
    heightA = blockH;
    widthA  = floor(blockW * ratio);
    xB = refX + widthA;
    yB = refY;
    heightB = blockH;
    widthB = blockW - widthA; 
  } else {
    xA = refX;
    yA = refY;
    heightA = floor(blockH * ratio);
    widthA  = blockW;
    xB = refX;
    yB = refY+ heightA;
    heightB = blockH - heightA;
    widthB = blockW; 
  }
  // Print out Array's Length  
  println("Array Length = "+numbers.length);
  println("Arrays A Length = "+numbersA.length);
  println("Arrays B Length = "+numbersB.length);
  
  // Check Array A
  if (numbersA.length >= 2) {
    makeBlock(xA, yA, widthA, heightA, numbersA);
  } else {
    drawRect(xA, yA, widthA, heightA, valueA);
  }
  // Check Array B
  if (numbersB.length >= 2) {
    makeBlock(xB, yB, widthB, heightB, numbersB);
  } else {
    drawRect(xB, yB, widthB, heightB, valueB);
  }
}