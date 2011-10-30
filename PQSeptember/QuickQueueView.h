//
//  QuickQueueView.h
//  CombinedViewTest
//
//  Created by April Blaine on 9/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuickQueueView : UIView <UIAlertViewDelegate>

@property (nonatomic, copy) NSString *message;
@property (nonatomic, retain) IBOutlet UIButton *quitbutton;
@property (nonatomic, retain) IBOutlet UIButton *skipbutton;
@property (nonatomic, retain) IBOutlet UIButton *lastplayedinfobutton;
@property (nonatomic, retain) IBOutlet UIButton *nowplayinginfobutton;
@property (nonatomic, retain) IBOutlet UIButton *upnext1infobutton;
@property (nonatomic, retain) IBOutlet UIButton *upnext2infobutton;
@property (nonatomic, retain) IBOutlet UIButton *upnext3infobutton;
@property (nonatomic, retain) IBOutlet UILabel *votesleftlabel;
@property (nonatomic, retain) IBOutlet UILabel *upnext1label;
@property (nonatomic, retain) IBOutlet UILabel *upnext2label;
@property (nonatomic, retain) IBOutlet UILabel *upnext3label;
@property (nonatomic, retain) IBOutlet UILabel *nowplayinglabel;
@property (nonatomic, assign) BOOL isShown;

- (IBAction)toggleQuickQueue:(id)sender;
- (void)hideQuickQueue;
- (void)showQuickQueue;
- (IBAction)quitButtonTouched:(id)sender;
- (IBAction)lastPlayedInfoTouched:(id)sender;
- (IBAction)nowPlayingInfoTouched:(id)sender;
- (IBAction)upNext1InfoTouched:(id)sender;
- (IBAction)upNext2InfoTouched:(id)sender;
- (IBAction)upNext3InfoTouched:(id)sender;

@end
