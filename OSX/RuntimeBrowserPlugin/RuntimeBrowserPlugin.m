//
//  RuntimeBrowserPlugin.m
//  RuntimeBrowser
//
//  Created by Xiliang Chen on 14-5-11.
//
//

#import "RuntimeBrowserPlugin.h"

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
        
    }
    return self;
}

@end
