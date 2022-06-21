#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    
    #ifdef _USE_LIVE_VIDEO
        cam.initGrabber(640,480);
    #else
        vid.load("rai_01_1024x1024.mp4");
        vid.setVolume(0);
        vid.play();
        vid.setLoopState(OF_LOOP_NORMAL);
    #endif
    
    panel.setup();
    panel.add(bDrawDiagnostic.set("bDrawDiagnostic", true));
    panel.loadFromFile("settings.xml");
    panel.setPosition(640+50, 50);

}

//--------------------------------------------------------------
void ofApp::update(){
    
    bool newFrame = false;

    #ifdef _USE_LIVE_VIDEO
        cam.update();
        newFrame = cam.isFrameNew();
    #else
        vid.update();
        newFrame = vid.isFrameNew();
    #endif
    
    
    if (newFrame){
        #ifdef _USE_LIVE_VIDEO
            ofPixels & pixels = cam.getPixels();
        #else
            ofPixels & pixels = vid.getPixels();
        #endif
        
        body.detect(pixels);
        
        //LEFT ARM
        BD.left_shoulder = body.left_shoulder;
        BD.left_elbow = body.left_elbow;
        BD.left_wrist = body.left_wrist;
        BD.left_shoulder_confidence = body.left_shoulder_confidence;
        BD.left_elbow_confidence = body.left_elbow_confidence;
        BD.left_wrist_confidence = body.left_wrist_confidence;
        BD.left_arm_confidence = body.left_arm_confidence;
        
        //RIGHT ARM
        BD.right_shoulder = body.right_shoulder;
        BD.right_elbow = body.right_elbow;
        BD.right_wrist = body.right_wrist;
        BD.right_shoulder_confidence = body.right_shoulder_confidence;
        BD.right_elbow_confidence = body.right_elbow_confidence;
        BD.right_wrist_confidence = body.right_wrist_confidence;
        BD.right_arm_confidence = body.right_arm_confidence;
        
        //LEFT LEG
        BD.left_hip = body.left_hip;
        BD.left_knee = body.left_knee;
        BD.left_ankle = body.left_ankle;
        BD.left_hip_confidence = body.left_hip_confidence;
        BD.left_knee_confidence = body.left_knee_confidence;
        BD.left_ankle_confidence = body.left_ankle_confidence;
        BD.left_leg_confidence = body.left_leg_confidence;
        
        //RIGHT LEG
        BD.right_hip = body.right_hip;
        BD.right_knee = body.right_knee;
        BD.right_ankle = body.right_ankle;
        BD.right_hip_confidence = body.right_hip_confidence;
        BD.right_knee_confidence = body.right_knee_confidence;
        BD.right_ankle_confidence = body.right_ankle_confidence;
        BD.right_leg_confidence = body.right_leg_confidence;
        
        //WAIST
        BD.waist = body.waist;
        BD.waist_confidence = body.waist_confidence;
        BD.torso_confidence = body.torso_confidence;
        
        //HEAD
        BD.neck = body.neck;
        BD.nose = body.nose;
        BD.left_ear = body.left_ear;
        BD.left_eye = body.left_eye;
        BD.right_ear = body.right_ear;
        BD.right_eye = body.right_eye;
        
        BD.neck_confidence = body.neck_confidence;
        BD.nose_confidence = body.nose_confidence;
        BD.left_ear_confidence = body.left_ear_confidence;
        BD.left_eye_confidence = body.left_eye_confidence;
        BD.right_ear_confidence = body.right_ear_confidence;
        BD.right_eye_confidence = body.right_eye_confidence;
        BD.head_confidence = body.head_confidence;
        
    }

}

//--------------------------------------------------------------
void ofApp::draw(){
    
    #ifdef _USE_LIVE_VIDEO
        cam.draw(0,0);
    #else
        vid.draw(0,0);
    #endif
    
    if (bDrawDiagnostic) BD.drawDiagnostic();

}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
