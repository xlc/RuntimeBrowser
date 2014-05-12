//
//  RuntimeBrowserPlugin.m
//  RuntimeBrowser
//
//  Created by Xiliang Chen on 14-5-11.
//
//

#import "RuntimeBrowserPlugin.h"
#import "AppController.h"

@implementation RuntimeBrowserPlugin {
    NSWindow *_window;
}

+ (instancetype)sharedPlugin
{
    static id sharedPlugin = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedPlugin = [[self alloc] init];
	});
    
    return sharedPlugin;
}

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    [self sharedPlugin];
}

#pragma mark -

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray *arr;
        NSMenu *menu = [NSApp mainMenu];
        [[NSBundle bundleForClass:[self class]] loadNibNamed:@"RuntimeBrowserPlugin" owner:[NSApplication sharedApplication] topLevelObjects:&arr];
        for (id obj in arr) {
            if ([obj isKindOfClass:[NSWindow class]]) {
                _window = obj;
                break;
            }
        }
        [NSApp setMainMenu:menu];
        
        NSMenuItem *menuItem = [menu itemWithTitle:@"View"];
        if (menuItem) {
            [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
            NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Runtime Browser" action:@selector(show) keyEquivalent:@""];
            [actionMenuItem setTarget:self];
            [[menuItem submenu] addItem:actionMenuItem];
        }
        
        [_window close];
    }
    return self;
}

- (void)show
{
    [_window makeKeyAndOrderFront:self];
}

@end
