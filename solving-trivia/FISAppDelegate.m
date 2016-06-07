//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSString *answer = [self solveTrivia];
    return YES;
}

- (NSString *)solveTrivia{
    NSString *answer;
    NSDictionary *StatesAndCapitals  =@{
                                        @"Alabama"      : @"Montgomery",
                                        @"Montana"      : @"Helena" ,
                                        @"Alaska"	    : @"Juneau",
                                        @"Nebraska"     :	@"Lincoln",
                                        @"Arizona"	    : @"Phoenix",
                                        @"Nevada"	    : @"Carson City",
                                        @"Arkansas"     : @"Little Rock",
                                        @"New Hampshire":@"Concord",
                                        @"California"	: @"Sacramento",
                                        @"New Jersey"	: @"Trenton",
                                        @"Colorado"     : @"Denver",
                                        @"New Mexico"	: @"Santa Fe",
                                        @"Connecticut"	: @"Hartford",
                                        @"New York"     : @"Albany",
                                        @"Delaware"     : @"Dover",
                                        @"North Carolina": @"Raleigh",
                                        @"Florida"      : @"Tallahassee",
                                        @"North Dakota"	: @"Bismarck",
                                        @"Georgia"      : @"Atlanta",
                                        @"Ohio"         : @"Columbus",
                                        @"Hawaii"       : @"Honolulu",
                                        @"Oklahoma"     : @"Oklahoma City",
                                        @"Idaho"        : @"Boise",
                                        @"Oregon"       : @"Salem",
                                        @"Illinois"     : @"Springfield",
                                        @"Pennsylvania"	: @"Harrisburg",
                                        @"Indiana"      : @"Indianapolis",
                                        @"Rhode Island"	: @"Providence",
                                        @"Iowa"         : @"Des Moines",
                                        @"South Carolina": @"Columbia",
                                        @"Kansas"       : @"Topeka",
                                        @"South Dakota" : @"Pierre",
                                        @"Kentucky"     : @"Frankfort",
                                        @"Tennessee"	: @"Nashville",
                                        @"Louisiana"	: @"Baton Rouge",
                                        @"Texas"        : @"Austin",
                                        @"Maine"        : @"Augusta",
                                        @"Utah"         : @"Salt Lake City",
                                        @"Maryland"     : @"Annapolis",
                                        @"Vermont"      : @"Montpelier",
                                        @"Massachusetts": @"Boston",
                                        @"Virginia"     : @"Richmond",
                                        @"Michigan"     : @"Lansing",
                                        @"Washington"	: @"Olympia",
                                        @"Minnesota	St.": @"Paul",
                                        @"West Virginia": @"Charleston",
                                        @"Mississippi"	: @"Jackson",
                                        @"Wisconsin"	: @"Madison",
                                        @"Missouri"     : @"Jefferson City",
                                        @"Wyoming"      : @"Cheyenne", };
    
    for (NSString *key in StatesAndCapitals){
        
        NSMutableArray *stateCharacters = [[NSMutableArray alloc] initWithCapacity:[key length]];
        NSMutableArray *captialCharacters = [[NSMutableArray alloc] initWithCapacity:[StatesAndCapitals[key] length]];
        
        for (NSUInteger i=0; i < [key length]; i++) {
            NSString *individualStateChar  = [NSString stringWithFormat:@"%c", [key characterAtIndex:i]];
            [stateCharacters addObject:[individualStateChar lowercaseString]];
        }
        
        for (NSUInteger i=0; i < [StatesAndCapitals[key] length]; i++) {
            NSString *individualCapitalChar  = [NSString stringWithFormat:@"%c", [StatesAndCapitals[key] characterAtIndex:i]];
            
            [captialCharacters addObject:[individualCapitalChar lowercaseString]];
            
        }
        

            NSArray *originalCapitalCharacters = [captialCharacters copy];
        
            [captialCharacters removeObjectsInArray:stateCharacters];
        if ([captialCharacters isEqualToArray:originalCapitalCharacters]){
            answer = key;
            NSLog(@"%@+++++++++++++++++++++++++++++++++" , key);
        }
     
        }
        return answer;
        NSLog(@"%@------------------------------------------", answer);
}



@end
