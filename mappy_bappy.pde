import fisica.*;
FWorld world;

boolean mouseReleased;
boolean wasPressed;
int mode = 0;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
int speed = 300;

boolean hasBomb = false;
PFont font;
color white = #FFFFFF;
color black = #000000;
color green = #00FF00;
color red = #FF0000;
color blue = #0000FF;
color orange = #F0A000;
color cyan = #00bbff;
color brown = #ffa600;
color purple = #A020F0;
color pink = #FFC0CB;
color gray = #808080;
color yellow = #FFFF00;
color navy = #000080;
color turq = #30D5C7;
color bb = #89d0f0;
color gold = #FFD900;
color silver = #c0c0c0;
color bowserC = #1f576b;
color bPlate = #96e5ff;
boolean shaking = false;
int dyingTimer = 25;
int shakingThreshold = 10;
int shakingTimer = shakingThreshold;
int speedResetTimer = 0;
Gif ani;
PImage map, ice, stone, treeTrunk, intersect, bombImg, middle, east, west, spike, bridge, plate, trampoline, thwomp0, thwomp1, keyy, hammer, heartred, healthwhite, dmg;
int bombtimer = 0;
int bombthreshold = 60;
//Main character images
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;
PImage[] goomba;
PImage[] lava;
PImage[] hammerbro;
PImage[] star;
PImage[] Gif;
PImage[] bowserGif;

Button gameoverButton = new Button("Continue", 300, 400, 200, 150, blue, pink);
Button introButton = new Button("Start", 300, 400, 200, 150, white, black);

float zoom = 1.5;
int gridSize = 32;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, qkey, spacekey, ekey;
FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
ArrayList<Health> health;
ArrayList<FGameObject> powerups;
ArrayList<FKey> keys;
ArrayList<FGameObject> plates;
ArrayList<FB> bombs;
void setup() {
  size(600, 600);
  ani = new Gif("ani/ani", ".png", 4, 5, 15, 72, gridSize*3.2, gridSize*1.5);
  Fisica.init(this);
  loadImages();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  health = new ArrayList<Health>();
  powerups = new ArrayList<FGameObject>();
  keys = new ArrayList<FKey>();
  plates = new ArrayList<FGameObject>();
  bombs = new ArrayList<FB>();
  loadWorld(map);
  loadPlayer();

  font = createFont("ZombieMonster.ttf", 200);
}

