//
//  SurveyService.m
//  PanelistApplication
//
//  Created by Paul Sideleau on 9/29/12.
//
//

#import "SurveyService.h"
#import "JSON.h"
#import <Foundation/Foundation.h>

@implementation SurveyService
- (NSDictionary *)getRefinementQuestions
{
    //[request setValue:@"application/json" forHTTPHeaderField:@"accept"];
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:@"257", @"subpanelid",
                            @"94mUddoHeesLCbSDjAiUMg**", @"psid", nil];
    return [self callWebservice:@"https://qaproxy.surveysampling.com/projects/prefine" WithParameters:params];
}

- (void)helloWorld
{
    
}

-(NSDictionary *) submitRefinmentQuestions
{
    return [NSDictionary alloc];
}

-(NSDictionary *)callWebservice:(NSString*)urlParam WithParameters:(NSDictionary *)parameters {
    // Create the complete url, including any parameters, as a string
    NSString *urlString = [self addQueryStringToUrl:[NSString stringWithFormat:@"%@", urlParam] withParameters:parameters];
    NSLog(@"%@", urlString);
    // Create a Url from the string url
    NSURL *url = [NSURL URLWithString:urlString];
    
    // Make the webservice call
    NSDictionary *results = [self objectWithUrl:url];
    
    return results;
}
-(NSString *)addQueryStringToUrl:(NSString *)url withParameters:(NSDictionary *)parameters {
    // Create a placeholder, initalise with the url
    NSMutableString *urlWithQuerystring = [[NSMutableString alloc] initWithString:url];
	
    // Convert the params into a query string
    // If there are parameters
	if (parameters) {
        // Fast Iterate through the parameters
		for(id key in parameters) {
            // Get the key
			NSString *sKey = [key description];
            // Get the value
			NSString *sValue = [[parameters objectForKey:key] description];
            
			// Determine whether to add ?key=value or &key=value ?
			if ([urlWithQuerystring rangeOfString:@"?"].location == NSNotFound) {
                // Add ?key=value
				[urlWithQuerystring appendFormat:@"?%@=%@", sKey, sValue];
			} else {
                // Add &key=value
				[urlWithQuerystring appendFormat:@"&%@=%@", sKey, sValue];
			}
		}
	}
    
	return urlWithQuerystring;
}
-(NSDictionary *)objectWithUrl:(NSURL *)url {
	// JSON Parser
	SBJSON *parser = [SBJSON new];
	
	// Get the JSON string from the server
	NSString *jsonString = [self stringWithUrl:url withCount:0];
    NSLog(@"%@", jsonString);
    
	// Parse the JSON string into an Object
	NSDictionary *result = (NSDictionary *)[parser objectWithString:jsonString error:NULL];
	
	return result;
}

-(NSString *)stringWithUrl:(NSURL *)url withCount:(int) count{
	NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    
    
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"accept"];
    [urlRequest setValue:@"pauluseragent" forHTTPHeaderField:@"user-agent"];
	// Fetch JSON response
	NSData *urlData;
	NSURLResponse *response;
	NSError *requestError;
	
	// Make synchronous request
	urlData = [NSURLConnection sendSynchronousRequest:urlRequest
									returningResponse:&response
												error:&requestError];
	
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*) response;

    NSDictionary *responseHeaders = [httpResponse allHeaderFields];
    
    for (NSString *key in [responseHeaders allKeys])
    {
        NSLog(@"%@", key); 
    }
    
    NSLog(@"%@", [responseHeaders valueForKey:@"set-cookie"]);
    
    NSArray *cookies = [NSHTTPCookie cookiesWithResponseHeaderFields:responseHeaders forURL:url];
    
    for (NSHTTPCookie *cookie in cookies) {
       NSLog(@"%@", cookie.name);
        NSLog(@"%@", cookie.value);
        NSLog(@"%@", cookie.path);
    }
    
    if (count == 0)
    {
        count = 1;
        [self stringWithUrl:url withCount:count];
    }
    
    
	return [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
}

@end
