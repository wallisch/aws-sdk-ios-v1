/*
 * Copyright 2010-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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


#ifdef AWS_MULTI_FRAMEWORK
#import <AWSRuntime/AmazonServiceRequestConfig.h>
#else
#import "AmazonServiceRequestConfig.h"
#endif



/**
 * Start Instances Request
 */

@interface EC2StartInstancesRequest:AmazonServiceRequestConfig

{
    NSMutableArray *instanceIds;
    NSString       *additionalInfo;
    BOOL           dryRun;
    BOOL           dryRunIsSet;
}



/**
 * The list of Amazon EC2 instances to start.
 */
@property (nonatomic, retain) NSMutableArray *instanceIds;

/**
 * The value of the AdditionalInfo property for this object.
 */
@property (nonatomic, retain) NSString *additionalInfo;

/**
 * The value of the DryRun property for this object.
 */
@property (nonatomic) BOOL           dryRun;

@property (nonatomic, readonly) BOOL dryRunIsSet;


/**
 * Default constructor for a new StartInstancesRequest object.  Callers should use the
 * property methods to initialize this object after creating it.
 */
-(id)init;

/**
 * Constructs a new StartInstancesRequest object.
 * Callers should use properties to initialize any additional object members.
 *
 * @param theInstanceIds The list of Amazon EC2 instances to start.
 */
-(id)initWithInstanceIds:(NSMutableArray *)theInstanceIds;

/**
 * Adds a single object to instanceIds.
 * This function will alloc and init instanceIds if not already done.
 */
-(void)addInstanceId:(NSString *)instanceIdObject;

/**
 * Returns a string representation of this object; useful for testing and
 * debugging.
 *
 * @return A string representation of this object.
 */
-(NSString *)description;


@end
