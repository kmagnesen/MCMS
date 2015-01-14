//
//  MagicalCreatures.m
//  MCMS
//
//  Created by Kyle Magnesen on 1/13/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(instancetype)initWithFullname:(NSString *)fullname {
    self = [super init];
    self.fullname = fullname;
    self.creatureDescription = @"";
    self.superPowers = [NSMutableArray new];
    return self;
}

-(instancetype)initWithFullname:(NSString *)fullname creatureDescription:(NSString *)description{
    self = [self initWithFullname: fullname];
    self.creatureDescription = description;
    return self;
}

+(instancetype)initWithFullname:(NSString *)fullname {
    return [[MagicalCreature alloc] initWithFullname:fullname];
}

+(instancetype)initWithFullname:(NSString *)fullname creatureDescription:(NSString *)description{
    return [[MagicalCreature alloc] initWithFullname:fullname creatureDescription:description];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"[Creature Name: %@ Description: (%@)", self.fullname, self.creatureDescription];
}

@end
