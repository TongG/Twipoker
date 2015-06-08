/*=============================================================================┐
|             _  _  _       _                                                  |  
|            (_)(_)(_)     | |                            _                    |██
|             _  _  _ _____| | ____ ___  ____  _____    _| |_ ___              |██
|            | || || | ___ | |/ ___) _ \|    \| ___ |  (_   _) _ \             |██
|            | || || | ____| ( (__| |_| | | | | ____|    | || |_| |            |██
|             \_____/|_____)\_)____)___/|_|_|_|_____)     \__)___/             |██
|                                                                              |██
|                 _______    _             _                 _                 |██
|                (_______)  (_)           | |               | |                |██
|                    _ _ _ _ _ ____   ___ | |  _ _____  ____| |                |██
|                   | | | | | |  _ \ / _ \| |_/ ) ___ |/ ___)_|                |██
|                   | | | | | | |_| | |_| |  _ (| ____| |    _                 |██
|                   |_|\___/|_|  __/ \___/|_| \_)_____)_|   |_|                |██
|                             |_|                                              |██
|                                                                              |██
|                         Copyright (c) 2015 Tong Guo                          |██
|                                                                              |██
|                             ALL RIGHTS RESERVED.                             |██
|                                                                              |██
└==============================================================================┘██
  ████████████████████████████████████████████████████████████████████████████████
  ██████████████████████████████████████████████████████████████████████████████*/

#import "TWPRetweetSwitcher.h"
#import "TWPLoginUsersManager.h"

// They are named in main bundle
NSString static* const kImageNameUnretweeted = @"twitter-retweet-button-normal";
NSString static* const kImageNameRetweeted = @"twitter-retweet-button-highlighting";

@implementation TWPRetweetSwitcher

@dynamic tweet;
@dynamic isSelected;

#pragma mark Initializations
- ( void ) awakeFromNib
    {
    // TODO:
    }

#pragma mark Accessors
- ( void ) setTweet: ( OTCTweet* )_Tweet
    {
    self->_tweet = _Tweet;

    [ self setImage: self->_tweet.isRetweetedByMe ? [ NSImage imageNamed: kImageNameRetweeted ]
                                                  : [ NSImage imageNamed: kImageNameUnretweeted ] ];

    SInt64 currentUserID = [ [ TWPLoginUsersManager sharedManager ] currentLoginUser ].userID.longLongValue;
    [ self setEnabled: self->_tweet.author.ID != currentUserID ];
    }

- ( OTCTweet* ) tweet
    {
    return self->_tweet;
    }

- ( BOOL ) isSelected
    {
    return self->_tweet.isRetweetedByMe;
    }

#pragma mark Custom Drawing
- ( void ) drawRect: ( NSRect )_DirtyRect
    {
    [ super drawRect: _DirtyRect ];
    
    // Drawing code here.
    }

@end

/*=============================================================================┐
|                                                                              |
|                                        `-://++/:-`    ..                     |
|                    //.                :+++++++++++///+-                      |
|                    .++/-`            /++++++++++++++/:::`                    |
|                    `+++++/-`        -++++++++++++++++:.                      |
|                     -+++++++//:-.`` -+++++++++++++++/                        |
|                      ``./+++++++++++++++++++++++++++/                        |
|                   `++/++++++++++++++++++++++++++++++-                        |
|                    -++++++++++++++++++++++++++++++++`                        |
|                     `:+++++++++++++++++++++++++++++-                         |
|                      `.:/+++++++++++++++++++++++++-                          |
|                         :++++++++++++++++++++++++-                           |
|                           `.:++++++++++++++++++/.                            |
|                              ..-:++++++++++++/-                              |
|                             `../+++++++++++/.                                |
|                       `.:/+++++++++++++/:-`                                  |
|                          `--://+//::-.`                                      |
|                                                                              |
└=============================================================================*/