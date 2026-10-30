import pygame  
  
pygame.init()  
screen = pygame.display.set_mode((400, 300))  
done = False  
  
while not done:  
    for event in pygame.event.get():  
        if event.type == pygame.QUIT:  
            done = True  
    pygame.draw.rect(screen, (0, 125, 255), pygame.Rect(30, 30, 60, 60))    
  
    pygame.display.flip()  
    import pygame

pygame.init()
# Create the display surface object of specific dimension.
window = pygame.display.set_mode((400, 400))
# Fill the screen with white color
window.fill((255, 255, 255))
# Define colors
GREEN = (0, 255, 0)
# Draw solid circle
pygame.draw.circle(window, GREEN, (300, 300), 50)
# Draw outlined circle
pygame.draw.circle(window, GREEN, (100, 100), 50, 3)
# Draws the surface object to the screen.
pygame.display.update()
# Game loop
running = True
while running:
    # Event handling
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
# Quit pygame
pygame.quit()


import pygame

def main():
    pygame.init()
    screen_width, screen_height = 500, 500
    screen = pygame.display.set_mode((screen_width, screen_height))
    pygame.display.set_caption('color changing sprite')

    # Mapping of color names to RGB values
    colors = {
        'red': pygame.Color('red'),
        'green': pygame.Color('green'),
        'blue': pygame.Color('blue'),
        'yellow': pygame.Color('yellow'),
        'white': pygame.Color('white')
    }
    current_color = colors['white']

    x, y = 30, 30
    sprite_width, sprite_height = 60, 60

    clock = pygame.time.Clock()

    done = False
    while not done:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                done = True

        pressed = pygame.key.get_pressed()
        if pressed[pygame.K_LEFT]: x -= 3
        if pressed[pygame.K_RIGHT]: x += 3
        if pressed[pygame.K_UP]: y -= 3
        if pressed[pygame.K_DOWN]: y += 3

        x = min(max(0, x), screen_width - sprite_width)
        y = min(max(0, y), screen_height - sprite_height)

        # Change color based on boundary contact
        if x == 0: current_color = colors['blue']
        elif x == screen_width - sprite_width: current_color = colors['yellow']
        elif y == 0: current_color = colors['red']
        elif y == screen_height - sprite_height:
            current_color = colors['green']
        else:
            current_color = colors['white']

        screen.fill((0, 0, 0))
        pygame.draw.rect(screen, current_color,
                         (x, y, sprite_width, sprite_height))
        pygame.display.flip()
        clock.tick(90)

    pygame.quit()


if __name__ == "__main__":
    main()


# Mini Sprite Adventure
 
import pygame
 
def main():
    pygame.init()
 
    # PART 1: Create the game screen
    screen_width, screen_height = 500, 400
    screen = pygame.display.set_mode((screen_width, screen_height))
    pygame.display.set_caption("Mini Sprite Adventure")
 
    # PART 2: Set sprite position and size
    x, y = 50, 50
    sprite_width, sprite_height = 60, 60
    speed = 4
 
    # PART 3: Define colors
    BLACK = (0, 0, 0)
    WHITE = (255, 255, 255)
    BLUE = (0, 125, 255)
    RED = (255, 0, 0)
    GREEN = (0, 255, 0)
    YELLOW = (255, 255, 0)
 
    current_color = WHITE
 
    clock = pygame.time.Clock()
    running = True
 
    # PART 4: Game loop
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                running = False
 
        # PART 5: Check which arrow keys are held down
        pressed = pygame.key.get_pressed()
 
        if pressed[pygame.K_LEFT]:
            x -= speed
        if pressed[pygame.K_RIGHT]:
            x += speed
        if pressed[pygame.K_UP]:
            y -= speed
        if pressed[pygame.K_DOWN]:
            y += speed
 
        # PART 6: Keep the sprite inside the screen
        x = min(max(0, x), screen_width - sprite_width)
        y = min(max(0, y), screen_height - sprite_height)
 
        # PART 7: Change color based on sprite position
        if x == 0:
            current_color = BLUE
        elif x == screen_width - sprite_width:
            current_color = YELLOW
        elif y == 0:
            current_color = RED
        elif y == screen_height - sprite_height:
            current_color = GREEN
        else:
            current_color = WHITE
 
        # PART 8: Draw the background
        screen.fill(BLACK)
 
        # PART 9: Draw solid and outlined shapes
        pygame.draw.circle(screen, GREEN, (420, 320), 35)
        pygame.draw.circle(screen, BLUE, (80, 320), 35, 4)
 
        # PART 10: Draw the moving sprite using pygame.Rect
        sprite_rect = pygame.Rect(x, y, sprite_width, sprite_height)
        pygame.draw.rect(screen, current_color, sprite_rect)
 
        pygame.display.flip()
        clock.tick(60)
 
    pygame.quit()
 
 
if __name__ == "__main__":
