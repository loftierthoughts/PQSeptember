//
//  PQGlobalNotifications.m
//  PQSeptember
//
//  Created by April Blaine on 9/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PQGlobalNotifications.h"

NSString * const PQSceneChangeRequestedNotification = @"PQ Scene Change Requested";
NSString * const PQSongInfoViewRequested = @"PQ Song Info View Requested";
NSString * const PQLobbyStartRequestedNotification = @"PQ Lobby Start Requested";
NSString * const PQLobbyQuitRequestedNotification = @"PQ Lobby Quit Requested";
NSString * const startTabsString = @"startTabs";
NSString * const lobbyTabsString = @"lobbyTabs";
NSString * const joinLobbyString = @"joinLobby";
NSString * const hostLobbyString = @"hostLobby";
NSString * const requestedSceneString = @"requestedScene";
NSString * const transitionStyleString = @"transitionStyle";
NSString * const isLocalString = @"isLocal";
NSString * const isYES = @"YES";
NSString * const isNO = @"YES";
NSString * const libraryIDString = @"libraryID";

@implementation PQGlobalNotifications

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

@end
