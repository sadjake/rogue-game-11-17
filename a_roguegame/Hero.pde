class Hero extends GameObject {
  float speed;
  Weapon myWeapon;
  boolean immunity;
  int immunityTimer;

  Hero() {
    super();
    speed = 9;
    rx = 1;
    ry = 1;
    size = 25;
    HEALTHPOINTS = 100;
    immunity = true;
    immunityTimer = 100;
    myWeapon = new rapidfire();
  }

  void show() {
    //pushMatrix();
    fill(SKY);
    strokeWeight(3);
    stroke(BLACK);
    circle(location.x, location.y, size);
    fill(BLACK);
    textSize(12);
    text(HEALTHPOINTS, location.x, location.y);

    if (immunity == true) {
      immunityTimer = 100;
      immunityTimer--;
    }

    //if


      //popMatrix();
  }

  void act() {
    super.act();
    //move
    if (upkey) velocity.y = -speed;
    if (leftkey) velocity.x = -speed;
    if (downkey) velocity.y = speed;
    if (rightkey) velocity.x = speed;

    if (velocity.mag() > speed)
      velocity.setMag(speed);

    if (!leftkey && !rightkey) velocity.x = velocity.x * 0.75;
    if (!downkey && !upkey) velocity.y = velocity.y * 0.75;

    if (northRoom != WHITE && location.y ==height*0.1&& location.x >= width/2-50&&location.x <= width/2+50) {
      ry--;
      location = new PVector(width/2, height*0.9-10);
    } else if (eastRoom != WHITE && location.x ==width*0.9 && location.y >= height/2-50&& location.y <= height/2+50) {
      rx++;
      location = new PVector(width*0.1+10, height/2 );
    } else if (southRoom != WHITE && location.y ==height*0.9&& location.x >= width/2-50 &&location.x <= width/2+50) {
      ry++;
      location = new PVector(width/2, height*0.1+10);
    } else if (westRoom != WHITE && location.x ==width*0.1&& location.y >= height/2-50&& location.y <= height/2+50) {
      rx--;
      location = new PVector(width*0.9-10, height/2);
    }
    myWeapon.update();
    if (spacekey) {
      print("hi");
      myWeapon.shoot();
    }



    //if (immunity >= immunityTimer) {
    //  stroke(255);
    //  textSize(20);
    //  text("IMMUNITY: ON", 400, 125);
    //}
  }
}
