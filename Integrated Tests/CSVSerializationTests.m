//
//  CSVSerializationTests.m
//  Integrated Tests
//
//  Created by Ryan Davies on 05/04/2013.
//  Copyright (c) 2013 Ryan Davies. All rights reserved.
//

#import "CSVSerializationTests.h"

@implementation CSVSerializationTests

- (void)testSerializingTwoRecords
{
    CSVRecordSet *recordSet = [[CSVRecordSet alloc] init];
    
    CSVRecord *ryan = [[CSVRecord alloc] init];
    [record setValue:@"Ryan Davies" forField:@"Name"];
    [record setValue:@20 forField:@"Age"];
    [record setValue:@"England" forField:@"Country"];
    
    CSVRecord *john = [[CSVRecord alloc] init];
    [john setValue:@"John Smith" forField:@"Name"];
    [john setValue:@34 forField:@"Age"];
    [john setValue:@"France" forField:@"Country"];
    
    [recordSet addRecord:ryan];
    [recordSet addRecord:john];
    
    NSMutableString *output = [[NSMutableString alloc] init];
    CSVSerializer *serializer = [[CSVSerializer alloc] initWithOutput:output];
    [serializer serialize:recordSet];
    
    NSString *expectedOutput = @"Name,Age,Country\nRyan Davies,20,England\nJohn Smith,34,France\n";
    STAssertEqualObjects(output, expectedOutput, @"Output did not match expected output.");
}

@end
