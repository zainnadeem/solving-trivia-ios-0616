//
//  FISAppDelegate.m
//  solving-trivia
//
//  Created by iOS Staff on 9/30/14
//  Copyright (c) 2014 The Flatiron School. All rights reserved.
//

#import "FISAppDelegate.h"

@interface FISAppDelegate ()

@end
@implementation FISAppDelegate

-(NSString*) solveTrivia
{
    NSDictionary *stateCapitals= @{@"Alabama":@"Montgomery",
                                   @"Alaska":@"Juneau",
                                   @"Arizona":@"Phoenix",
                                   @"Arkansas":@"Little Rock",
                                   @"California":@"Sacramento",
                                   @"Colorado":@"Denver",
                                   @"Connecticut":@"Hartford",
                                   @"Delaware":@"Dover",
                                   @"Florida":@"Tallahassee",
                                   @"Georgia":@"Atlanta",
                                   @"Hawaii":@"Honolulu",
                                   @"Idaho":@"Boise",
                                   @"Illinois":@"Springfield",
                                   @"Indiana":@"Indianapolis",
                                   @"Iowa":@"Des Moines",
                                   @"Kansas":@"Topeka",
                                   @"Kentucky":@"Frankfort",
                                   @"Lousiana":@"Baton Rouge",
                                   @"Maine":@"Augusta",
                                   @"Maryland":@"Annapolis",
                                   @"Massassachusetts":@"Boston",
                                   @"Michigan":@"Lansing",
                                   @"Minnesota":@"Saint Paul",
                                   @"Mississippi":@"Jackson",
                                   @"Missouri":@"Jefferson City",
                                   @"Montana":@"Helena",
                                   @"Nebraska":@"Lincoln",
                                   @"Nevada":@"Carson City",
                                   @"New Hampshire":@"Concord",
                                   @"New Jersey":@"Trenton",
                                   @"New Mexico":@"Santa Fe",
                                   @"New York":@"Albany",
                                   @"North Carolina":@"Raleigh",
                                   @"North Dakota":@"Bismarck",
                                   @"Ohio":@"Columbus",
                                   @"Oklahoma":@"Oklahoma City",
                                   @"Oregon":@"Salem",
                                   @"Pennsylvania":@"Harrisburg",
                                   @"Rhode Island":@"Providence",
                                   @"South Carolina":@"Columbia",
                                   @"South Dakota":@"Pierre",
                                   @"Tennessee":@"Nashville",
                                   @"Texas":@"Austin",
                                   @"Utah":@"Salt Lake City",
                                   @"Vermont":@"Montpelier",
                                   @"Virgina":@"Richmond",
                                   @"Washington":@"Olympia",
                                   @"West Virginia":@"Charleston",
                                   @"Wisconsin":@"Madison",
                                   @"Wyoming":@"Cheyenne"};
    
    for(NSString *stateName in stateCapitals)
    {
        // store the value (capital) as a separate NSString
        NSString *capitalName = stateCapitals[stateName];
        
        // split the strings into arrays of characters
        NSArray *stateNameCharacters = [self splitStringIntoCharactersArray: stateName];
        NSArray *stateCapitalCharacters = [self splitStringIntoCharactersArray: capitalName];
        
        // set a BOOL for whether we found a match (we haven't yet so it should be NO)
        BOOL matchingCharacterFound = NO;
        
        // loop over every character in the stateName...
        for(NSString *character in stateNameCharacters)
        {
            // compare it with every character in the capitalName
            for (NSString *otherCharacter in stateCapitalCharacters)
            {
                // if there is a match, set matchingCharacterFound to be true
                if ([character isEqualToString:otherCharacter])
                {
                    matchingCharacterFound = YES;
                };
            };
        };
        // now that we've checked all of the characters,
        // if matchingCharacterFound is STILL == NO, NSLog the state name and capital
        if(!matchingCharacterFound)
        {
            return stateName;
        }; // otherwise just keep looking!
    };
    
    // here to avoid compiler errors
    // and returns nothing if no match is found
    return @"";
}

