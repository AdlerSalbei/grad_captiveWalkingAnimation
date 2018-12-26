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
      file = QPATH(rtms\anim_cable_stand_start.rtm);
      speed=1;
      looped=0;
      mask = "handsWeapon_pst";
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
    class AnimCableStandLoop : AnimCableStandStart
    {
      file = QPATH(rtms\anim_cable_stand_loop.rtm);
      speed=0.06;
      looped=1;
    };
    class AnimCableStandEnd : AnimCableStandStart
    {
      file = QPATH(rtms\anim_cable_stand_end.rtm);
    };
  };
};

class CfgMovesMaleSdr: CfgMovesBasic
{
  class StandBase;
  class States
  {
    class default;
    class AnimCableCrouchStart : default
    {
      file = QPATH(rtms\anim_cable_crouch_start.rtm);
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
      file = QPATH(rtms\anim_cable_crouch_loop.rtm);
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
      file = QPATH(rtms\anim_cable_crouch_to_stand.rtm);
    };
  };
};
