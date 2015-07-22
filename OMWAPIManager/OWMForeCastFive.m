//
//  ForeCastFive.m
//  APIManager
//
//  Created by Darshan Patel on 7/10/15.
//  Copyright (c) 2015 Darshan Patel. All rights reserved.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 Darshan Patel
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "OWMForeCastFive.h"

@implementation OWMForeCastFive
- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.city =[[FCFCity alloc] initWithAttributes:attributes[@"city"]];
    self.cod =[[attributes valueForKeyPath:@"cod"] integerValue];
    self.message =[[attributes valueForKeyPath:@"message"] doubleValue];
    self.cnt =[[attributes valueForKeyPath:@"cnt"] integerValue];
    self.list =[self list:attributes];
    
    return self;
}
-(NSMutableArray *)list:(NSDictionary *)info
{
    NSArray *tempList =info[@"list"];
    
    NSMutableArray *arrList = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[tempList count]; i++) {
        
        FCFList *list =[[FCFList alloc] initWithAttributes:tempList[i]];
        [arrList addObject:list];
    }
    
    return arrList;
}
+ (void)doFetchForeCastFiveByCityName:(NSString *)cityName
                            withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block
{
    NSAssert(cityName, @"Please specify City Name");
    
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:cityName forKey:@"q"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    [[OWMAPIClient sharedClient] GET:@"forecast" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMForeCastFive *forcast = [[OWMForeCastFive alloc] initWithAttributes:JSON];
            
            if (block) {
                block(forcast, nil);
            }
            
        }else
        {
            NSError *error =[[NSError alloc] initWithDomain:NSOWMERRORDOMAIN code:[JSON[@"cod"] integerValue] userInfo:JSON];
            
            if (block) {
                block(nil, error);
            }
            
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
        if (block) {
            block(nil, error);
        }
    }];

}

+ (void)doFetchForeCastFiveByCityName:(NSString *)cityName
                          withCountry:(NSString *)countryCode
                            withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block
{
    NSAssert(cityName, @"Please specify City Name");
    NSAssert(countryCode, @"Please specify Country Code");
    
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:[NSString stringWithFormat:@"%@,%@",cityName,countryCode] forKey:@"q"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    [[OWMAPIClient sharedClient] GET:@"forecast" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMForeCastFive *forcast = [[OWMForeCastFive alloc] initWithAttributes:JSON];
            
            if (block) {
                block(forcast, nil);
            }
        }else
        {
            NSError *error =[[NSError alloc] initWithDomain:NSOWMERRORDOMAIN code:[JSON[@"cod"] integerValue] userInfo:JSON];
            
            if (block) {
                block(nil, error);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
        if (block) {
            block(nil, error);
        }
    }];

}

+ (void)doFetchForeCastFiveByCityID:(NSString *)cityID
                          withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block
{
    NSAssert(cityID, @"Please specify City ID");
    
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:cityID forKey:@"id"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    [[OWMAPIClient sharedClient] GET:@"forecast" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMForeCastFive *forcast = [[OWMForeCastFive alloc] initWithAttributes:JSON];
            
            if (block) {
                block(forcast, nil);
            }
        }else
        {
            NSError *error =[[NSError alloc] initWithDomain:NSOWMERRORDOMAIN code:[JSON[@"cod"] integerValue] userInfo:JSON];
            
            if (block) {
                block(nil, error);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
        if (block) {
            block(nil, error);
        }
    }];
}

+ (void)doFetchForeCastFiveByCoordinates:(CLLocationCoordinate2D )coordinate
                               withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block
{
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:[NSNumber numberWithDouble:coordinate.latitude] forKey:@"lat"];
    [params setObject:[NSNumber numberWithDouble:coordinate.longitude] forKey:@"lon"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    
    [[OWMAPIClient sharedClient] GET:@"forecast" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMForeCastFive *forcast = [[OWMForeCastFive alloc] initWithAttributes:JSON];
            
            if (block) {
                block(forcast, nil);
            }
        }else
        {
            NSError *error =[[NSError alloc] initWithDomain:NSOWMERRORDOMAIN code:[JSON[@"cod"] integerValue] userInfo:JSON];
            
            if (block) {
                block(nil, error);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
        if (block) {
            block(nil, error);
        }
    }];

}

+ (void)doFetchForeCastFiveByParams:(NSDictionary *)params
                          withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block
{
    NSAssert(params, @"Please specify Parameters");
 
    NSMutableDictionary *newParams =[[NSMutableDictionary alloc] initWithDictionary:params];
    [newParams setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    [[OWMAPIClient sharedClient] GET:@"weather" parameters:newParams success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMForeCastFive *forcast = [[OWMForeCastFive alloc] initWithAttributes:JSON];
            
            if (block) {
                block(forcast, nil);
            }
        }else
        {
            NSError *error =[[NSError alloc] initWithDomain:NSOWMERRORDOMAIN code:[JSON[@"cod"] integerValue] userInfo:JSON];
            
            if (block) {
                block(nil, error);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        
        if (block) {
            block(nil, error);
        }
    }];

}
@end
