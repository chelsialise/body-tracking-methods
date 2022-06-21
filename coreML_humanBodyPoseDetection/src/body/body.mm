//  body.mm
//  CoreML Human Body Detection
//
//  Created by Chelsi Cocking on March 03 2022.
//  based on https://github.com/pierdr/ofxiosfacetracking
//      and https://github.com/pambudi02/objc_handgesture
//      and https://github.com/ofZach/FS_Research/tree/main/handResearch CoreML Hand Detection Implementation by LingDong Huang for Future Skecthes Finger Talk Project

#include "body.h"

@implementation Body

-(NSArray*)detect:(CGImageRef)image{

  VNDetectHumanBodyPoseRequest *req = [[VNDetectHumanBodyPoseRequest new] autorelease];
  NSDictionary *d = [[[NSDictionary alloc] init] autorelease];
  VNImageRequestHandler *handler = [[[VNImageRequestHandler alloc] initWithCGImage:image options:d] autorelease];

  [handler performRequests:@[req] error:nil];

  return req.results;
}
@end

BODY::BODY(){
  tracker = [[Body alloc] init];
}

void BODY::detect(ofPixels pix){
  CGImageRef image = CGImageRefFromOfPixels(pix,(int)pix.getWidth(),(int)pix.getHeight(),(int)pix.getNumChannels());
  NSArray* arr = [tracker detect:image];
  NSError *err;

  for(VNHumanBodyPoseObservation *observation in arr){
      
      /// get ALL the points
      NSDictionary <VNHumanBodyPoseObservationJointName, VNRecognizedPoint *> *allPts = [observation recognizedPointsForJointsGroupName:VNHumanBodyPoseObservationJointsGroupNameAll error:&err];
        

      /// LEFT ARM
      VNRecognizedPoint *leftShoulder = [allPts objectForKey:VNHumanBodyPoseObservationJointNameLeftShoulder];
      VNRecognizedPoint *leftElbow = [allPts objectForKey:VNHumanBodyPoseObservationJointNameLeftElbow];
      VNRecognizedPoint *leftWrist = [allPts objectForKey:VNHumanBodyPoseObservationJointNameLeftWrist];
       
      left_shoulder.x = leftShoulder.location.x*pix.getWidth();
      left_shoulder.y = (1-leftShoulder.location.y)*pix.getHeight();
      left_elbow.x = leftElbow.location.x*pix.getWidth();
      left_elbow.y = (1-leftElbow.location.y)*pix.getHeight();
      left_wrist.x = leftWrist.location.x*pix.getWidth();
      left_wrist.y = (1-leftWrist.location.y)*pix.getHeight();
        
      left_shoulder_confidence = leftShoulder.confidence;
      left_elbow_confidence = leftElbow.confidence;
      left_wrist_confidence = leftWrist.confidence;

      
      /// RIGHT ARM
      VNRecognizedPoint *rightShoulder = [allPts objectForKey:VNHumanBodyPoseObservationJointNameRightShoulder];
      VNRecognizedPoint *rightElbow = [allPts objectForKey:VNHumanBodyPoseObservationJointNameRightElbow];
      VNRecognizedPoint *rightWrist = [allPts objectForKey:VNHumanBodyPoseObservationJointNameRightWrist];
     
      right_shoulder.x = rightShoulder.location.x*pix.getWidth();
      right_shoulder.y = (1-rightShoulder.location.y)*pix.getHeight();
      right_elbow.x = rightElbow.location.x*pix.getWidth();
      right_elbow.y = (1-rightElbow.location.y)*pix.getHeight();
      right_wrist.x = rightWrist.location.x*pix.getWidth();
      right_wrist.y = (1-rightWrist.location.y)*pix.getHeight();
      
      right_shoulder_confidence = rightShoulder.confidence;
      right_elbow_confidence = rightElbow.confidence;
      right_wrist_confidence = rightWrist.confidence;
      

      /// LEFT LEG
      VNRecognizedPoint *leftHip = [allPts objectForKey:VNHumanBodyPoseObservationJointNameLeftHip];
      VNRecognizedPoint *leftKnee = [allPts objectForKey:VNHumanBodyPoseObservationJointNameLeftKnee];
      VNRecognizedPoint *leftAnkle = [allPts objectForKey:VNHumanBodyPoseObservationJointNameLeftAnkle];
       
      left_hip.x = leftHip.location.x*pix.getWidth();
      left_hip.y = (1-leftHip.location.y)*pix.getHeight();
      left_knee.x = leftKnee.location.x*pix.getWidth();
      left_knee.y = (1-leftKnee.location.y)*pix.getHeight();
      left_ankle.x = leftAnkle.location.x*pix.getWidth();
      left_ankle.y = (1-leftAnkle.location.y)*pix.getHeight();
        
      left_hip_confidence = leftHip.confidence;
      left_knee_confidence = leftKnee.confidence;
      left_ankle_confidence = leftAnkle.confidence;
    
      
      /// RIGHT LEG
      VNRecognizedPoint *rightHip = [allPts objectForKey:VNHumanBodyPoseObservationJointNameRightHip];
      VNRecognizedPoint *rightKnee = [allPts objectForKey:VNHumanBodyPoseObservationJointNameRightKnee];
      VNRecognizedPoint *rightAnkle = [allPts objectForKey:VNHumanBodyPoseObservationJointNameRightAnkle];
       
      right_hip.x = rightHip.location.x*pix.getWidth();
      right_hip.y = (1-rightHip.location.y)*pix.getHeight();
      right_knee.x = rightKnee.location.x*pix.getWidth();
      right_knee.y = (1-rightKnee.location.y)*pix.getHeight();
      right_ankle.x = rightAnkle.location.x*pix.getWidth();
      right_ankle.y = (1-rightAnkle.location.y)*pix.getHeight();
        
      right_hip_confidence = rightHip.confidence;
      right_knee_confidence = rightKnee.confidence;
      right_ankle_confidence = rightAnkle.confidence;
      
      
      /// WAIST
      VNRecognizedPoint *root = [allPts objectForKey:VNHumanBodyPoseObservationJointNameRoot];
       
      waist.x = root.location.x*pix.getWidth();
      waist.y = (1-root.location.y)*pix.getHeight();
        
      waist_confidence = root.confidence;
      
      
      /// HEAD
      VNRecognizedPoint *headNeck = [allPts objectForKey:VNHumanBodyPoseObservationJointNameNeck];
      VNRecognizedPoint *headNose = [allPts objectForKey:VNHumanBodyPoseObservationJointNameNose];
      VNRecognizedPoint *leftEar = [allPts objectForKey:VNHumanBodyPoseObservationJointNameLeftEar];
      VNRecognizedPoint *leftEye = [allPts objectForKey:VNHumanBodyPoseObservationJointNameLeftEye];
      VNRecognizedPoint *rightEar = [allPts objectForKey:VNHumanBodyPoseObservationJointNameRightEar];
      VNRecognizedPoint *rightEye = [allPts objectForKey:VNHumanBodyPoseObservationJointNameRightEye];
       
      neck.x = headNeck.location.x*pix.getWidth();
      neck.y = (1-headNeck.location.y)*pix.getHeight();
      nose.x = headNose.location.x*pix.getWidth();
      nose.y = (1-headNose.location.y)*pix.getHeight();
      left_ear.x = leftEar.location.x*pix.getWidth();
      left_ear.y = (1-leftEar.location.y)*pix.getHeight();
      left_eye.x = leftEye.location.x*pix.getWidth();
      left_eye.y = (1-leftEye.location.y)*pix.getHeight();
      right_ear.x = rightEar.location.x*pix.getWidth();
      right_ear.y = (1-rightEar.location.y)*pix.getHeight();
      right_eye.x = rightEye.location.x*pix.getWidth();
      right_eye.y = (1-rightEye.location.y)*pix.getHeight();
        
      neck_confidence = headNeck.confidence;
      nose_confidence = headNose.confidence;
      left_ear_confidence = leftEar.confidence;
      left_eye_confidence = leftEye.confidence;
      right_ear_confidence = rightEar.confidence;
      right_eye_confidence = rightEye.confidence;

      
    break;
  }
    
}


CGImageRef BODY::CGImageRefFromOfPixels( ofPixels & img, int width, int height, int numberOfComponents ){
  
  int bitsPerColorComponent = 8;
  int rawImageDataLength = width * height * numberOfComponents;
  BOOL interpolateAndSmoothPixels = NO;
  CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
  CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
  CGDataProviderRef dataProviderRef;
  CGColorSpaceRef colorSpaceRef;
  CGImageRef imageRef;
  
  GLubyte *rawImageDataBuffer =  (unsigned char*)(img.getData());
  dataProviderRef = CGDataProviderCreateWithData(NULL,  rawImageDataBuffer, rawImageDataLength, nil);
  if(numberOfComponents>1)
  {
    colorSpaceRef = CGColorSpaceCreateDeviceRGB();
  }
  else
  {
    colorSpaceRef = CGColorSpaceCreateDeviceGray();
  }
  imageRef = CGImageCreate(width, height, bitsPerColorComponent, bitsPerColorComponent * numberOfComponents, width * numberOfComponents, colorSpaceRef, bitmapInfo, dataProviderRef, NULL, interpolateAndSmoothPixels, renderingIntent);
  
  return imageRef;
}
