//
//  FCDList.m
//  APIManager
//
//  Created by Darshan Patel on 7/14/15.
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

#import "FCDList.h"

@implementation FCDList
- (instancetype)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    
    self.dt= [[attributes valueForKeyPath:@"dt"] integerValue];
    self.dt_txt= [attributes valueForKeyPath:@"dt_txt"];
    self.temp =[[FCDTemp alloc] initWithAttributes:attributes[@"temp"]];
    self.clouds =[[attributes valueForKeyPath:@"clouds"] doubleValue];
    self.pressure =[[attributes valueForKeyPath:@"pressure"] doubleValue];
    self.speed =[[attributes valueForKeyPath:@"speed"] doubleValue];
    self.humidity =[[attributes valueForKeyPath:@"humidity"] doubleValue];
    self.deg =[[attributes valueForKeyPath:@"deg"] doubleValue];
    
    self.weather =[self Weathers:attributes];
    
    return self;
}
-(NSMutableArray *)Weathers:(NSDictionary *)info
{
    NSArray *tempWeather =info[@"weather"];
    
    NSMutableArray *arrWeather = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[tempWeather count]; i++) {
        
        FCDWeather *weather =[[FCDWeather alloc] initWithAttributes:tempWeather[i]];
        [arrWeather addObject:weather];
    }
    
    return arrWeather;
}

@end
