class CfgMovesBasic {
  class default;
  class DefaultDie;
  class ManActions
  {
    AnimCableStandStart[] = {"AnimCableStandStart", "gesture"};
    AnimCableStandLoop[] = {"AnimCableStandLoop", "gesture"};
    AnimCableStandEnd[] = {"AnimCableStandEnd", "gesture"};
  };
};

class CfgGesturesMale
{
  class default;
  class States
  {
    class AnimCableStandStart : default
    {
      file = QPATHTOF(rtms\anim_cable_stand_start.rtm);
      speed=1;
			looped=0;
			mask = "handsWeapon_pst";
    };
    class AnimCableStandLoop : AnimCableStandStart
    {
      file = QPATHTOF(rtms\anim_cable_stand_loop.rtm);
      speed=0.06;
      looped=1;
    };
    class AnimCableStandEnd : AnimCableStandStart
    {
      file = QPATHTOF(rtms\anim_cable_stand_end.rtm);
    };
  };
  class BlendAnims
	{
		class MaskStart
		{
			weight=0.85000002;
		};
		class MaskStartDecreased
		{
			weight=0.34999999;
		};
		empty[]={};
		BodyFullRealNoWeapon[]=
		{
			"head",
			1,
			"neck1",
			1,
			"neck",
			1,
			"LeftShoulder",
			1,
			"LeftArm",
			1,
			"LeftArmRoll",
			1,
			"LeftForeArm",
			1,
			"LeftForeArmRoll",
			1,
			"LeftHand",
			1,
			"LeftHandRing",
			1,
			"LeftHandPinky1",
			1,
			"LeftHandPinky2",
			1,
			"LeftHandPinky3",
			1,
			"LeftHandRing1",
			1,
			"LeftHandRing2",
			1,
			"LeftHandRing3",
			1,
			"LeftHandMiddle1",
			1,
			"LeftHandMiddle2",
			1,
			"LeftHandMiddle3",
			1,
			"LeftHandIndex1",
			1,
			"LeftHandIndex2",
			1,
			"LeftHandIndex3",
			1,
			"LeftHandThumb1",
			1,
			"LeftHandThumb2",
			1,
			"LeftHandThumb3",
			1,
			"RightShoulder",
			1,
			"RightArm",
			1,
			"RightArmRoll",
			1,
			"RightForeArm",
			1,
			"RightForeArmRoll",
			1,
			"RightHand",
			1,
			"RightHandRing",
			1,
			"RightHandPinky1",
			1,
			"RightHandPinky2",
			1,
			"RightHandPinky3",
			1,
			"RightHandRing1",
			1,
			"RightHandRing2",
			1,
			"RightHandRing3",
			1,
			"RightHandMiddle1",
			1,
			"RightHandMiddle2",
			1,
			"RightHandMiddle3",
			1,
			"RightHandIndex1",
			1,
			"RightHandIndex2",
			1,
			"RightHandIndex3",
			1,
			"RightHandThumb1",
			1,
			"RightHandThumb2",
			1,
			"RightHandThumb3",
			1,
			"Spine1",
			1,
			"Spine2",
			1,
			"Spine3",
			1,
			"Spine",
			1,
			"Pelvis",
			1,
			"LeftLeg",
			1,
			"LeftLegRoll",
			1,
			"LeftUpLeg",
			1,
			"LeftUpLegRoll",
			1,
			"LeftFoot",
			1,
			"LeftToeBase",
			1,
			"RightLeg",
			1,
			"RightLegRoll",
			1,
			"RightUpLeg",
			1,
			"RightUpLegRoll",
			1,
			"RightFoot",
			1,
			"RightToeBase",
			1
		};
	};
};

class CfgMovesMaleSdr: CfgMovesBasic
{
  skeletonName = "OFP2_ManSkeleton";
  gestures = "CfgGesturesMale";
  class States
  {
    class DeadState;
    class AnimCableCrouchStart : default
   		{
   			file = QPATHTOF(rtms\anim_cable_crouch_start.rtm);
  			looped = 0;
  			speed = 1;
  			duty = 2;
  			mask = "BodyFullReal";
  			enableDirectControl = 0;
  			leftHandIKCurve[] = {0};
  			RightHandIKCurve[] = {0};
  			weaponIK = 0;
  			forceAim = 1;
  			leaning = "empty";
  			aimingBody = "empty";
  			aiming = "empty";
  			head = "empty";
  			disableWeapons = 1;
  			disableWeaponsLong = 1;
  			headBobMode = 1;
  			headBobStrength = 0.2;
  			canPullTrigger = 0;
  			showHandGun = 0;
  			showItemInRightHand = 0;
  			variantsPlayer[] = {};
  			variantsAI[] = {};
  			weaponLowered=0;
   		};
    class AnimCableCrouchLoop : AnimCableCrouchStart
    {
      file = QPATHTOF(rtms\anim_cable_crouch_loop.rtm);
      looped=1;
      speed=0.1;
      ConnectTo[]=
      {
        "BasicDriverDead",
      1
      };
      InterpolateTo[]=
      {
        "BasicDriverDead",
        0.1
      };
    };
    class AnimCableCrouchToStand : AnimCableCrouchStart
    {
      file = QPATHTOF(rtms\anim_cable_crouch_to_stand.rtm);
    };
  };
};