void loadImages() {
  map = loadImage("mappo.png");
  stone = loadImage("brick.png");
  ice = loadImage("blueBlock.png");
  treeTrunk = loadImage("tree_trunk.png");
  intersect = loadImage("tree_intersect.png");
  middle = loadImage("treetop_center.png");
  east = loadImage("treetop_e.png");
  west = loadImage("treetop_w.png");
  spike = loadImage("spike.png");
  bridge = loadImage("bridge.png");
  trampoline = loadImage("trampoline.png");
  thwomp0 = loadImage("thwomp0.png");
  keyy = loadImage("key.jpg");
  keyy.resize(gridSize, gridSize);
  //thwomp0.resize(gridSize*3, gridSize*3);
  thwomp1 = loadImage("thwomp1.png");
  //thwomp1.resize(gridSize*3, gridSize*3);
  hammer = loadImage("hammer.png");
  dmg = loadImage("dmg.png");
  plate = loadImage("plate.jpg");
  plate.resize(gridSize, gridSize);

  bombImg = loadImage("bomb.png");
  bombImg.resize(gridSize, gridSize);

  heartred = loadImage("hpred.png");
  heartred.resize(gridSize*1, gridSize*1);
  healthwhite = loadImage("hpwhite.png");
  healthwhite.resize(gridSize*1, gridSize*1);


  idle = new PImage[2];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");

  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");

  run = new PImage[3];
  run[0] = loadImage("run0.png");
  run[1] = loadImage("run1.png");
  run[2] = loadImage("run2.png");

  goomba = new PImage[2];
  goomba[0] = loadImage("goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1] = loadImage("goomba1.png");
  goomba[1].resize(gridSize, gridSize);

  action = run;

  lava = new PImage[6];
  lava[0] = loadImage("lava0.png");
  lava[1] = loadImage("lava1.png");
  lava[2] = loadImage("lava2.png");
  lava[3] = loadImage("lava3.png");
  lava[4] = loadImage("lava4.png");
  lava[5] = loadImage("lava5.png");

  hammerbro = new PImage[2];
  hammerbro[0] = loadImage("hammerbro0.png");
  hammerbro[1] = loadImage("hammerbro1.png");

  star = new PImage[16];
  star[0] = loadImage("frame_00_delay-0.06s.gif");
  star[0].resize(gridSize, gridSize);
  star[1] = loadImage("frame_01_delay-0.06s.gif");
  star[1].resize(gridSize, gridSize);
  star[2] = loadImage("frame_02_delay-0.06s.gif");
  star[2].resize(gridSize, gridSize);
  star[3] = loadImage("frame_03_delay-0.06s.gif");
  star[3].resize(gridSize, gridSize);
  star[4] = loadImage("frame_04_delay-0.06s.gif");
  star[4].resize(gridSize, gridSize);
  star[5] = loadImage("frame_05_delay-0.06s.gif");
  star[5].resize(gridSize, gridSize);
  star[6] = loadImage("frame_06_delay-0.06s.gif");
  star[6].resize(gridSize, gridSize);
  star[7] = loadImage("frame_07_delay-0.06s.gif");
  star[7].resize(gridSize, gridSize);
  star[8] = loadImage("frame_08_delay-0.06s.gif");
  star[8].resize(gridSize, gridSize);
  star[9] = loadImage("frame_09_delay-0.06s.gif");
  star[9].resize(gridSize, gridSize);
  star[10] = loadImage("frame_10_delay-0.06s.gif");
  star[10].resize(gridSize, gridSize);
  star[11] = loadImage("frame_11_delay-0.06s.gif");
  star[11].resize(gridSize, gridSize);
  star[12] = loadImage("frame_12_delay-0.06s.gif");
  star[12].resize(gridSize, gridSize);
  star[13] = loadImage("frame_13_delay-0.06s.gif");
  star[13].resize(gridSize, gridSize);
  star[14] = loadImage("frame_14_delay-0.06s.gif");
  star[14].resize(gridSize, gridSize);
  star[15] = loadImage("frame_15_delay-0.06s.gif");
  star[15].resize(gridSize, gridSize);

  bowserGif = new PImage[5];
  bowserGif[0] = loadImage("bowser0.gif");
  bowserGif[0].resize(gridSize, gridSize);
  bowserGif[1] = loadImage("bowser1.gif");
  bowserGif[1].resize(gridSize, gridSize);
  bowserGif[2] = loadImage("bowser2.gif");
  bowserGif[2].resize(gridSize, gridSize);
  bowserGif[3] = loadImage("bowser0.gif");
  bowserGif[3].resize(gridSize, gridSize);
  bowserGif[4] = loadImage("bowser0.gif");
  bowserGif[4].resize(gridSize, gridSize);
}

void draw() {
  textFont(font);
  println(mode);
  click();

  if (mode == GAME) {

    background(white);
    drawWorld();
    actWorld();
  } else if (mode == GAMEOVER) {
    Gameover();
  } else if (mode == INTRO) {
    Intro();
  }

  if (shaking) {
    ani.show();
  }

  shakingTimer++;

  if (shakingTimer >= shakingThreshold) {
    shaking = false;
  }


  if (dyingTimer == 15) {
    player.setPosition(380, 150);
    dyingTimer = 16;
    mode = GAMEOVER;
  }
  dyingTimer++;

  if (speedResetTimer > 600) {
    speed = 300;
    speedResetTimer = 0;
  }

  speedResetTimer++;

  if (bombtimer >= bombthreshold && hasBomb && ekey) {
    bombtimer = 0;
    FB b = new FB(gridSize, gridSize);
    b.setPosition(player.getX(), player.getY());
    if (player.direction == -1) {
      b.setVelocity(-200, -600);
    } else if (player.direction == 1) {
      b.setVelocity(200, -600);
    }
    b.setAngularVelocity(50);
    b.setSensor(true);
    b.setStatic(false);
    b.setRotatable(true);


    bombs.add(b);
    world.add(b);
  }
  bombtimer++;
}

void actWorld() {
  player.act();

  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }

  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }

  for (int i = 0; i < health.size(); i++) {
    Health h = health.get(i);
    h.act();
  }

  for (int i = 0; i < powerups.size(); i++) {
    FGameObject f = powerups.get(i);
    f.act();
  }

  for (int i = 0; i < keys.size(); i++) {
    FKey f = keys.get(i);
    f.act();
  }

  for (int i = 0; i < plates.size(); i++) {
    FGameObject f = plates.get(i);
    f.act();
  }

  for (int i = 0; i < bombs.size(); i++) {
    FB b = bombs.get(i);
    b.act();
  }
}

