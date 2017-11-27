//  weibo: http://weibo.com/xiaoqing28
//  blog:  http://www.alonemonkey.com
//
//  DingTalkDylib.m
//  DingTalkDylib
//
//  Created by 易万军 on 2017/11/27.
//  Copyright (c) 2017年 易万军. All rights reserved.
//

#import "DingTalkDylib.h"
#import <CaptainHook/CaptainHook.h>
#import <UIKit/UIKit.h>
#import <Cycript/Cycript.h>
#import <CoreLocation/CoreLocation.h>

static __attribute__((constructor)) void entry(){
    NSLog(@"\n               🎉!!！congratulations!!！🎉\n👍----------------insert dylib success----------------👍");
    
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        
        CYListenServer(6666);
    }];
}

CHDeclareClass(CLLocation);

CHOptimizedMethod0(self, CLLocationCoordinate2D, CLLocation, coordinate){
    
    return CLLocationCoordinate2DMake(39.961406, 116.459954);
}

CHConstructor{
    CHLoadLateClass(CLLocation);
    CHClassHook(0, CLLocation, coordinate);
}

CHDeclareClass(AMapGeoFenceManager);
CHMethod(0, BOOL,AMapGeoFenceManager,detectRiskOfFakeLocation){
    
    return NO;
}
CHMethod(0, BOOL,AMapGeoFenceManager,pausesLocationUpdatesAutomatically){
    
    return NO;
}
CHConstructor{
    CHLoadLateClass(AMapGeoFenceManager);
    CHClassHook(0, AMapGeoFenceManager,detectRiskOfFakeLocation);
    CHClassHook(0, AMapGeoFenceManager,pausesLocationUpdatesAutomatically);
}




CHDeclareClass(AMapLocationManager);
CHMethod(0, BOOL,AMapLocationManager,detectRiskOfFakeLocation){
    
    return NO;
}
CHMethod(0, BOOL,AMapLocationManager,pausesLocationUpdatesAutomatically){
    
    return NO;
}
CHConstructor{
    CHLoadLateClass(AMapLocationManager);
    CHClassHook(0, AMapLocationManager,detectRiskOfFakeLocation);
    CHClassHook(0, AMapLocationManager,pausesLocationUpdatesAutomatically);
}





CHDeclareClass(DTALocationManager);
CHMethod(0, BOOL,DTALocationManager,detectRiskOfFakeLocation){
    
    return NO;
}
CHMethod(0, BOOL,DTALocationManager,dt_pausesLocationUpdatesAutomatically){
    
    return NO;
}
CHConstructor{
    CHLoadLateClass(DTALocationManager);
    CHClassHook(0, DTALocationManager,detectRiskOfFakeLocation);
    CHClassHook(0, DTALocationManager,dt_pausesLocationUpdatesAutomatically);
}
@interface CustomViewController

-(NSString*)getMyName;

@end

CHDeclareClass(CustomViewController)

CHOptimizedMethod(0, self, NSString*, CustomViewController,getMyName){
    //get origin value
    NSString* originName = CHSuper(0, CustomViewController, getMyName);
    
    NSLog(@"origin name is:%@",originName);
    
    //get property
    NSString* password = CHIvar(self,_password,__strong NSString*);
    
    NSLog(@"password is %@",password);
    
    //change the value
    return @"AloneMonkey";
    
}

CHConstructor{
    CHLoadLateClass(CustomViewController);
    CHClassHook(0, CustomViewController, getMyName);
}

