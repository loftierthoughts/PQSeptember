//
//  QuickQueueView.m
//  CombinedViewTest
//
//  Created by April Blaine on 9/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "QuickQueueView.h"

// constants for interface tweaking
static NSTimeInterval DEFAULT_LABEL_CENTER_X = 160;
static NSTimeInterval DEFAULT_QUIT_CENTER_X = 22.5;
static NSTimeInterval DEFAULT_SKIP_CENTER_X = 160;
static NSTimeInterval DEFAULT_SKIP_CENTER_Y = 15;
static NSTimeInterval DEFAULT_LEFT_SIDE_INFO_X = 22;
static NSTimeInterval DEFAULT_RIGHT_SIDE_INFO_X = 299;
static NSTimeInterval TOP_QUIT_CENTER_Y = 47.5;
static NSTimeInterval BOTTOM_QUIT_CENTER_Y = 190;
static NSTimeInterval TOP_LABEL_CENTER_Y = 47.5;
static NSTimeInterval BOTTOM_LABEL_CENTER_Y = 188;
static NSTimeInterval LAST_PLAYED_LABEL_CENTER_Y = 75.5;
static NSTimeInterval NOW_PLAYING_LABEL_CENTER_Y = 105.5;
static NSTimeInterval UP_NEXT_1_LABEL_CENTER_Y = 135.5;
static NSTimeInterval UP_NEXT_2_LABEL_CENTER_Y = 165.5;
static NSTimeInterval UP_NEXT_3_LABEL_CENTER_Y = 195.5;
static NSTimeInterval QUICK_QUEUE_HIDDEN_ALPHA = 0.85;  
static NSTimeInterval DEFAULT_FRAME_BUFFER = 70;
static NSTimeInterval DEFAULT_SHOW_SPEED = 0.2;

@implementation QuickQueueView

@synthesize message, quitbutton, skipbutton, lastplayedinfobutton, nowplayinginfobutton, upnext1infobutton, upnext2infobutton, upnext3infobutton, votesleftlabel, upnext1label, upnext2label, upnext3label, nowplayinglabel, isShown;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)toggleQuickQueue:(id)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:DEFAULT_SHOW_SPEED];
    if (!self.isShown)
    {
        [self showQuickQueue];
    }
    else
    {
        [self hideQuickQueue];
    }
    [UIView commitAnimations];
}

- (void)hideQuickQueue
{
    CGRect frame = self.frame;
    frame.origin.y = -frame.size.height + DEFAULT_FRAME_BUFFER;
    self.quitbutton.center = CGPointMake(DEFAULT_QUIT_CENTER_X, BOTTOM_QUIT_CENTER_Y);
    self.votesleftlabel.center = CGPointMake(DEFAULT_LABEL_CENTER_X, TOP_LABEL_CENTER_Y);
    self.upnext3label.center = CGPointMake(DEFAULT_LABEL_CENTER_X, TOP_LABEL_CENTER_Y);
    self.upnext2label.center = CGPointMake(DEFAULT_LABEL_CENTER_X, TOP_LABEL_CENTER_Y);
    self.upnext1label.center = CGPointMake(DEFAULT_LABEL_CENTER_X, TOP_LABEL_CENTER_Y);
    self.nowplayinglabel.center = CGPointMake(DEFAULT_LABEL_CENTER_X, BOTTOM_LABEL_CENTER_Y);
    self.lastplayedinfobutton.center = CGPointMake(DEFAULT_LEFT_SIDE_INFO_X, TOP_LABEL_CENTER_Y);
    self.nowplayinginfobutton.center = CGPointMake(DEFAULT_RIGHT_SIDE_INFO_X, BOTTOM_LABEL_CENTER_Y);
    self.upnext1infobutton.center = CGPointMake(DEFAULT_LEFT_SIDE_INFO_X, TOP_LABEL_CENTER_Y);
    self.upnext2infobutton.center = CGPointMake(DEFAULT_RIGHT_SIDE_INFO_X, TOP_LABEL_CENTER_Y);
    self.upnext3infobutton.center = CGPointMake(DEFAULT_LEFT_SIDE_INFO_X, TOP_LABEL_CENTER_Y);
    self.alpha = QUICK_QUEUE_HIDDEN_ALPHA;
    self.frame = frame;
    isShown = NO;
    NSLog(@"Quick Queue Concealed");
}

