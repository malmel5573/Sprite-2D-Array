/* Melanie Lopez
03/12/25
 Modify an existing program to customize a grid-based structure, practicing use of object-oriented programming and 2D array structure and syntax. Document code with comments and create a simple HTML page to embed their Processing sketch and caption it, reinforcing both programming and web development skills.*/
// Add a comment to each "//" that you see. 
int cols = 6;  // number of column 
int rows = 5;  // number of row
Sprite[][] sprites; // 2d sprite array 

int numFrames = 4;  // how many frames are in the sprite
PImage[] spriteFrames; // Pimage array holding animation frames
int frameDelay = 20;  // Speed of animation (higher = slower)

void setup() {
  size(500, 500);
  loadSpriteFrames();  // loads sprite frames
  sprites = new Sprite[cols][rows]; 

  // creating sprite objects to fill 2d array

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * width / cols + width / (cols * 2);
      float y = j * height / rows + height / (rows * 2);
      sprites[i][j] = new Sprite(x, y);
    }
  }
}

void draw() {
  background(208, 181, 255);
  
  // iterationg through to display grid of sprites
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      sprites[i][j].update();
      sprites[i][j].display();
    }
  }
}

// loads in sprite images
void loadSpriteFrames() {
  spriteFrames = new PImage[numFrames];
  for (int i = 0; i < numFrames; i++) {
    spriteFrames[i] = loadImage("Girl Duck" + i + ".png"); // Ensure images are named _____0.png, _____1.png, etc.
  }
}

// Sprite Class
class Sprite {
  float x, y;
  int currentFrame = 0;
  int frameCount = 0;
  float size = 60; // controls size of sprite
  float speedX = 0.75; // controls the speed the images move through 

  Sprite(float x, float y) {
    this.x = x;
    this.y = y;
  }


  void update() {
    // controls the update of the animation frames
    frameCount++;
    if (frameCount % frameDelay == 0) {
        currentFrame = (currentFrame + 1) % numFrames;
    }

    // controls the speed
    x += speedX;

    // making the loop repeat - creates endless loop
    if (x >= width) {
        x -= width;  // Shift left by one full width to prevent gaps
    }
}

  void display() {
  

    image(spriteFrames[currentFrame], x - size / 2, y - size / 2, size, size);
  }
}
