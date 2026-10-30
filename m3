import pygame
import random

# Initialize Pygame
pygame.init()

# Custom event IDs for color change events
SPRITE_COLOR_CHANGE_EVENT = pygame.USEREVENT + 1
BACKGROUND_COLOR_CHANGE_EVENT = pygame.USEREVENT + 2

# Define basic colors using pygame.Color
# Background colors
BLUE = pygame.Color('blue')
LIGHTBLUE = pygame.Color('lightblue')
DARKBLUE = pygame.Color('darkblue')

# Sprite colors
YELLOW = pygame.Color('yellow')
MAGENTA = pygame.Color('magenta')
ORANGE = pygame.Color('orange')
WHITE = pygame.Color('white')


# Sprite class representing the moving object
class Sprite(pygame.sprite.Sprite):

  # Constructor method
  def __init__(self, color, height, width):
    # Call to the parent class (Sprite) constructor
    super().__init__()
    # Create the sprite's surface with dimensions and color
    self.image = pygame.Surface([width, height])
    self.image.fill(color)
    # Get the sprite's rect defining its position and size
    self.rect = self.image.get_rect()
    # Set initial velocity with random direction
    self.velocity = [random.choice([-1, 1]), random.choice([-1, 1])]

  # Method to update the sprite's position
  def update(self):
    # Move the sprite by its velocity
    self.rect.move_ip(self.velocity)
    # Flag to track if the sprite hits a boundary
    boundary_hit = False
    # Check for collision with left or right boundaries and reverse direction
    if self.rect.left <= 0 or self.rect.right >= 500:
      self.velocity[0] = -self.velocity[0]
      boundary_hit = True
    # Check for collision with top or bottom boundaries and reverse direction
    if self.rect.top <= 0 or self.rect.bottom >= 400:
      self.velocity[1] = -self.velocity[1]
      boundary_hit = True

    # If a boundary was hit, post events to change colors
    if boundary_hit:
      pygame.event.post(pygame.event.Event(SPRITE_COLOR_CHANGE_EVENT))
      pygame.event.post(pygame.event.Event(BACKGROUND_COLOR_CHANGE_EVENT))

  # Method to change the sprite's color
  def change_color(self):
    self.image.fill(random.choice([YELLOW, MAGENTA, ORANGE, WHITE]))


# Function to change the background color
def change_background_color():
  global bg_color
  bg_color = random.choice([BLUE, LIGHTBLUE, DARKBLUE])


# Create a group to hold the sprite
all_sprites_list = pygame.sprite.Group()
# Instantiate the sprite
sp1 = Sprite(WHITE, 20, 30)
# Randomly position the sprite
sp1.rect.x = random.randint(0, 480)
sp1.rect.y = random.randint(0, 370)
# Add the sprite to the group
all_sprites_list.add(sp1)

# Create the game window
screen = pygame.display.set_mode((500, 400))
# Set the window title
pygame.display.set_caption("Boundary Sprite")
# Set the initial background color
bg_color = BLUE
# Apply the background color
screen.fill(bg_color)

# Game loop control flag
exit = False
# Create a clock object to control frame rate
clock = pygame.time.Clock()

# Main game loop
while not exit:
  # Event handling loop
  for event in pygame.event.get():
    # If the window's close button is clicked, exit the game
    if event.type == pygame.QUIT:
      exit = True
    # If the sprite color change event is triggered, change the sprite's color
    elif event.type == SPRITE_COLOR_CHANGE_EVENT:
      sp1.change_color()
    # If the background color change event is triggered, change the background color
    elif event.type == BACKGROUND_COLOR_CHANGE_EVENT:
      change_background_color()

  # Update all sprites
  all_sprites_list.update()
  # Fill the screen with the current background color
  screen.fill(bg_color)
  # Draw all sprites to the screen
  all_sprites_list.draw(screen)

  # Refresh the display
  pygame.display.flip()
  # Limit the frame rate to 240 fps
  clock.tick(240)

