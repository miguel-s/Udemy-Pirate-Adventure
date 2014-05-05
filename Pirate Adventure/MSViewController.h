//
//  MSViewController.h
//  Pirate Adventure
//
//  Created by Miguel Serrano on 22/04/14.
//  Copyright (c) 2014 Miguel Serrano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSCharacter.h"

@interface MSViewController : UIViewController

@property (nonatomic) CGPoint currentLocation;
@property (strong, nonatomic) NSArray *tileArray;
@property (strong, nonatomic) MSCharacter *playerCharacter;
@property (strong, nonatomic) MSCharacter *bossCharacter;
@property (strong, nonatomic) NSArray *weaponsArray;
@property (strong, nonatomic) NSArray *armorArray;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (strong, nonatomic) IBOutlet UILabel *statsHealth;
@property (strong, nonatomic) IBOutlet UILabel *statsDamage;
@property (strong, nonatomic) IBOutlet UILabel *statsWeapon;
@property (strong, nonatomic) IBOutlet UILabel *statsArmor;

@property (strong, nonatomic) IBOutlet UIButton *actionButtonOutlet;
- (IBAction)actionButtonAction:(UIButton *)sender;


@property (strong, nonatomic) IBOutlet UILabel *storyText;

- (IBAction)movNorth:(UIButton *)sender;
- (IBAction)movSouth:(UIButton *)sender;
- (IBAction)movWest:(UIButton *)sender;
- (IBAction)movEast:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *movNorthOutlet;
@property (strong, nonatomic) IBOutlet UIButton *movSouthOutlet;
@property (strong, nonatomic) IBOutlet UIButton *movWestOutlet;
@property (strong, nonatomic) IBOutlet UIButton *movEastOutlet;

- (IBAction)resetGame:(UIButton *)sender;

@end
