/*
 * Copyright 2010-2012 Amazon.com, Inc. or its affiliates. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License").
 * You may not use this file except in compliance with the License.
 * A copy of the License is located at
 *
 *  http://aws.amazon.com/apache2.0
 *
 * or in the "license" file accompanying this file. This file is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

#import "DynamoDBBatchGetItemResponse.h"


@implementation DynamoDBBatchGetItemResponse

@synthesize responses;
@synthesize unprocessedKeys;


-(id)init
{
    if (self = [super init]) {
        responses       = [[NSMutableDictionary alloc] initWithCapacity:1];
        unprocessedKeys = [[NSMutableDictionary alloc] initWithCapacity:1];
    }

    return self;
}


-(void)setException:(AmazonServiceException *)theException
{
    AmazonServiceException *newException = nil;

    if ([[theException errorCode] isEqualToString:@"ProvisionedThroughputExceededException"]) {
        newException = [[DynamoDBProvisionedThroughputExceededException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"InternalServerError"]) {
        newException = [[DynamoDBInternalServerErrorException alloc] initWithMessage:@""];
    }

    if ([[theException errorCode] isEqualToString:@"ResourceNotFoundException"]) {
        newException = [[DynamoDBResourceNotFoundException alloc] initWithMessage:@""];
    }

    if (newException != nil) {
        [newException setPropertiesWithException:theException];
        [exception release];
        exception = newException;
    }
    else {
        [exception release];
        exception = [theException retain];
    }
}


-(DynamoDBBatchResponse *)responsesValueForKey:(NSString *)theKey
{
    return (DynamoDBBatchResponse *)[responses valueForKey:theKey];
}

-(DynamoDBKeysAndAttributes *)unprocessedKeysValueForKey:(NSString *)theKey
{
    return (DynamoDBKeysAndAttributes *)[unprocessedKeys valueForKey:theKey];
}


-(NSString *)description
{
    NSMutableString *buffer = [[NSMutableString alloc] initWithCapacity:256];

    [buffer appendString:@"{"];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"Responses: %@,", responses] autorelease]];
    [buffer appendString:[[[NSString alloc] initWithFormat:@"UnprocessedKeys: %@,", unprocessedKeys] autorelease]];
    [buffer appendString:[super description]];
    [buffer appendString:@"}"];

    return [buffer autorelease];
}



-(void)dealloc
{
    [responses release];
    [unprocessedKeys release];

    [super dealloc];
}


@end
