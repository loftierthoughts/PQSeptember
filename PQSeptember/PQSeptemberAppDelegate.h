//
//  PQSeptemberAppDelegate.h
//  PQSeptember
//
//  Created by April Blaine on 9/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Start_StartView.h"
#import "HostLobbyView.h"
#import "JoinLobbyView.h"

@interface PQSeptemberAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *startTabs;
@property (nonatomic, retain) IBOutlet UITabBarController *lobbyTabs;
@property (nonatomic, retain) IBOutlet HostLobbyView *hostLobbyView;
@property (nonatomic, retain) IBOutlet JoinLobbyView *joinLobbyView;
@property (nonatomic, retain) UIViewController *currentViewController;
@property (nonatomic, assign) BOOL infoViewCurrentlyShowing;

@end
