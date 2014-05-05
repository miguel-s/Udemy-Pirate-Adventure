//
//  MSTile.h
//  Pirate Adventure
//
//  Created by Miguel Serrano on 22/04/14.
//  Copyright (c) 2014 Miguel Serrano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSTile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;

@end
