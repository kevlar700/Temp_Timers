with STM32.Devices.Timers;

package STM32.Timers.Run
  with SPARK_Mode
is

   procedure Enable_Clock (Timer : STM32.Devices.Timers.Timer_T);

   procedure Clock_Is_Enabled
     (Timer : STM32.Devices.Timers.Timer_T; Answer : out Boolean);

   procedure Disable_Clock (Timer : STM32.Devices.Timers.Timer_T);

   procedure Reset_Clock (Timer : STM32.Devices.Timers.Timer_T);

   procedure Disable (Timer : STM32.Devices.Timers.Timer_T);

   procedure Enable (Timer : STM32.Devices.Timers.Timer_T);
   --  Enables the clock and timer together thereby avoiding the chance of a
   --  timer enable failure due to a stopped clock.

   procedure Enabled
     (Timer : STM32.Devices.Timers.Timer_T; Answer : out Boolean);

   --  procedure Configure (Config : in out Timers.Configuration);
   --     --  Configure the timers speed, resolution and reloading The counter
   --  mode
   --     --  cannot be changed whilst the Timer is enabled and will result in
   --  the
   --     --  timer being temporarily disabled and an event log.

   --  Configure the timers speed, resolution and reloading
   procedure Configure
     (Timer_Config : STM32.Timers.Config.Counter_Mode_16;
      Timer        : STM32.Devices.Timers.Counter_Mode_16)
   with Pre => Timer in STM32.Devices.Timers.Counter_Mode_16;

   procedure Configure
     (Timer_Config : STM32.Timers.Config.Counter_Mode_32;
      Timer        : STM32.Devices.Timers.Counter_Mode_32)
   with Pre => Timer in STM32.Devices.Timers.Counter_Mode_32;
   --  Configure the timers speed, resolution and reloading

   procedure Configure
     (Timer_Config : STM32.Timers.Config.General_Modeless;
      Timer        : STM32.Devices.Timers.General_Modeless)
   with Pre => Timer in STM32.Devices.Timers.General_Modeless;

   procedure Configure
     (Timer_Config : STM32.Timers.Config.Basic;
      Timer        : STM32.Devices.Timers.Basic)
   with Pre => Timer in STM32.Devices.Timers.Basic;

   --  type Set_Counter_Value (Bits_32 : Boolean := False) is record
   --     case Bits_32 is
   --        when True =>
   --           Value_32 : Unsigned_32 := 0;
   --        when False =>
   --           Value_16 : Unsigned_16 := 0;
   --     end case;
   --  end record;
   --
   --  procedure Set_Counter
   --    (Timer    : STM32.Devices.Timers.Timer_T;
   --     Value : Set_Counter_Value);

   procedure Set_Counter
     (Timer : STM32.Devices.Timers.Timer_T; Value : Unsigned_32)
   with
     Pre =>
       ((Timer in STM32.Devices.Timers.Counter_16_Bit)
        and then Value <= 16#FFFF#)
       or else Timer not in STM32.Devices.Timers.Counter_16_Bit;

   procedure Counter_Is
     (Timer : STM32.Devices.Timers.Timer_T; Output : out Unsigned_32);

   procedure Get_Autoreload
     (Timer : STM32.Devices.Timers.Timer_T; Autoreload : out Unsigned_32);
   --  This functions provides the autoreload part without the dithering bits

   procedure Set_Autoreload
     (Timer : STM32.Devices.Timers.Timer_T; Value : Unsigned_32)
   with
     Pre =>
       ((Timer in STM32.Devices.Timers.Counter_16_Bit)
        and then Value <= 16#FFFF#)
       or else Timer not in STM32.Devices.Timers.Counter_16_Bit;

   procedure Set_Counter_Direction
     (Timer       : Devices.Timers.Configurable_Direction;
      Counter_Dir : Non_Volatile.CR1_DIR.Field)
   with Pre => Timer in STM32.Devices.Timers.Configurable_Direction;

   procedure Set_Counter_Mode
     (Timer        : Devices.Timers.Counter_Mode;
      Counter_Mode : Non_Volatile.CR1_CMS.Field);
   --  Sets the counter alignment to various centered (up and down) or to the
   --  default edge aligned (up or down depedning on configured direction).
   --  The counter mode cannot be changed whilst the Timer is enabled and
   --  will result in Status.Success being set to False;

   procedure Set_Prescaler
     (Timer : STM32.Devices.Timers.Timer_T; Divide_By : Unsigned_16);
   --  Divides the clock speed by setting the Timer prescaler and sets the
   --  EGR.UG bit causing an update event that reinitialises the counter and
   --  causes the prescaler to take effect.

   procedure Generate_Update (Timer : STM32.Devices.Timers.Timer_T);

   procedure Enable_Update_Interrupt (Timer : STM32.Devices.Timers.Timer_T);

   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.Advanced;
   --     Source : Status.Timer1);
   --
   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.General_4_Channel;
   --     Source : Status.Timer2);
   --
   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.Basic;
   --     Source : Status.Timer6);
   --
   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.General_2_Channel;
   --     Source : Status.Timer15);
   --
   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.General_1_Channel;
   --     Source : Status.Timer16);

   procedure Clear_Status (Timer_Status : Status.Source_T);

   procedure Get_Status
     (Timer_Status : Status.Source_T; The_Status : out Boolean);

   --  Provide the Update enum for a particular timer. We were using predicates
   --  to solve this however the Handler with a global constant seemed to
   --  cause an unexplained ambiguous parameter issue on Get_Status which is
   --  unfortunate as it was quite neat :( Perhaps a lesson of sticking to Ada
   --  83 simpler ways being beneficial or atleast to avoid mixing predicates
   --  and procedure overloading? Joey Fish puts it as avoiding too much
   --  combinatorial complexity.
   function Timers_Update_Flag
     (Timer : Devices.Timers.Timer_T) return Status.Source_T;

   --  procedure Get_Status
   --    (Timer_Status :     Get_Status_T;
   --     The_Status   : out Boolean);

   --  procedure Get_Status
   --    (Timer      :     Devices.Timers.Advanced;
   --     Source     :     Status.Timer1;
   --     The_Status : out Boolean);
   --
   --  procedure Get_Status
   --    (Timer      :     Devices.Timers.General_4_Channel;
   --     Source     :     Status.Timer2;
   --     The_Status : out Boolean);
   --
   --  procedure Get_Status
   --    (Timer      :     Devices.Timers.Basic;
   --     Source     :     Status.Timer6;
   --     The_Status : out Boolean);
   --
   --  procedure Get_Status
   --    (Timer      :     Devices.Timers.General_2_Channel;
   --     Source     :     Status.Timer15;
   --     The_Status : out Boolean);
   --
   --  procedure Get_Status
   --    (Timer      :     Devices.Timers.General_1_Channel;
   --     Source     :     Status.Timer16;
   --     The_Status : out Boolean);

   --  TODO Counter is reset with preload not set procedure Configure
   --    (Timer     : in out STM32_SVD.TIM.TIM6_Peripheral;
   --     Prescaler :        Low_Power_Prescaler;
   --     Period    :        UInt16) with
   --          Pre =>ARR < CMP (Timer);

   --  TODO Counter is reset with preload, not set procedure Set_Counter
   --    (Timer : in out STM32_SVD.LPTIM.LPTIM_Peripheral;
   --     Value :        UInt16);

private

   procedure Is_Counter_Mode_Change_Allowed
     (Timer                : Devices.Timers.Configurable_Direction;
      Desired_Counter_Mode : Non_Volatile.CR1_CMS.Field;
      Allowed              : out Boolean);

end STM32.Timers.Run;
