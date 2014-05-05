//
//  MSCharacter.h
//  Pirate Adventure
//
//  Created by Miguel Serrano on 22/04/14.
//  Copyright (c) 2014 Miguel Serrano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MSWeapon.h"
#import "MSArmor.h"

@interface MSCharacter : NSObject

@property (strong, nonatomic) MSWeapon *weapon;
@property (strong, nonatomic) MSArmor *armor;
@property (nonatomic) int damage;
@property (nonatomic) int health;

@end
