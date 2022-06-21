//  body.h
//  CoreML Human Body Detection
//
//  Created by Chelsi Cocking on March 03 2022.
//  based on https://github.com/pierdr/ofxiosfacetracking
//      and https://github.com/pambudi02/objc_handgesture
//      and https://github.com/ofZach/FS_Research/tree/main/handResearch CoreML Hand Detection Implementation by LingDong Huang for Future Skecthes Finger Talk Project


#pragma once

#ifndef body_h
#define body_h

#include "ofMain.h"
#import <Foundation/Foundation.h>
#import <Vision/Vision.h>
#import <AVKit/AVKit.h>


class BODY;

@interface Body:NSObject<AVCaptureVideoDataOutputSampleBufferDelegate>{
  AVCaptureSession*           session;
  AVCaptureVideoDataOutput*   videoDataOutput;
  AVCaptureDevice*            captureDevice;
}
-(NSArray*)detect:(CGImageRef)image;
@end

class BODY{
    public:
        BODY();
        void detect(ofPixels image);
        CGImageRef CGImageRefFromOfPixels( ofPixels & img, int width, int height, int numberOfComponents );
        
        //LEFT ARM
        ofVec2f left_shoulder;
        ofVec2f left_elbow;
        ofVec2f left_wrist;
        float left_shoulder_confidence;
        float left_elbow_confidence;
        float left_wrist_confidence;
        float left_arm_confidence;
    
        //RIGHT ARM
        ofVec2f right_shoulder;
        ofVec2f right_elbow;
        ofVec2f right_wrist;
        float right_shoulder_confidence;
        float right_elbow_confidence;
        float right_wrist_confidence;
        float right_arm_confidence;
    
        //LEFT LEG
        ofVec2f left_hip;
        ofVec2f left_knee;
        ofVec2f left_ankle;
        float left_hip_confidence;
        float left_knee_confidence;
        float left_ankle_confidence;
        float left_leg_confidence;
    
        //RIGHT LEG
        ofVec2f right_hip;
        ofVec2f right_knee;
        ofVec2f right_ankle;
        float right_hip_confidence;
        float right_knee_confidence;
        float right_ankle_confidence;
        float right_leg_confidence;
    
        //WAIST
        ofVec2f waist;
        float waist_confidence;
        float torso_confidence;
    
        //HEAD
        ofVec2f neck;
        ofVec2f nose;
        ofVec2f left_ear;
        ofVec2f left_eye;
        ofVec2f right_ear;
        ofVec2f right_eye;
        float neck_confidence;
        float nose_confidence;
        float left_ear_confidence;
        float left_eye_confidence;
        float right_ear_confidence;
        float right_eye_confidence;
        float head_confidence;


    protected:
        Body* tracker;

};

#endif /* hand_h */