-(NSArray *) splitStringIntoCharactersArray: (NSString *) string
{
    // strip any spaces & lowercase
    string = [[[string componentsSeparatedByString:@" "] componentsJoinedByString:@""] lowercaseString];
    
    // create a container
    NSMutableArray *stringCharacters = [NSMutableArray array];
    
    // split the string into characters!
    for (NSUInteger i = 0; i < [string length]; i++)
    {
        NSString *character = [string substringWithRange:NSMakeRange(i, 1)];
        [stringCharacters addObject: character];
    };
    return [stringCharacters copy];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    NSArray *states = @[@"Alabama", @"Alaska", @"Arizona", @"Arkansas", @"California", @"Colorado", @"Connecticut", @"Delaware", @"Florida", @"Georgia", @"Hawaii", @"Idaho", @"Illinois", @"Indiana", @"Iowa", @"Kansas", @"Kentucky", @"Louisiana", @"Maine", @"Maryland", @"Massachusetts", @"Michigan", @"Minnesota", @"Mississippi", @"Missouri", @"Montana", @"Nebraska", @"Nevada", @"New Hampshire", @"New Jersey", @"New Mexico", @"New York", @"North Carolina", @"North Dakota", @"Ohio", @"Oklahoma", @"Oregon", @"Pennsylvania", @"Rhode Island", @"South Carolina", @"South Dakota", @"Tennessee", @"Texas", @"Utah", @"Vermont", @"Virginia", @"Washington", @"West Virginia", @"Wisconsin", @"Wyoming"];
    NSArray *capitals = @[@"Montgomery",@"Juneau",@"Phoenix",@"Little Rock",@"Sacramento",@"Denver",@"Hartford",@"Dover",@"Tallahassee",@"Atlanta",@"Honolulu",@"Boise",@"Springfield",@"Indianapolis",@"Des Moines",@"Topeka",@"Frankfort",@"Baton Rouge",@"Augusta",@"Annapolis",@"Boston",@"Lansing",@"St. Paul",@"Jackson",@"Jefferson City",@"Helena",@"Lincoln",@"Carson City",@"Concord",@"Trenton",@"Santa Fe",@"Albany",@"Raleigh",@"Bismarck",@"Columbus",@"Oklahoma City",@"Salem",@"Harrisburg",@"Providence",@"Columbia",@"Pierre",@"Nashville",@"Austin",@"Salt Lake City",@"Montpelier",@"Richmond",@"Olympia",@"Charleston",@"Madison",@"Cheyenne"];

    NSString *correctState = @"";
    NSString *correctCapital = @"";
    for (NSInteger i =0; i<[states count]; i++) {
        NSString *state = states[i];
        NSString *capital = capitals[i];
        NSMutableArray *stateCharacters = [[NSMutableArray alloc] initWithCapacity:[state length]];
        for (NSInteger j=0; j < [state length]; j++) {
            NSString *ichar  = [NSString stringWithFormat:@"%c", [state characterAtIndex:j]];
            [stateCharacters addObject:ichar];
        }
        NSMutableArray *capitalCharacters = [[NSMutableArray alloc] initWithCapacity:[capital length]];
        for (NSInteger j=0; j < [capital length]; j++) {
            NSString *ichar  = [NSString stringWithFormat:@"%c", [capital characterAtIndex:j]];
            [capitalCharacters addObject:ichar];
        }

        BOOL found = YES;
        for (NSInteger j=0; j < [stateCharacters count]; j++) {
            if ([capitalCharacters containsObject:stateCharacters[j]]) {
                found=NO;
            }
        }
        if (found) {
            correctState=state;
            correctCapital=capital;
        }
    }

    NSLog(@"%@ %@",correctState, correctCapital);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
@end
