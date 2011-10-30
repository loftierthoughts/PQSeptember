//
//  PQSeptemberAppDelegate.m
//  PQSeptember
//
//  Created by April Blaine on 9/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PQSeptemberAppDelegate.h"
#import "QuickQueueView.h"
#import "SongInfoView.h"

@interface PQSeptemberAppDelegate (Private)

- (void)requestLobbyTabs:(NSNotification *)notification;
- (void)requestStartTabs:(NSNotification *)notification;

@end

@implementation PQSeptemberAppDelegate

@synthesize window = _window;
@synthesize startTabs = _startTabs;
@synthesize lobbyTabs = _lobbyTabs;
@synthesize hostLobbyView = _hostLobbyView;
@synthesize joinLobbyView = _joinLobbyView;
@synthesize currentViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    self.window.rootViewController = self.startTabs;
    self.currentViewController = self.startTabs;
    [self.window makeKeyAndVisible];
    [self registerForSceneChangeRequestNotifications];
    [self registerForSongInfoViewRequestNotifications];
    [self registerForLobbyNotifications];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_window release];
    [_startTabs release];
    [_lobbyTabs release];
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

// REGISTER FOR NOTIFICATIONS

- (void)registerForSceneChangeRequestNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(requestSceneChange:)
                                                 name:PQSceneChangeRequestedNotification
                                               object:nil];
    
}

- (void)registerForSongInfoViewRequestNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(requestSongInfoView:)
                                                 name:PQSongInfoViewRequested
                                               object:nil];
}

- (void)registerForLobbyNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(startLobby:)
                                                 name:PQLobbyStartRequestedNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(quitLobby:)
                                                 name:PQLobbyQuitRequestedNotification
                                               object:nil];
}

// NOTIFICATION EXECUTION METHODS

- (void)requestSceneChange:(NSNotification *)notification
{
    NSLog(@"NOTIFICATION DETAILS: name - %@ | object - %@ | user info - %@",notification.name, notification.object, notification.userInfo);
    if ([notification.userInfo objectForKey:transitionStyleString] != nil)
    {
        [self changeToViewControllerByName:[notification.userInfo objectForKey:requestedSceneString]
                             withAnimation:(UIViewAnimationTransition)[(NSNumber *)[notification.userInfo objectForKey:transitionStyleString] intValue]];
    }
         else
    [self changeToViewControllerByName:[notification.userInfo objectForKey:requestedSceneString]];
}

- (void)startLobby:(NSNotification *)notification
{
    NSLog(@"NOTIFICATION DETAILS: name - %@ | object - %@ | user info - %@",notification.name, notification.object, notification.userInfo);
    NSLog(@"LOBBY STARTED");
}

- (void)quitLobby:(NSNotification *)notification
{
    NSLog(@"NOTIFICATION DETAILS: name - %@ | object - %@ | user info - %@",notification.name, notification.object, notification.userInfo);
    [self.lobbyTabs setSelectedViewController:[self.lobbyTabs.viewControllers objectAtIndex:0]];
    [[NSNotificationCenter defaultCenter] postNotificationName:PQSceneChangeRequestedNotification 
                                                        object:self 
                                                      userInfo:[NSDictionary dictionaryWithObject:startTabsString forKey:requestedSceneString]];
    NSLog(@"LOBBY EXITED");
    [self.startTabs setSelectedViewController:[self.startTabs.viewControllers objectAtIndex:0]];
}

- (void)requestSongInfoView:(NSNotification *)notification
{
    NSLog(@"NOTIFICATION DETAILS: name - %@ | object - %@ | user info - %@",notification.name, notification.object, notification.userInfo);
    if ([[notification.userInfo objectForKey:isLocalString] isEqualToString:isYES])
    {
        NSUInteger libraryID = [(NSNumber *)[notification.userInfo objectForKey:libraryIDString] intValue];
        [self showLocalSongInfoViewFor:libraryID];
    }
}

// VIEW TRANSITION METHODS

- (void)changeToViewControllerByName:(NSString *)viewControllerName
{
    if ([viewControllerName isEqualToString:lobbyTabsString])
    {
        [self changeToViewController:self.lobbyTabs
                      withTransition:UIViewAnimationTransitionCurlUp
                          quickQueue:YES];
    }
    else if ([viewControllerName isEqualToString:startTabsString])
    {
        [self changeToViewController:self.startTabs
                      withTransition:UIViewAnimationTransitionCurlDown
                          quickQueue:NO];
    }
    else if ([viewControllerName isEqualToString:hostLobbyString])
    {
        [self changeToViewController:self.hostLobbyView
                      withTransition:UIViewAnimationTransitionCurlUp
                          quickQueue:NO];
    }
    else if ([viewControllerName isEqualToString:joinLobbyString])
    {
        [self changeToViewController:self.joinLobbyView
                      withTransition:UIViewAnimationTransitionCurlUp
                          quickQueue:NO];
    }
}


- (void)changeToViewControllerByName:(NSString *)viewControllerName withAnimation:(UIViewAnimationTransition)someAnimation
{
    if ([viewControllerName isEqualToString:lobbyTabsString])
    {
        [self changeToViewController:self.lobbyTabs
                      withTransition:someAnimation
                          quickQueue:YES];
    }
    else if ([viewControllerName isEqualToString:startTabsString])
    {
        [self changeToViewController:self.startTabs
                      withTransition:someAnimation
                          quickQueue:NO];
    }
    else if ([viewControllerName isEqualToString:hostLobbyString])
    {
        [self changeToViewController:self.hostLobbyView
                      withTransition:someAnimation
                          quickQueue:NO];
    }
    else if ([viewControllerName isEqualToString:joinLobbyString])
    {
        [self changeToViewController:self.joinLobbyView
                      withTransition:someAnimation
                          quickQueue:NO];
    }
}

- (void)changeToViewController:(UIViewController *)viewController withTransition:(UIViewAnimationTransition)transition quickQueue:(BOOL)showQuickQueue
{
    for (UIView *aView in [self.window subviews]){
        [aView removeFromSuperview];
    }
    [UIView beginAnimations:@"animateSceneChange" context:nil];
    [UIView setAnimationDuration:0.6];
    [UIView setAnimationTransition:transition forView:self.window cache:NO];
    [self.window addSubview:viewController.view];
    [UIView commitAnimations];
    if (showQuickQueue)
    {
    QuickQueueView *quickQueue;
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"QuickQueueView" owner:nil options:nil];
    for (id currentObject in topLevelObjects)
    {
        if ([currentObject isKindOfClass:[QuickQueueView class]])
        {
            quickQueue = (QuickQueueView *)currentObject;
            break;
        }
    }
    [self.window addSubview:quickQueue];
    // THIS ENSURES ITS HIDDEN
    [quickQueue hideQuickQueue];
    }
}

- (void)showLocalSongInfoViewFor:(NSUInteger)libraryID
{
    NSLog(@"Song Info Requested For: %u",libraryID);
    /*
    SongInfoView *songInfoView;
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"SongInfoView" owner:nil options:nil];
    for (id currentObject in topLevelObjects)
    {
        if ([currentObject isKindOfClass:[SongInfoView class]])
        {
            songInfoView = (QuickQueueView *)currentObject;
            break;
        }
    }
    [self.window addSubview:songInfoView];
     */
}

@end