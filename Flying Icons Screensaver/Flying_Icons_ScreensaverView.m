//
//  Flying_Icons_ScreensaverView.m
//  Flying Icons Screensaver
//
//  Created by Colin Cornaby on 12/4/11.

/* Copyright 2011 Colin Cornaby. All rights reserved.
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 
 * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 * 
 * Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 * 
 * Neither the name of the project's author nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

#import "Flying_Icons_ScreensaverView.h"
#import <OpenGL/OpenGL.h>
#import <Cocoa/Cocoa.h>

@implementation Flying_Icons_ScreensaverView

@synthesize  driver = _driver;

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        NSOpenGLPixelFormatAttribute attrs[] =
        {
            NSOpenGLPFADoubleBuffer,
            NSOpenGLPFADepthSize, 32,
            0
        };
        [self setAnimationTimeInterval:1/30.0];
        NSOpenGLView *glView =[[NSOpenGLView alloc] initWithFrame:self.bounds pixelFormat:[[[NSOpenGLPixelFormat alloc] initWithAttributes:attrs] autorelease]];
        [self addSubview:glView];
        [glView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
        glView.alphaValue =0.0;
        self.driver = [[[FlyingIconsDriver alloc] init] autorelease];
        self.driver.glView = glView;
        self.driver.glContext = glView.openGLContext;
        [self.driver start];
        [self.driver draw];
        [glView release];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    [self.driver draw];
    self.driver.glView.alphaValue=1.0;
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

-(void)dealloc
{
    [super dealloc];
}

@end
