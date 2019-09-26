// Copyright 2017 Jenghis
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import <Foundation/Foundation.h>
#import "CBBlueLightClient.h"

int main(int argc, const char * argv[]) {
    CBBlueLightClient *client = [[CBBlueLightClient alloc] init];
    
    float currentStrength;
    [client getStrength:&currentStrength];
    NSString *currentStrengthString = [NSString stringWithFormat:@"%.0f", currentStrength * 100];
    printf("Current: %s", [currentStrengthString UTF8String]);
    
    if (argc == 1) { return 0; }
    float strength = [[NSString stringWithUTF8String:argv[1]] floatValue] / 100;
    if (strength != 0.0) { [client setStrength:strength commit:true]; }
    [client setEnabled:(strength != 0.0)];
    
    NSString *nowStrengthString = [NSString stringWithFormat:@"%.0f", strength * 100];
    printf("\nNow: %s", [nowStrengthString UTF8String]);
    return 0;
}