void loadWorld(PImage p) {
  world = new FWorld(-5000, -5000, 5000, 5000);
  world.setGravity(0, 900);


  for (int y = 0; y < p.height; y++) {
    for (int x = 0; x < p.width; x++) {
      color c = map.get(x, y);
      color s = map.get(x, y+1);
      color e = map.get(x+1, y);
      color w = map.get(x-1, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c == black) {
        addGameObject(b, stone, "stone", 5, false);
      } else if (c == gray) {
        addGameObject(b, stone, "wall", 5, false);
      } else if (c == cyan) {
        addGameObject(b, ice, "ice", 1, false);
      } else if (c == brown) {
        addGameObject(b, treeTrunk, "tree trunk", 5, true);
      } else if (c == green && s == brown) {
        addGameObject(b, intersect, "treetop", 5, false);
      } else if (c == green && w == green & e == green) {
        addGameObject(b, middle, "treetop", 5, false);
      } else if (c == green && w != green) {
        addGameObject(b, west, "treetop", 5, false);
      } else if (c == green && e != green) {
        addGameObject(b, east, "treetop", 5, false);
      } else if (c == purple) {
        addGameObject(b, spike, "spike", 5, false);
      } else if (c == pink) {
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        addObject(br, terrain);
      } else if (c == yellow) {
        FGoomba gmb = new FGoomba(x*gridSize, y*gridSize);
        enemies.add(gmb); //======================================================================
        world.add(gmb);
      } else if (c == red) {
        addGameObject(b, trampoline, "trampoline", 5, false);
        b.setRestitution(2);
      } else if (c == orange) {
        FLava lava = new FLava(x*gridSize, y*gridSize);
        addObject(lava, terrain);
      } else if (c == navy) {
        FThwomp t = new FThwomp(x*gridSize, y*gridSize);
        addObject(t, enemies);
      } else if (c == turq) {
        FHammerBro f = new FHammerBro(x*gridSize, y*gridSize);
        addObject(f, enemies);
      } else if (c == bb) {
        FSpeed f = new FSpeed(x*gridSize, y*gridSize);
        addObject(f, powerups);
      } else if (c == gold) {
        FKey f = new FKey(x*gridSize, y*gridSize);
        addObject(f, keys);
      } else if (c == silver) {
        FPlate f = new FPlate(x*gridSize, y*gridSize);
        f.setFriction(4);
        addObject(f, plates);
      } else if (c == bowserC) {
        FBowser f = new FBowser(x*gridSize, y*gridSize);
        addObject(f, enemies);
      } else if (c == bPlate) {
        FBomb plate = new FBomb(x*gridSize, y*gridSize);
        addObject(plate, plates);
      }
    }
    Health h = new Health(50, 80);
    health.add(h);
  }
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}

void drawWorld() {
  pushMatrix();


  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);

  world.step();
  world.draw();

  popMatrix();
}

void addObject(FBox b, ArrayList list) {
  list.add(b);
  world.add(b);
}

void addGameObject(FBox f, PImage img, String name, int friction, boolean sensor) {
  f.attachImage(img);
  f.setName(name);
  f.setSensor(sensor);
  f.setFriction(friction);
  world.add(f);
}
