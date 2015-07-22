//
//  OWMCurrentWeather.m
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

#import "OWMCurrentWeather.h"

@implementation OWMCurrentWeather

- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.coord = CLLocationCoordinate2DMake([attributes[@"coord"][@"lat"] doubleValue], [attributes[@"coord"][@"lon"] doubleValue]);
    
    self.base = [attributes valueForKeyPath:@"base"];
    
    self.visibility = [[attributes valueForKeyPath:@"visibility"] integerValue];
    
    self.OWMId = [[attributes valueForKeyPath:@"id"] integerValue];
    
    self.dtTimeStemps = [[attributes valueForKeyPath:@"dt"] integerValue];
    
    self.name = [attributes valueForKeyPath:@"name"];
    
    self.cod = [[attributes valueForKeyPath:@"cod"] integerValue];
    
    self.main =[[CWMain alloc] initWithAttributes:attributes[@"main"]];
    
    self.wind =[[CWWind alloc] initWithAttributes:attributes[@"wind"]];
    
    self.clouds =[[CWClouds alloc] initWithAttributes:attributes[@"clouds"]];
    
    self.sys =[[CWSys alloc] initWithAttributes:attributes[@"sys"]];
    
    self.dt = [NSDate dateWithTimeIntervalSince1970:[[attributes valueForKeyPath:@"dt"] integerValue]];
    
    self.weathers =[self Weathers:attributes];
    
    return self;
}
-(NSMutableArray *)Weathers:(NSDictionary *)info
{
    NSArray *tempWeather =info[@"weather"];
    
    NSMutableArray *arrWeather = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[tempWeather count]; i++) {
        
        CWWeather *weather =[[CWWeather alloc] initWithAttributes:tempWeather[i]];
        [arrWeather addObject:weather];
    }
    
    return arrWeather;
}
+ (void)doFetchWeatherByCityName:(NSString *)cityName
                       withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block
{
    
    NSAssert(cityName, @"Please specify City Name");

    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:cityName forKey:@"q"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    
    [[OWMAPIClient sharedClient] GET:@"weather" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMCurrentWeather *currentWeather = [[OWMCurrentWeather alloc] initWithAttributes:JSON];
            
            if (block) {
                block(currentWeather, nil);
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


+ (void)doFetchWeatherByCityName:(NSString *)cityName
                     withCountry:(NSString *)countryCode
                       withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block
{
  
    NSAssert(cityName, @"Please specify City Name");
    NSAssert(countryCode, @"Please specify Country Code");
    
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:[NSString stringWithFormat:@"%@,%@",cityName,countryCode] forKey:@"q"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    
    [[OWMAPIClient sharedClient] GET:@"weather" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMCurrentWeather *currentWeather = [[OWMCurrentWeather alloc] initWithAttributes:JSON];
            
            if (block) {
                block(currentWeather, nil);
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

+ (void)doFetchWeatherByCityID:(NSString *)cityID
                     withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block
{
    NSAssert(cityID, @"Please specify City ID");
    
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:cityID forKey:@"id"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    
    [[OWMAPIClient sharedClient] GET:@"weather" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMCurrentWeather *currentWeather = [[OWMCurrentWeather alloc] initWithAttributes:JSON];
            
            if (block) {
                block(currentWeather, nil);
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

+ (void)doFetchWeatherByCoordinates:(CLLocationCoordinate2D )coordinate
                          withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block
{
    
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:[NSNumber numberWithDouble:coordinate.latitude] forKey:@"lat"];
    [params setObject:[NSNumber numberWithDouble:coordinate.longitude] forKey:@"lon"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    
    
    [[OWMAPIClient sharedClient] GET:@"weather" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMCurrentWeather *currentWeather = [[OWMCurrentWeather alloc] initWithAttributes:JSON];
            
            if (block) {
                block(currentWeather, nil);
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

+ (void)doFetchWeatherByZipCode:(NSString *)zipCode
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block
{
    NSAssert(zipCode, @"Please specify ZipCode");
    
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:zipCode forKey:@"zip"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    
    [[OWMAPIClient sharedClient] GET:@"weather" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMCurrentWeather *currentWeather = [[OWMCurrentWeather alloc] initWithAttributes:JSON];
            
            if (block) {
                block(currentWeather, nil);
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

+ (void)doFetchWeatherByZipCode:(NSString *)zipCode
                    withCountry:(NSString *)countryCode
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block
{
    NSAssert(zipCode, @"Please specify ZipCode");
    NSAssert(countryCode, @"Please specify Country Code");
    
    
    NSMutableDictionary *params =[[NSMutableDictionary alloc] init];
    [params setObject:[NSString stringWithFormat:@"%@,%@",zipCode,countryCode] forKey:@"zip"];
    [params setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    
    [[OWMAPIClient sharedClient] GET:@"weather" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMCurrentWeather *currentWeather = [[OWMCurrentWeather alloc] initWithAttributes:JSON];
            
            if (block) {
                block(currentWeather, nil);
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

+ (void)doFetchWeatherByParams:(NSDictionary *)params
                     withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block
{
    NSAssert(params, @"Please specify Parameters");
    
    NSMutableDictionary *newParams =[[NSMutableDictionary alloc] initWithDictionary:params];
    [newParams setObject:[OWMAPISetup shareManager].Api_Key forKey:@"APPID"];
    
    [[OWMAPIClient sharedClient] GET:@"weather" parameters:newParams success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        if ([JSON[@"cod"] integerValue] == 200) {
            
            OWMCurrentWeather *currentWeather = [[OWMCurrentWeather alloc] initWithAttributes:JSON];
            
            if (block) {
                block(currentWeather, nil);
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