- (void)showQuickQueue
{
    CGRect frame = self.frame;
    frame.origin.y = 0 + nowplayinglabel.frame.size.height - 1;
    self.quitbutton.center = CGPointMake(DEFAULT_QUIT_CENTER_X, TOP_QUIT_CENTER_Y);
    self.votesleftlabel.center = CGPointMake(DEFAULT_LABEL_CENTER_X, TOP_LABEL_CENTER_Y);
    self.upnext1label.center = CGPointMake(DEFAULT_LABEL_CENTER_X, UP_NEXT_1_LABEL_CENTER_Y);
    self.upnext2label.center = CGPointMake(DEFAULT_LABEL_CENTER_X, UP_NEXT_2_LABEL_CENTER_Y);
    self.upnext3label.center = CGPointMake(DEFAULT_LABEL_CENTER_X, UP_NEXT_3_LABEL_CENTER_Y);
    self.nowplayinglabel.center = CGPointMake(DEFAULT_LABEL_CENTER_X, NOW_PLAYING_LABEL_CENTER_Y);
    self.upnext1infobutton.center = CGPointMake(DEFAULT_RIGHT_SIDE_INFO_X, UP_NEXT_1_LABEL_CENTER_Y);
    self.upnext2infobutton.center = CGPointMake(DEFAULT_LEFT_SIDE_INFO_X, UP_NEXT_2_LABEL_CENTER_Y);
    self.upnext3infobutton.center = CGPointMake(DEFAULT_RIGHT_SIDE_INFO_X, UP_NEXT_3_LABEL_CENTER_Y);
    self.lastplayedinfobutton.center = CGPointMake(DEFAULT_RIGHT_SIDE_INFO_X, LAST_PLAYED_LABEL_CENTER_Y);
    self.nowplayinginfobutton.center = CGPointMake(DEFAULT_LEFT_SIDE_INFO_X, NOW_PLAYING_LABEL_CENTER_Y);
    self.alpha = 1;
    self.frame = frame;
    self.isShown = YES;
    NSLog(@"Quick Queue Shown");
}

- (IBAction)quitButtonTouched:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"would you like to leave the lobby?"
                                                   delegate:self
                                          cancelButtonTitle:@"no"
                                          otherButtonTitles: @"yes",nil];
    [alert show];
}


- (IBAction)lastPlayedInfoTouched:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:PQSongInfoViewRequested object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:isYES,isLocalString,[NSNumber numberWithInt:-1],libraryIDString, nil]];
    NSLog(@"Last Played Info Touched");
}

- (IBAction)nowPlayingInfoTouched:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:PQSongInfoViewRequested object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:isYES,isLocalString,[NSNumber numberWithInt:0],libraryIDString, nil]];
    NSLog(@"Now Playing Info Touched");
}

- (IBAction)upNext1InfoTouched:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:PQSongInfoViewRequested object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:isYES,isLocalString,[NSNumber numberWithInt:1],libraryIDString, nil]];
    NSLog(@"Up Next 1 Info Touched");
}

- (IBAction)upNext2InfoTouched:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:PQSongInfoViewRequested object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:isYES,isLocalString,[NSNumber numberWithInt:2],libraryIDString, nil]];
    NSLog(@"Up Next 1 Info Touched");
}

- (IBAction)upNext3InfoTouched:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:PQSongInfoViewRequested object:self userInfo:[NSDictionary dictionaryWithObjectsAndKeys:isYES,isLocalString,[NSNumber numberWithInt:3],libraryIDString, nil]];  
    NSLog(@"Up Next 1 Info Touched"); 
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // QUIT BUTTON ALERT VIEW
    if (buttonIndex == 1)
    {
        NSLog(@"LOBBY QUIT REQUESTED");
        [[NSNotificationCenter defaultCenter] postNotificationName:PQLobbyQuitRequestedNotification object:self userInfo:nil];
    }
}

@end
