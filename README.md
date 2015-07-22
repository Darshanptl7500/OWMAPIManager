#OWMAPIManager

OWMAPIManager is an open-source iOS Objective-C library for fetching weather information [OpenWeatherMap][1] using simple blocks based API callbacks.

Its Main purpose is to use OpenWeatherMap API requests with ease in a less lines of code. 

This includes following:

 - [Current weather data][2] (Access current weather data for any location on Earth)
 - [5 day / 3 hour forecast][3] (5 day forecast informations)
 - [Call 16 day / daily forecast data][4]  (16 day forecasts/daily forecast informations)

##How To Use

###Cocoapods
OWMAPIManager is available in cocoapods. you can add it in your project as below

`pod "OWMAPIManager", "~> 1.0.1"`

### Manual (or using git submodule)
 1. Add [AFNetworking 2.0][4]
    - OWMAPIManager uses AFNetworking 2.0 so, you need to add AFNetworking in your project 
 2. Download source files from this repository
 3. Add all files from *OWMAPIManager* folder to your project's target

##Usage

You can take a look at the detailed example usage project *OWMAPIManagerExample/OWMAPIManagerExample.xcodeproj*.

#### 1. Import OWMAPIManager files in your implementation file

`#import "OWMHeader.h"`

#### 2. Setup OpenWeatherMap API key

In order to communicate with a OpenWeatherMap API, you must first generate your own API key. Please take a look at [Weather API][5].

You must provide API key to a `OWMAPIManager` before making any request using it.

//Open "AppDelegate.h" and set your API_KEY

`[[OWMAPISetup shareManager] setApi_Key:@"SETUP_API_KEY"];`

#### 3. Making a request & get Resonse

### Current weather data

There are below methods are available for getting current weather information.

```
+ (void)doFetchWeatherByCityName:(NSString *)cityName
                              withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block
```
```							  
+ (void)doFetchWeatherByCityName:(NSString *)cityName
                    withCountry:(NSString *)countryCode
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;
```					 
```
+ (void)doFetchWeatherByCityID:(NSString *)cityID
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;
```
```
+ (void)doFetchWeatherByCoordinates:(CLLocationCoordinate2D )coordinate
                    withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;
```
```
+ (void)doFetchWeatherByZipCode:(NSString *)zipCode
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;
```
```
+ (void)doFetchWeatherByZipCode:(NSString *)zipCode
                    withCountry:(NSString *)countryCode
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block;
```
```
+ (void)doFetchWeatherByParams:(NSDictionary *)params
                      withBlock:(void (^)(OWMCurrentWeather *weather, NSError *error))block
```
####Example:
- Fetch weather info by ZipCode

```
[OWMCurrentWeather doFetchWeatherByZipCode:@"380060" withBlock:^(OWMCurrentWeather *weather, NSError *error) {
         if (!error) {  
         }
     }];	 

```

Please check [OpenWeatherMap Current weather API][2] for request and resonse parameters.


##Compatibility

 - iOS 7.0+

##TODOs

- Add Example project on how to use this library.
- Write test cases for this library.

##Contact

OWMAPIManager is developed by [Darshan Patel](http://iosexception.com). Please [email](mailto:developer.ios89@gmail.com) to let me know you how you are using this library and anything related to this library.

##Contributing and notes

 - If you like this library, please consider giving it a Github star.

Pull requests are very welcome expecting you follow few rules:

 - Document your changes in a code comments and Git commit message
 - Please do make sure your changes don't trouble with any existing code

##Version history

#### 1.0 Initial Pre-release
- Added first version.

##License
The MIT License (MIT)

Copyright (c) 2015 Darshan Patel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.


  [1]:http://openweathermap.org/api
  [2]:http://openweathermap.org/current
  [3]:http://openweathermap.org/forecast5
  [4]:http://openweathermap.org/forecast16
  [5]:http://openweathermap.org/api
  
