//
//  SongInfoView.m
//  PQSeptember
//
//  Created by April Blaine on 10/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SongInfoView.h"

//constants for layout
static NSTimeInterval DEFAULT_HIDDEN_ORIGIN = 480;
static NSTimeInterval DEFAULT_SHOWN_ORIGIN = 235;
static NSTimeInterval DEFAULT_SHOW_SPEED = 0.2;
static NSTimeInterval DEFAULT_FADE_SPEED = 0.8;

@implementation SongInfoView

@synthesize songNameLabel, artistNameLabel, albumNameLabel, voteCountLabel, queuePositionLabel, albumCoverImageView, voteButton, spotifyButton, iTunesButton, currentLibraryID;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // initialization code- (void)registerForSongInfoViewRequestNotifications
        {
        }
    }
    return self;
}

- (void)registerForSongInfoViewExchangeNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(requestSongInfoViewExchange:)
                                                 name:PQSongInfoViewExchangeRequested
                                               object:nil];
}

- (void)showSongInfoFor:(NSInteger)libraryID
{
    currentLibraryID = libraryID;
        songNameLabel.text = [NSString stringWithFormat:@"Song # %i",libraryID];
}

- (void)requestSongInfoViewExchange:(NSNotification *)notification
{
    NSLog(@"NOTIFICATION DETAILS: name - %@ | object - %@ | user info - %@",notification.name, notification.object, notification.userInfo);
    if ([[notification.userInfo objectForKey:isLocalString] isEqualToString:isYES])
    {
        NSInteger libraryID = [(NSNumber *)[notification.userInfo objectForKey:libraryIDString] intValue];
        [self exchangeSongInfoFor:libraryID];
    }
    
}

- (void)exchangeSongInfoFor:(NSInteger)libraryID
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:DEFAULT_FADE_SPEED];
    self.songNameLabel.alpha = 0;
    self.artistNameLabel.alpha = 0;
    self.albumNameLabel.alpha = 0;
    self.voteCountLabel.alpha = 0;
    self.queuePositionLabel.alpha = 0;
    self.albumCoverImageView.alpha = 0;
    self.voteButton.alpha = 0;
    self.spotifyButton.alpha = 0;
    self.iTunesButton.alpha = 0;
    self.songNameLabel.alpha = 1;
    self.artistNameLabel.alpha = 1;
    self.albumNameLabel.alpha = 1;
    self.voteCountLabel.alpha = 1;
    self.queuePositionLabel.alpha = 1;
    self.albumCoverImageView.alpha = 1;
    self.voteButton.alpha = 1;
    self.spotifyButton.alpha = 1;
    self.iTunesButton.alpha = 1;
    [UIView commitAnimations];
    [self showSongInfoFor:libraryID];
}

- (void)hideSongInfoView
{
    CGRect frame = self.frame;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:DEFAULT_SHOW_SPEED];
    frame.origin.y = DEFAULT_HIDDEN_ORIGIN;
    self.frame = frame;
    [UIView commitAnimations];
}

- (void)showSongInfoView
{
    CGRect frame = self.frame;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:DEFAULT_SHOW_SPEED];
    frame.origin.y = DEFAULT_SHOWN_ORIGIN;
    self.frame = frame;
    [UIView commitAnimations];
}

- (IBAction)hideViewTouched:(id)sender
{
    [self hideSongInfoView];
    [[NSNotificationCenter defaultCenter] postNotificationName:PQSongInfoViewDismissed object:self userInfo:nil];
    self = nil;
}

- (IBAction)voteButtonTouched:(id)sender
{
    NSLog(@"Song %i Voted For",self.currentLibraryID);
}

- (IBAction)spotifyButtonTouched:(id)sender
{
    NSLog(@"Song %i Sent To Spotify",self.currentLibraryID);
}

- (IBAction)iTunesButtonTouched:(id)sender
{
    NSLog(@"Song %i Sent To iTunes",self.currentLibraryID);   
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] postNotificationName:PQSongInfoViewDismissed object:self userInfo:nil];
    self = nil;
}

@end
