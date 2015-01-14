//
//  MagicalCreatures.h
//  MCMS
//
//  Created by Kyle Magnesen on 1/13/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MagicalCreature : NSObject

@property NSString *fullname;
@property NSString *creatureDescription;
@property NSMutableArray *skills;

-(instancetype)initWithFullname:(NSString *)fullname;
-(instancetype)initWithFullname:(NSString *)fullname creatureDescription:(NSString *)description;

+(instancetype)initWithFullname:(NSString *)fullname;
+(instancetype)initWithFullname:(NSString *)fullname creatureDescription:(NSString *)description;

@end
