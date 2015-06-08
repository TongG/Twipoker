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

#import "TWPRetweetButton.h"
#import "TWPRetweetOperationsPopover.h"
#import "TWPRetweetOperationsView.h"
#import "TWPRetweetOperationsViewController.h"

@implementation TWPRetweetButton

@dynamic retweetButton;
@dynamic quoteRetweetButton;

#pragma mark Initializations
- ( void ) awakeFromNib
    {
    self->_popover = [ [ TWPRetweetOperationsPopover alloc ] init ];
    }

#pragma mark Accessros
- ( NSButton* ) retweetButton
    {
    TWPRetweetOperationsViewController* controller = ( TWPRetweetOperationsViewController* )( self->_popover.contentViewController );
    TWPRetweetOperationsView* view = ( TWPRetweetOperationsView* )( controller.view );
    NSLog( @"%@", view.retweetButton );
    return view.retweetButton;
    }

- ( NSButton* ) quoteRetweetButton
    {
    TWPRetweetOperationsViewController* controller = ( TWPRetweetOperationsViewController* )( self->_popover.contentViewController );
    TWPRetweetOperationsView* view = ( TWPRetweetOperationsView* )( controller.view );
    NSLog( @"%@", view.quoteRetweetButton );
    return view.quoteRetweetButton;
    }

#pragma mark Custom Drawing
- ( void ) drawRect: ( NSRect )_DirtyRect
    {
    [ super drawRect: _DirtyRect ];
    
    // Drawing code here.
    }

- ( void ) showRetweetPopover
    {
    [ self->_popover showRelativeToRect: self.bounds
                                 ofView: self
                          preferredEdge: NSMaxYEdge ];
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