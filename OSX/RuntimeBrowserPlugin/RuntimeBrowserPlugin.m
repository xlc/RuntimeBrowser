//
//  RuntimeBrowserPlugin.m
//  RuntimeBrowser
//
//  Created by Xiliang Chen on 14-5-11.
//
//

#import "RuntimeBrowserPlugin.h"
#import "AppController.h"

@implementation RuntimeBrowserPlugin

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
        [NSApp setMainMenu:menu];
    }
    return self;
}

@end
