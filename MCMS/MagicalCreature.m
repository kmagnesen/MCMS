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

-(instancetype)initWithFullname:(NSString *)fullname creatureDescription:(NSString *)description {
    self = [self initWithFullname: fullname];
    self.creatureDescription = description;
    return self;
}

-(instancetype)initWithFullname:(NSString *)fullname creatureDescription:(NSString *)description creatureImage:(NSString *)imageName{
    self = [self initWithFullname: fullname];
    self.creatureDescription = description;
    self.creatureImage = imageName;
    return self;
}

+(instancetype)initWithFullname:(NSString *)fullname {
    return [[MagicalCreature alloc] initWithFullname:fullname];
}

+(instancetype)initWithFullname:(NSString *)fullname creatureDescription:(NSString *)description{
    return [[MagicalCreature alloc] initWithFullname:fullname creatureDescription:description];
}

+(instancetype)initWithFullname:(NSString *)fullname creatureDescription:(NSString *)description creatureImage:(NSString *)imageName {
    return [[MagicalCreature alloc] initWithFullname:fullname creatureDescription:description creatureImage:imageName];
}

-(NSString *)description {
    return [NSString stringWithFormat:@"%@", self.creatureDescription];
}

@end
