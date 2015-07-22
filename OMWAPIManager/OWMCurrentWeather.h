//
//  OWMCurrentWeather.h
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

#import <Foundation/Foundation.h>
#import "OWMHeader.h"
#import <CoreLocation/CoreLocation.h>



@class CWMain;
@class CWSys;
@class CWWeather;
@class CWWind;
@class CWClouds;

@interface OWMCurrentWeather : NSObject

@property (nonatomic,assign) CLLocationCoordinate2D coord;
@property (nonatomic,strong) NSArray *weathers;
@property (nonatomic,strong) NSString *base;
@property (nonatomic,strong) CWMain *main; 
@property (nonatomic,assign) NSInteger visibility;
@property (nonatomic,strong) CWWind *wind;
@property (nonatomic,strong) CWClouds *clouds;
@property (nonatomic,strong) NSDate *dt;
@property (nonatomic,assign) NSInteger dtTimeStemps;
@property (nonatomic,strong) CWSys *sys; 
@property (nonatomic,assign) NSInteger OWMId;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) NSInteger cod;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (void)doFetchWeatherByCityName:(NSString *)cityName
                              withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;

+ (void)doFetchWeatherByCityName:(NSString *)cityName
                    withCountry:(NSString *)countryCode
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;

+ (void)doFetchWeatherByCityID:(NSString *)cityID
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;

+ (void)doFetchWeatherByCoordinates:(CLLocationCoordinate2D )coordinate
                    withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;

+ (void)doFetchWeatherByZipCode:(NSString *)zipCode
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;

+ (void)doFetchWeatherByZipCode:(NSString *)zipCode
                    withCountry:(NSString *)countryCode
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;

+ (void)doFetchWeatherByParams:(NSDictionary *)params
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;


@end
