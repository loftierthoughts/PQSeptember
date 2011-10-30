//
//  LobbyViewDelegate.h
//  PQSeptember
//
//  Created by April Blaine on 9/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LobbyViewDelegate : UIViewController

@end

@protocol LobbyViewDelegate

- (IBAction)hostLobbyButtonPushed:(id)sender;
- (IBAction)joinLobbyButtonPushed:(id)sender;

@end