# Uninitialize all pygame modules and close the window
pygame.quit()

# Smart Traffic Signal Simulator
 
# Import necessary libraries
import pygame
import random
 
# Initialize Pygame
pygame.init()
 
# Custom event IDs
CAR_COLOR_CHANGE_EVENT = pygame.USEREVENT + 1
SIGNAL_CHANGE_EVENT = pygame.USEREVENT + 2
 
# Define colours
ROAD = pygame.Color("darkgray")
WHITE = pygame.Color("white")
YELLOW = pygame.Color("yellow")
BLUE = pygame.Color("blue")
ORANGE = pygame.Color("orange")
 
RED = pygame.Color("red")
GREEN = pygame.Color("green")
 
 
# Create a Car sprite class
class Car(pygame.sprite.Sprite):
 
    # Constructor method
    def __init__(self, color, width, height):
        # Call the parent Sprite constructor
        super().__init__()
 
        # Give the car an image
        self.image = pygame.Surface([width, height])
        self.image.fill(color)
 
        # Give the car a rectangular position
        self.rect = self.image.get_rect()
 
        # Give the car a horizontal velocity
        self.velocity = [3, 0]
 
    # Update the car's position
    def update(self):
        # Move the car using its velocity
        self.rect.move_ip(self.velocity)
 
        sensor_triggered = False
 
        # Check whether the car reaches either road boundary
        if self.rect.left <= 0 or self.rect.right >= 600:
            # Reverse the car's direction
            self.velocity[0] = -self.velocity[0]
 
            sensor_triggered = True
 
        # Post custom events when a boundary sensor is triggered
        if sensor_triggered:
            pygame.event.post(
                pygame.event.Event(CAR_COLOR_CHANGE_EVENT)
            )
 
            pygame.event.post(
                pygame.event.Event(SIGNAL_CHANGE_EVENT)
            )
 
    # Change the car's colour
    def change_color(self):
        self.image.fill(
            random.choice([WHITE, YELLOW, BLUE, ORANGE])
        )
 
 
# Function to change the traffic signal
def change_signal():
    global signal_color
 
    # Switch between red and green
    if signal_color == RED:
        signal_color = GREEN
    else:
        signal_color = RED
 
 
# Create a sprite group
all_sprites = pygame.sprite.Group()
 
# Create the car sprite
car = Car(WHITE, 70, 35)
 
# Position the car on the road
car.rect.x = 50
car.rect.y = 300
 
# Add the car to the sprite group
all_sprites.add(car)
 
# Create the game window
screen = pygame.display.set_mode((600, 400))
pygame.display.set_caption("Smart Traffic Signal Simulator")
 
# Set the starting signal colour
signal_color = RED
 
# Create a clock to control the frame rate
clock = pygame.time.Clock()
 
# Control the game loop
running = True
 
while running:
 
    # Handle events
    for event in pygame.event.get():
 
        # Close the application
        if event.type == pygame.QUIT:
            running = False
 
        # Handle the custom car colour event
        elif event.type == CAR_COLOR_CHANGE_EVENT:
            car.change_color()
 
        # Handle the custom traffic signal event
        elif event.type == SIGNAL_CHANGE_EVENT:
            change_signal()
 
    # Update all sprites in the group
    all_sprites.update()
 
    # Draw the road background
    screen.fill(ROAD)
 
    # Draw road divider lines
    for x in range(0, 600, 80):
        pygame.draw.rect(
            screen,
            WHITE,
            (x, 345, 45, 5)
        )
 
    # Draw the traffic-signal box
    pygame.draw.rect(
        screen,
        pygame.Color("black"),
        (275, 40, 50, 90)
    )
 
    # Draw the active traffic-signal light
    pygame.draw.circle(
        screen,
        signal_color,
        (300, 85),
        20
    )
 
    # Draw all sprites
    all_sprites.draw(screen)
 
    # Refresh the display
    pygame.display.flip()
 
    # Limit the frame rate
    clock.tick(60)
 
# Close Pygame
pygame.quit()
