//
//  FlyingIcons.h
//  FlyingIconsShell
//
//  Created by Colin Cornaby on 12/3/11.

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

#import <OpenGL/gl.h>
#include <unistd.h>
#include <sys/time.h>

#ifndef FlyingIconsShell_FlyingIcons_h
#define FlyingIconsShell_FlyingIcons_h


#endif

struct flyingIconImage
{
    void * imageBuffer;
    int width;
    int height;
};

struct flyingIcon
{
    GLuint textureID;
    int width;
    int height;
    float deltaX;
    float deltaY;
    struct timeval spawnTime;
    int twirl;
    struct flyingIcon *nextIcon;
};

struct flyingIconsContext
{
    struct timeval lastIconSpawnTime;
    int currentIconNum;
    struct flyingIcon *firstIcon;
    float xBias;
    int (*iconGetter)(void * context, struct flyingIconImage ** images);
    void * callbackContext;
};

typedef struct flyingIconsContext * flyingIconsContextPtr;


void drawFlyingIcons(flyingIconsContextPtr context, float hRes, float vRes);
flyingIconsContextPtr newFlyingIconsContext(void);
void setFlyingIconsContextCallback(flyingIconsContextPtr context, int (*callBack)(void * context, struct flyingIconImage ** images), void * callbackContext);
void destroyFlyingIconsContext(flyingIconsContextPtr context);