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
    return self;
}

-(instancetype)initWithFullname:(NSString *)fullname creatureDescription:(NSString *)description{
    self = [self initWithFullname: fullname];
    self.creatureDescription = description;
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"MagicalCreature:%@ (%@)", self.fullname, self.creatureDescription];
}

@end
