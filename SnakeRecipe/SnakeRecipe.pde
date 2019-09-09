
// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.

class Segment {

  //2. Create x and y member variables to hold the location of each segment.
int x;
int y;
  // 3. Add a constructor with parameters to initialize each variable.
Segment(int x, int y){
  this.x= x;
  this.y= y;

}

  // 4. Add getter and setter methods for both the x and y member variables.
  public int getX(){
    return this.x;
  }
  public void setX(int xPosition){
    this.x = xPosition;
  }
  public int getY(){
    return this.y;
  }
  public void setY(int yPosition){
    this.y = yPosition;
  }
}


// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake
 Segment head;

// 6. Create and initialize a String to hold the direction of your snake e.g. "up"
int direction = UP;

// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.
int piecesFood = 1;

// 8. Create and initialize foodX and foodY variables to hold the location of the food.
int foodX= ((int)random(50)*10);
int foodY= ((int)random(50)*10);
// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)
//int foodX = ((int)random(50)*10);

void setup() {

  // 9. Set the size of your sketch (500 by 500).
  size(500, 500);

  // 10. initialize your head to a new segment.
  head = new Segment(250, 200);

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  frameRate(20);
}


void draw() {
  background(0);

  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods.
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();
}


// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).
void drawFood() {
  fill(#F0470F);
  square(foodX, foodY, 10);
}


//14. Draw the snake head (use a 10 by 10 rectangle)
void drawSnake() {
  fill(#0FF075);
  square(head.x, head.y, 10);

  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
   switch(direction) {
  case UP:
    // move head up here 
    head.y -= 10;
    break;
  case DOWN:
    // move head down here 
    head.y += 10;
    break;
  case LEFT:
   // figure it out
   head.x -= 10;
    break;
  case RIGHT:
    // mystery code goes here 
    head.x += 10;
    break;
  }

  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.
void keyPressed() {
  if(keyCode== UP){
    direction = UP;
  }
 else if(keyCode== DOWN){
    direction = DOWN;
  }
  else if(keyCode== RIGHT){
    direction = RIGHT;
  }
  else if(keyCode == LEFT){
    direction = LEFT;
  }
}


// 19. check if your head is out of bounds (teleport your snake head to the other side).
void checkBoundaries() {
  if (head.x >= width){
    head.x = 0;
  }
  else if (head.x < 0){
    head.x = width;
  }
  else if (head.y < 0){
    head.y = height;
  }
  else if (head.y >= height){
    head.y = 0;
  }
}

//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)

// 21. Complete the missing parts of the collision method below.

void collision() {

  // If the segment is colliding with a piece of food...
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
  if (head.x == foodX && head.y == foodY){
    piecesFood+= 1;
    foodX= ((int)random(50)*10);
    foodY= ((int)random(50)*10);
  }
}

/**
 
 ** Part 2: making the tail (the rest of the snake)
 
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)
ArrayList<Segment> tail = new ArrayList<Segment>();

// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {

  //Call the drawTail and checkTailCollision methods.
drawTail();
checkTailCollision();

  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
tail.add(new Segment(head.x, head.y));

  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.

  while(tail.size() > piecesFood){
    tail.remove(0);
  }
}

void drawTail() {
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    for(int i = 0; i < tail.size(); i++){
      rect(tail.get(i).x, tail.get(i).y, 10, 10);
    }
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
for(int i = 0; i < tail.size(); i++){
if(head.x == tail.get(i).x && head.y ==  tail.get(i).y){
  // reset your food variable
  piecesFood = 1;
  //Call this method at the beginning of your manageTail method.
    }
  }
}
