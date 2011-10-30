//
//  PQGlobalNotifications.h
//  PQSeptember
//
//  Created by April Blaine on 9/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PQGlobalNotifications : NSObject

extern NSString * const PQSceneChangeRequestedNotification;
extern NSString * const PQSongInfoViewRequested;
extern NSString * const PQSongInfoViewExchangeRequested;
extern NSString * const PQSongInfoViewDismissed;
extern NSString * const PQLobbyStartRequestedNotification;
extern NSString * const PQLobbyQuitRequestedNotification;
extern NSString * const startTabsString;
extern NSString * const lobbyTabsString;
extern NSString * const joinLobbyString;
extern NSString * const hostLobbyString;
extern NSString * const requestedSceneString;
extern NSString * const transitionStyleString;
extern NSString * const isLocalString;
extern NSString * const isYES;
extern NSString * const isNO;
extern NSString * const libraryIDString;

@end
