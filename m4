import pygame
import random

# Constants for easier adjustments
SCREEN_WIDTH, SCREEN_HEIGHT = 500, 400
MOVEMENT_SPEED = 5
FONT_SIZE = 72

# Initialize Pygame
pygame.init()

# Load and transform the background image
background_image = pygame.transform.scale(pygame.image.load("bg.jpg"),
                                          (SCREEN_WIDTH, SCREEN_HEIGHT))

# Load font once at the beginning
font = pygame.font.SysFont("Times New Roman", FONT_SIZE)


class Sprite(pygame.sprite.Sprite):

    def __init__(self, color, height, width):
        super().__init__()
        self.image = pygame.Surface([width, height])
        self.image.fill(
            pygame.Color('dodgerblue'))  # Background color of sprite
        pygame.draw.rect(self.image, color, pygame.Rect(0, 0, width, height))
        self.rect = self.image.get_rect()

    def move(self, x_change, y_change):
        self.rect.x = max(
            min(self.rect.x + x_change, SCREEN_WIDTH - self.rect.width), 0)
        self.rect.y = max(
            min(self.rect.y + y_change, SCREEN_HEIGHT - self.rect.height), 0)


# Setup
screen = pygame.display.set_mode((SCREEN_WIDTH, SCREEN_HEIGHT))
pygame.display.set_caption("Sprite Collision")
all_sprites = pygame.sprite.Group()

# Create sprites
sprite1 = Sprite(pygame.Color('black'), 20, 30)
sprite1.rect.x, sprite1.rect.y = random.randint(
    0, SCREEN_WIDTH - sprite1.rect.width), random.randint(
        0, SCREEN_HEIGHT - sprite1.rect.height)
all_sprites.add(sprite1)
    
sprite2 = Sprite(pygame.Color('red'), 20, 30)
sprite2.rect.x, sprite2.rect.y = random.randint(
    0, SCREEN_WIDTH - sprite2.rect.width), random.randint(
        0, SCREEN_HEIGHT - sprite2.rect.height)
all_sprites.add(sprite2)

# Game loop control variables
running, won = True, False
clock = pygame.time.Clock()

# Main game loop
while running: 
    for event in pygame.event.get():
        if event.type == pygame.QUIT or (event.type == pygame.KEYDOWN
                                         and event.key == pygame.K_x):
            running = False

    if not won:
        keys = pygame.key.get_pressed()
        x_change = (keys[pygame.K_RIGHT] -keys[pygame.K_LEFT]) * MOVEMENT_SPEED
        y_change = (keys[pygame.K_DOWN] - keys[pygame.K_UP]) * MOVEMENT_SPEED
        sprite1.move(x_change, y_change)

        if sprite1.rect.colliderect(sprite2.rect):
            all_sprites.remove(sprite2)
            won = True

    # Drawing
    screen.blit(background_image, (0, 0))
    all_sprites.draw(screen)

    # Display win message
    if won:
        win_text = font.render("You win!", True, pygame.Color('black'))
        screen.blit(win_text, ((SCREEN_WIDTH - win_text.get_width()) // 2,
                               (SCREEN_HEIGHT - win_text.get_height()) // 2))

    pygame.display.flip()
    clock.tick(90)

pygame.quit()


# Pet Food Collection Game
 
# Import necessary libraries
import pygame
import random
 
# Constants for easy adjustments
SCREEN_WIDTH, SCREEN_HEIGHT = 500, 400
MOVEMENT_SPEED = 5
FONT_SIZE = 60
 
# Initialize Pygame
pygame.init()
 
# Load and scale the background image
background_image = pygame.transform.scale(
    pygame.image.load("pet_bg.jpg"),
    (SCREEN_WIDTH, SCREEN_HEIGHT)
)
 
# Load a named system font
font = pygame.font.SysFont(
    "Arial",
    FONT_SIZE
)
 
 
# Create a sprite class
class Sprite(pygame.sprite.Sprite):
 
    def __init__(self, color, width, height):
        # Call the parent Sprite constructor
        super().__init__()
 
        # Give the sprite an image
        self.image = pygame.Surface(
            [width, height]
        )
        self.image.fill(color)
 
        # Give the sprite a rectangular position
        self.rect = self.image.get_rect()
 
    # Move the sprite while keeping it inside the screen
    def move(self, x_change, y_change):
        self.rect.x = max(
            min(
                self.rect.x + x_change,
                SCREEN_WIDTH - self.rect.width
            ),
            0
        )
 
        self.rect.y = max(
            min(
                self.rect.y + y_change,
                SCREEN_HEIGHT - self.rect.height
            ),
            0
        )
 
 
# Create the game window
screen = pygame.display.set_mode(
    (SCREEN_WIDTH, SCREEN_HEIGHT)
)
 
pygame.display.set_caption(
    "Pet Food Collection Game"
)
 
# Create a group for all sprites
all_sprites = pygame.sprite.Group()
 
# Create the pet sprite
pet = Sprite(
    pygame.Color("brown"),
    40,
    40
)
 
pet.rect.x = 30
pet.rect.y = 180
 
all_sprites.add(pet)
 
# Create the pet-food sprite
pet_food = Sprite(
    pygame.Color("orange"),
    30,
    30
)
 
# Place the food at a random position
pet_food.rect.x = random.randint(
    100,
    SCREEN_WIDTH - pet_food.rect.width
)
 
pet_food.rect.y = random.randint(
    0,
    SCREEN_HEIGHT - pet_food.rect.height
)
 
all_sprites.add(pet_food)
 
# Game control variables
running = True
food_collected = False
 
# Create a clock to control the frame rate
clock = pygame.time.Clock()
 
 
# Main game loop
while running:
 
    # Handle events
    for event in pygame.event.get():
 
        if event.type == pygame.QUIT:
            running = False
 
    # Move the pet until the food is collected
    if not food_collected:
 
        keys = pygame.key.get_pressed()
 
        x_change = (
            keys[pygame.K_RIGHT] -
            keys[pygame.K_LEFT]
        ) * MOVEMENT_SPEED
 
        y_change = (
            keys[pygame.K_DOWN] -
            keys[pygame.K_UP]
        ) * MOVEMENT_SPEED
 
        pet.move(
            x_change,
            y_change
        )
 
        # Detect collision between the pet and food
        if pet.rect.colliderect(
            pet_food.rect
        ):
            # Remove the collected food from the group
            all_sprites.remove(
                pet_food
            )
 
            food_collected = True
 
    # Display the scaled background image
    screen.blit(
        background_image,
        (0, 0)
    )
 
    # Draw the sprites
    all_sprites.draw(screen)
 
    # Display the completion message
    if food_collected:
 
        win_text = font.render(
            "Food Collected!",
            True,
            pygame.Color("black")
        )
 
        # Centre the text manually
        text_x = (
            SCREEN_WIDTH -
            win_text.get_width()
        ) // 2
 
        text_y = (
            SCREEN_HEIGHT -
            win_text.get_height()
        ) // 2
 
        screen.blit(
            win_text,
            (text_x, text_y)
        )
 
    # Refresh the display
    pygame.display.flip()
 
    # Limit the frame rate
    clock.tick(60)
 
# Close Pygame
pygame.quit()
