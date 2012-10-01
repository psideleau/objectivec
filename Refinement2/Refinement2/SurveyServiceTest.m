//
//  SurveyServiceTest.m
//  PanelistApplication
//
//  Created by Paul Sideleau on 9/30/12.
//
//

#import "SurveyServiceTest.h"
#import "SurveyService.h"
#import <Foundation/Foundation.h>
@implementation SurveyServiceTest
- (void) testGetRefinementQuestions
{
    SurveyService* service = [SurveyService alloc];
    NSDictionary* map = [service getRefinementQuestions];
    
    NSArray* keys = [map allKeys];
    
    for (NSString* key in keys)
    {
        NSLog(@"%@", key);
    }
}
@end
