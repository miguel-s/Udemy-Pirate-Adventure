//
//  MSViewController.m
//  Pirate Adventure
//
//  Created by Miguel Serrano on 22/04/14.
//  Copyright (c) 2014 Miguel Serrano. All rights reserved.
//

#import "MSViewController.h"
#import "MSFactory.h"
#import "MSTile.h"

@interface MSViewController ()

@end

@implementation MSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    MSFactory *tileFactory = [[MSFactory alloc] init];
    self.tileArray = [[NSArray alloc] init];
    self.tileArray = [tileFactory tiles];
    
    MSWeapon *fistWeapon = [[MSWeapon alloc] init];
    fistWeapon.name = @"Fists";
    fistWeapon.damage = 1;
    
    MSWeapon *swordWeapon = [[MSWeapon alloc] init];
    swordWeapon.name = @"Sword";
    swordWeapon.damage = 5;
    
    self.weaponsArray = [[NSArray alloc] initWithObjects:fistWeapon, swordWeapon, nil];
    
    MSArmor *shirtArmor = [[MSArmor alloc] init];
    shirtArmor.name = @"Shirt";
    shirtArmor.health = 10;
    
    MSArmor *leatherArmor = [[MSArmor alloc] init];
    leatherArmor.name = @"Leather Armor";
    leatherArmor.health = 20;
    
    self.armorArray = [[NSArray alloc] initWithObjects:shirtArmor, leatherArmor,nil];
    
    self.playerCharacter = [[MSCharacter alloc] init];
    self.bossCharacter = [[MSCharacter alloc] init];
    
    [self setGame];
    
    [self updateTile: self.tileArray atLocation: self.currentLocation];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)movNorth:(UIButton *)sender {
    self.currentLocation = CGPointMake(self.currentLocation.x, self.currentLocation.y + 1);
    
    [self updateTile: self.tileArray atLocation: self.currentLocation];

}

- (IBAction)movSouth:(UIButton *)sender {
    self.currentLocation = CGPointMake(self.currentLocation.x, self.currentLocation.y - 1);
    
    [self updateTile: self.tileArray atLocation: self.currentLocation];

}

- (IBAction)movWest:(UIButton *)sender {
    self.currentLocation = CGPointMake(self.currentLocation.x - 1, self.currentLocation.y);
    
    [self updateTile: self.tileArray atLocation: self.currentLocation];

}

- (IBAction)movEast:(UIButton *)sender {
    self.currentLocation = CGPointMake(self.currentLocation.x + 1, self.currentLocation.y);
    
    [self updateTile: self.tileArray atLocation: self.currentLocation];

}

- (IBAction)resetGame:(UIButton *)sender {
    self.currentLocation = CGPointMake(0,0);
    
    [self updateTile: self.tileArray atLocation: self.currentLocation];

}

- (IBAction)actionButtonAction:(UIButton *)sender {
    if (self.currentLocation.x == 3 && self.currentLocation.y == 2) {
        NSLog(@"BOSS TILE");
        NSLog(@"player health: %i", self.playerCharacter.health);
        NSLog(@"boss health: %i", self.bossCharacter.health);
        self.playerCharacter.health = self.playerCharacter.health - self.bossCharacter.damage;
        self.bossCharacter.health = self.bossCharacter.health - self.playerCharacter.damage;
        
        if (self.playerCharacter.health <= 0) {
            UIAlertView *gameOver = [[UIAlertView alloc] initWithTitle:@"Game Over" message:@"You died!" delegate:nil cancelButtonTitle:@"Reset Game" otherButtonTitles:nil];
            [gameOver show];
            [self setGame];
        }
        else if (self.bossCharacter.health <= 0) {
            UIAlertView *gameOver = [[UIAlertView alloc] initWithTitle:@"Win" message:@"You defeated the boss!" delegate:nil cancelButtonTitle:@"Reset Game" otherButtonTitles:nil];
            [gameOver show];
            [self setGame];

        }
        [self updateTile:self.tileArray atLocation:self.currentLocation];
        
    }
    else {
        self.playerCharacter.weapon = [self.weaponsArray objectAtIndex:1];
        self.playerCharacter.damage = self.playerCharacter.weapon.damage;
        [self updateTile:self.tileArray atLocation:self.currentLocation];
    }
}

- (void)updateTile: (NSArray *) tileArray  atLocation: (CGPoint) currentLocation {
    
    self.statsHealth.text = [NSString stringWithFormat:@"%i", self.playerCharacter.health];
    self.statsDamage.text = [NSString stringWithFormat:@"%i", self.playerCharacter.damage];
    self.statsWeapon.text = self.playerCharacter.weapon.name;
    self.statsArmor.text = self.playerCharacter.armor.name;
    
    self.backgroundImage.image = [[[tileArray objectAtIndex:currentLocation.x] objectAtIndex:currentLocation.y] backgroundImage];
    
    self.storyText.text = [[[tileArray objectAtIndex:currentLocation.x] objectAtIndex:currentLocation.y] story];
    
    [self setActionButton: tileArray atLocation: currentLocation];
    [self setMovButtons: currentLocation];
    
    NSLog(@"x: %f y: %f", currentLocation.x, currentLocation.y);
}

- (void)setActionButton: (NSArray *) tileArray atLocation: (CGPoint) currentLocation {
    [self.actionButtonOutlet setTitle:[[[tileArray objectAtIndex:currentLocation.x] objectAtIndex:currentLocation.y] actionButtonName] forState:UIControlStateNormal];
}

- (void)setMovButtons: (CGPoint) currentLocation {
    self.movNorthOutlet.hidden = NO;
    self.movSouthOutlet.hidden = NO;
    self.movWestOutlet.hidden = NO;
    self.movEastOutlet.hidden = NO;
    
    if (currentLocation.x == 0) {
        self.movWestOutlet.hidden = YES;
    }
    if (currentLocation.x == 3) {
        self.movEastOutlet.hidden = YES;
    }
    if (currentLocation.y == 0) {
        self.movSouthOutlet.hidden = YES;
    }
    if (currentLocation.y == 2) {
        self.movNorthOutlet.hidden = YES;
    }
    
}

- (void)setGame {
    self.currentLocation = CGPointMake(0,0);

    self.playerCharacter.weapon = [self.weaponsArray objectAtIndex:0];
    self.playerCharacter.armor = [self.armorArray objectAtIndex:0];
    self.playerCharacter.damage = self.playerCharacter.weapon.damage;
    self.playerCharacter.health = self.playerCharacter.armor.health;
    
    self.bossCharacter.weapon = [self.weaponsArray objectAtIndex:0];
    self.bossCharacter.armor = [self.armorArray objectAtIndex:0];
    self.bossCharacter.damage = self.bossCharacter.weapon.damage;
    self.bossCharacter.health = self.bossCharacter.armor.health;

}

@end
