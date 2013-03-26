// WHPerson.m
//
// Copyright (c) 2013 Rui D Lopes
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "WHPerson.h"

@implementation WHPerson
@synthesize URL = _URL;

- (BOOL)matches:(HTMLDocument *)webPage fromRequest:(WHRequest *)request
{
    // should have an age
    return [webPage.body nodeWithAttribute:@"id" valueMatches:@"age"].integerValue;
}

- (void)buildWithHTMLPage:(HTMLDocument *)webPage fromRequest:(WHRequest *)request error:(NSError *__autoreleasing *)error
{
    self.fullName = webPage.title;
    self.age = [webPage.body nodeWithAttribute:@"id" valueMatches:@"age"].integerValue;
    self.city = [webPage.body nodeWithAttribute:@"id" valueMatches:@"city"].stringValue;
    self.country = [webPage.body nodeWithAttribute:@"id" valueMatches:@"country"].stringValue;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"[%@ - %@ | %ld y/o | %@ - %@ | from %@]",
            [super description], self.fullName, (unsigned long)self.age, self.city, self.country, self.URL];
}

@end
