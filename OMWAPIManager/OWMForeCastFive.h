//
//  ForeCastFive.h
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
#import "FCFCity.h"
#import "FCFList.h"
#import "OWMHeader.h"



@class FCFCity;
@class FCFList;

@interface OWMForeCastFive : NSObject

@property (nonatomic,strong) FCFCity *city;
@property (nonatomic,assign) NSInteger cod;
@property (nonatomic,assign) double message;
@property (nonatomic,assign) NSInteger cnt;
@property (nonatomic,strong) NSArray *list;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (void)doFetchForeCastFiveByCityName:(NSString *)cityName
                       withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block;

+ (void)doFetchForeCastFiveByCityName:(NSString *)cityName
                     withCountry:(NSString *)countryCode
                       withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block;

+ (void)doFetchForeCastFiveByCityID:(NSString *)cityID
                     withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block;

+ (void)doFetchForeCastFiveByCoordinates:(CLLocationCoordinate2D )coordinate
                          withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block;

+ (void)doFetchForeCastFiveByParams:(NSDictionary *)params
                     withBlock:(void (^)(OWMForeCastFive *forcast, NSError *error))block;



@end
