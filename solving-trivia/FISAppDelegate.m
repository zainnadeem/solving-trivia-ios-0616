//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSString *)solveTrivia {
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

@end
