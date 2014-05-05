//
//  MSFactory.m
//  Pirate Adventure
//
//  Created by Miguel Serrano on 22/04/14.
//  Copyright (c) 2014 Miguel Serrano. All rights reserved.
//

#import "MSFactory.h"
#import "MSTile.h"

@implementation MSFactory

-(NSArray *)tiles
{
    MSTile *tile00 = [[MSTile alloc] init];
    tile00.story = @"Tile00";
    tile00.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile00.actionButtonName = @"Tile00";
    
    MSTile *tile01 = [[MSTile alloc] init];
    tile01.story = @"Tile01";
    tile01.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile01.actionButtonName = @"Tile01";
    
    MSTile *tile02 = [[MSTile alloc] init];
    tile02.story = @"Tile02";
    tile02.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile02.actionButtonName = @"Tile02";
    
    NSArray *firstColumn = [[NSArray alloc] initWithObjects:tile00, tile01, tile02, nil];

    MSTile *tile10 = [[MSTile alloc] init];
    tile10.story = @"Tile10";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile10.actionButtonName = @"Tile10";
    
    MSTile *tile11 = [[MSTile alloc] init];
    tile11.story = @"Tile11";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile11.actionButtonName = @"Tile11";
    
    MSTile *tile12 = [[MSTile alloc] init];
    tile12.story = @"Tile12";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile12.actionButtonName = @"Tile12";
    
    NSArray *secondColumn = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    MSTile *tile20 = [[MSTile alloc] init];
    tile20.story = @"Tile20";
    tile20.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile20.actionButtonName = @"Tile20";
    
    MSTile *tile21 = [[MSTile alloc] init];
    tile21.story = @"Tile21";
    tile21.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile21.actionButtonName = @"Tile21";
    
    MSTile *tile22 = [[MSTile alloc] init];
    tile22.story = @"Tile22";
    tile22.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile22.actionButtonName = @"Tile22";
    
    NSArray *thirdColumn = [[NSArray alloc] initWithObjects:tile20, tile21, tile22, nil];
    
    MSTile *tile30 = [[MSTile alloc] init];
    tile30.story = @"Tile30";
    tile30.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile30.actionButtonName = @"Tile30";
    
    MSTile *tile31 = [[MSTile alloc] init];
    tile31.story = @"Tile31";
    tile31.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile31.actionButtonName = @"Tile31";
    
    MSTile *tile32 = [[MSTile alloc] init];
    tile32.story = @"Tile32";
    tile32.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile32.actionButtonName = @"Tile32";
    
    NSArray *fourthColumn = [[NSArray alloc] initWithObjects:tile30, tile31, tile32, nil];
    
    NSArray *tileArray = [[NSArray alloc] initWithObjects:firstColumn, secondColumn, thirdColumn, fourthColumn, nil];
    
    return tileArray;
}

@end
