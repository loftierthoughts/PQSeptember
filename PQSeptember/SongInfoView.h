//
//  SongInfoView.h
//  PQSeptember
//
//  Created by April Blaine on 10/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongInfoView : UIView

@property (nonatomic, assign) NSInteger currentLibraryID;
@property (nonatomic, retain) IBOutlet UILabel *songNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *artistNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *albumNameLabel;
@property (nonatomic, retain) IBOutlet UILabel *voteCountLabel;
@property (nonatomic, retain) IBOutlet UILabel *queuePositionLabel;
@property (nonatomic, retain) IBOutlet UIImageView *albumCoverImageView;
@property (nonatomic, retain) IBOutlet UIButton *voteButton;
@property (nonatomic, retain) IBOutlet UIButton *spotifyButton;
@property (nonatomic, retain) IBOutlet UIButton *iTunesButton;

- (void)hideSongInfoView;
- (void)showSongInfoView;
- (void)showSongInfoFor:(NSInteger)libraryID;
- (void)exchangeSongInfoFor:(NSInteger)libraryID;
- (void)requestSongInfoViewExchange:(NSNotification *)notification;
- (void)registerForSongInfoViewExchangeNotification;
- (IBAction)hideViewTouched:(id)sender;
- (IBAction)voteButtonTouched:(id)sender;
- (IBAction)spotifyButtonTouched:(id)sender;
- (IBAction)iTunesButtonTouched:(id)sender;

@end
