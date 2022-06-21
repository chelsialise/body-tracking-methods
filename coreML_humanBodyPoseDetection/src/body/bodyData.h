#pragma once

#include "ofMain.h"

class bodyData {
    
public:
    
    //LEFT ARM
    ofPoint left_shoulder;
    ofPoint left_elbow;
    ofPoint left_wrist;
    float left_shoulder_confidence;
    float left_elbow_confidence;
    float left_wrist_confidence;
    float left_arm_confidence;
    
    //RIGHT ARM
    ofPoint right_shoulder;
    ofPoint right_elbow;
    ofPoint right_wrist;
    float right_shoulder_confidence;
    float right_elbow_confidence;
    float right_wrist_confidence;
    float right_arm_confidence;
    
    //LEFT LEG
    ofPoint left_hip;
    ofPoint left_knee;
    ofPoint left_ankle;
    float left_hip_confidence;
    float left_knee_confidence;
    float left_ankle_confidence;
    float left_leg_confidence;
    
    //RIGHT LEG
    ofPoint right_hip;
    ofPoint right_knee;
    ofPoint right_ankle;
    float right_hip_confidence;
    float right_knee_confidence;
    float right_ankle_confidence;
    float right_leg_confidence;
    
    //WAIST
    ofPoint waist;
    float waist_confidence;
    float torso_confidence;
    
    //HEAD
    ofPoint neck;
    ofPoint nose;
    ofPoint left_ear;
    ofPoint left_eye;
    ofPoint right_ear;
    ofPoint right_eye;
    float neck_confidence;
    float nose_confidence;
    float left_ear_confidence;
    float left_eye_confidence;
    float right_ear_confidence;
    float right_eye_confidence;
    float head_confidence;
    
    
    void drawDiagnostic(){
        
        ofPushStyle();
        //ofNoFill();
        ofSetColor(255,255,255);
        ofSetLineWidth(1);
        
        /// -----------------------------------------------------------------------------
        /// LEFT ARM
        /// -----------------------------------------------------------------------------
        ofDrawCircle(left_shoulder.x, left_shoulder.y, 3);
        ofDrawCircle(left_elbow.x, left_elbow.y, 3);
        ofDrawCircle(left_wrist.x, left_wrist.y, 3);
        
        ///connect with lines
        if (left_shoulder_confidence && left_elbow_confidence && left_wrist_confidence > 0.5) {
            ofDrawLine(left_shoulder.x, left_shoulder.y, left_elbow.x, left_elbow.y);
            ofDrawLine(left_elbow.x, left_elbow.y, left_wrist.x, left_wrist.y);
        }
        
        /// display confidence
        //ofDrawBitmapStringHighlight(ofToString(left_shoulder_confidence), left_shoulder.x, left_shoulder.y);
        //ofDrawBitmapStringHighlight(ofToString(left_elbow_confidence), left_elbow.x, left_elbow.y);
        //ofDrawBitmapStringHighlight(ofToString(left_wrist_confidence), left_wrist.x, left_wrist.y);
        
        
        /// -----------------------------------------------------------------------------
        /// RIGHT ARM
        /// -----------------------------------------------------------------------------
        ofDrawCircle(right_shoulder.x, right_shoulder.y, 3);
        ofDrawCircle(right_elbow.x, right_elbow.y, 3);
        ofDrawCircle(right_wrist.x, right_wrist.y, 3);
        
        ///connect with lines
        if (right_shoulder_confidence && right_elbow_confidence && right_wrist_confidence > 0.5) {
            ofDrawLine(right_shoulder.x, right_shoulder.y, right_elbow.x, right_elbow.y);
            ofDrawLine(right_elbow.x, right_elbow.y, right_wrist.x, right_wrist.y);
        }
        
        /// display confidence
        //
        
        
        /// -----------------------------------------------------------------------------
        /// LEFT LEG
        /// -----------------------------------------------------------------------------
        ofDrawCircle(left_hip.x, left_hip.y, 3);
        ofDrawCircle(left_knee.x, left_knee.y, 3);
        ofDrawCircle(left_ankle.x, left_ankle.y, 3);
        
        ///connect with lines
        if (left_hip_confidence && left_knee_confidence && left_ankle_confidence > 0.5) {
            ofDrawLine(left_hip.x, left_hip.y, left_knee.x, left_knee.y);
            ofDrawLine(left_knee.x, left_knee.y, left_ankle.x, left_ankle.y);
        }
        
        /// display confidence
        //
        
        
        /// -----------------------------------------------------------------------------
        /// RIGHT LEG
        /// -----------------------------------------------------------------------------
        ofDrawCircle(right_hip.x, right_hip.y, 3);
        ofDrawCircle(right_knee.x, right_knee.y, 3);
        ofDrawCircle(right_ankle.x, right_ankle.y, 3);
        
        ///connect with lines
        if (right_hip_confidence && right_knee_confidence && right_ankle_confidence > 0.5) {
            ofDrawLine(right_hip.x, right_hip.y, right_knee.x, right_knee.y);
            ofDrawLine(right_knee.x, right_knee.y, right_ankle.x, right_ankle.y);
        }
        
        /// display confidence
        //
        
        
        /// -----------------------------------------------------------------------------
        /// WAIST
        /// -----------------------------------------------------------------------------
        ofDrawCircle(waist.x, waist.y, 3);
        
        ///connect with lines
        ofDrawLine(right_hip.x, right_hip.y, waist.x, waist.y);
        ofDrawLine(waist.x, waist.y, left_hip.x, left_hip.y);
        
        /// display confidence
        //
        
        
        /// -----------------------------------------------------------------------------
        /// HEAD
        /// -----------------------------------------------------------------------------
        ofDrawCircle(neck.x, neck.y, 3);
        ofDrawCircle(nose.x, nose.y, 3);
        ofDrawCircle(left_ear.x, left_ear.y, 1);
        ofDrawCircle(left_eye.x, left_eye.y, 1);
        ofDrawCircle(right_ear.x, right_ear.y, 1);
        ofDrawCircle(right_eye.x, right_eye.y, 1);
        
        ///connect with lines
        if (neck_confidence && nose_confidence && right_eye_confidence && left_eye_confidence > 0.5) {
            ofDrawLine(neck.x, neck.y, nose.x, nose.y);
            ofDrawLine(right_eye.x, right_eye.y, left_eye.x, left_eye.y);
        }
        
        /// display confidence
        //
        
        
        ///other lines to connect
        ofDrawLine(waist.x, waist.y, neck.x, neck.y);
        ofDrawLine(right_shoulder.x, right_shoulder.y, neck.x, neck.y);
        ofDrawLine(neck.x, neck.y, left_shoulder.x, left_shoulder.y);
        
        
        ofPopStyle();
        
    }
    

    
};
