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

// register for notifications
- (void)registerForSceneChangeRequestNotifications;
- (void)registerForSongInfoViewRequestNotifications;
- (void)registerForLobbyNotifications;

// notification execution methods
- (void)requestSceneChange:(NSNotification *)notification;
- (void)startLobby:(NSNotification *)notification;
- (void)quitLobby:(NSNotification *)notification;
- (void)requestSongInfoView:(NSNotification *)notification;

// view transition methods
- (void)changeToViewControllerByName:(NSString *)viewControllerName;
- (void)changeToViewControllerByName:(NSString *)viewControllerName withAnimation:(UIViewAnimationTransition)someAnimation;
- (void)changeToViewController:(UIViewController *)viewController withTransition:(UIViewAnimationTransition)transition quickQueue:(BOOL)showQuickQueue;

// song info view
- (void)showLocalSongInfoViewFor:(NSUInteger)libraryID;

@end
