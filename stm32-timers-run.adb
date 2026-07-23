with STM32.Alogs;
with STM32_SVD.RCC;
with STM32_SVD.TIM;
with HAL;

package body STM32.Timers.Run is

   procedure Enable_Clock (Timer : STM32.Devices.Timers.Timer_T) is
      Black_Hole : Boolean
      with Atomic, No_Caching;
   begin
      case Timer is
         when Devices.Timers.General_2  =>
            STM32_SVD.RCC.RCC_Periph.APBENR1.TIM2EN := True;
            --  Delay after an RCC peripheral clock enabling
            Black_Hole := STM32_SVD.RCC.RCC_Periph.APBENR1.TIM2EN;

         when Devices.Timers.General_3  =>
            STM32_SVD.RCC.RCC_Periph.APBENR1.TIM3EN := True;
            --  Delay after an RCC peripheral clock enabling
            Black_Hole := STM32_SVD.RCC.RCC_Periph.APBENR1.TIM3EN;

         when Devices.Timers.Basic_6    =>
            STM32_SVD.RCC.RCC_Periph.APBENR1.TIM6EN := True;
            --  Delay after an RCC peripheral clock enabling
            Black_Hole := STM32_SVD.RCC.RCC_Periph.APBENR1.TIM6EN;

         when Devices.Timers.Basic_7    =>
            STM32_SVD.RCC.RCC_Periph.APBENR1.TIM7EN := True;
            --  Delay after an RCC peripheral clock enabling
            Black_Hole := STM32_SVD.RCC.RCC_Periph.APBENR1.TIM7EN;

         when Devices.Timers.Advanced_1 =>
            STM32_SVD.RCC.RCC_Periph.APBENR2.TIM1EN := True;
            --  Delay after an RCC peripheral clock enabling
            Black_Hole := STM32_SVD.RCC.RCC_Periph.APBENR2.TIM1EN;

         when Devices.Timers.General_15 =>
            STM32_SVD.RCC.RCC_Periph.APBENR2.TIM15EN := True;
            --  Delay after an RCC peripheral clock enabling
            Black_Hole := STM32_SVD.RCC.RCC_Periph.APBENR2.TIM15EN;

         when Devices.Timers.General_16 =>
            STM32_SVD.RCC.RCC_Periph.APBENR2.TIM16EN := True;
            --  Delay after an RCC peripheral clock enabling
            Black_Hole := STM32_SVD.RCC.RCC_Periph.APBENR2.TIM16EN;
      end case;
   end Enable_Clock;

   procedure Disable_Clock (Timer : STM32.Devices.Timers.Timer_T) is
   begin
      case Timer is
         when Devices.Timers.General_2  =>
            STM32_SVD.RCC.RCC_Periph.APBENR1.TIM2EN := False;

         when Devices.Timers.General_3  =>
            STM32_SVD.RCC.RCC_Periph.APBENR1.TIM3EN := False;

         when Devices.Timers.Basic_6    =>
            STM32_SVD.RCC.RCC_Periph.APBENR1.TIM6EN := False;

         when Devices.Timers.Basic_7    =>
            STM32_SVD.RCC.RCC_Periph.APBENR1.TIM7EN := False;

         when Devices.Timers.Advanced_1 =>
            STM32_SVD.RCC.RCC_Periph.APBENR2.TIM1EN := False;

         when Devices.Timers.General_15 =>
            STM32_SVD.RCC.RCC_Periph.APBENR2.TIM15EN := False;

         when Devices.Timers.General_16 =>
            STM32_SVD.RCC.RCC_Periph.APBENR2.TIM16EN := False;
      end case;
   end Disable_Clock;

   procedure Clock_Is_Enabled
     (Timer : STM32.Devices.Timers.Timer_T; Answer : out Boolean) is
   begin
      case Timer is
         when Devices.Timers.General_2  =>
            Answer := STM32_SVD.RCC.RCC_Periph.APBENR1.TIM2EN;

         when Devices.Timers.General_3  =>
            Answer := STM32_SVD.RCC.RCC_Periph.APBENR1.TIM3EN;

         when Devices.Timers.Basic_6    =>
            Answer := STM32_SVD.RCC.RCC_Periph.APBENR1.TIM6EN;

         when Devices.Timers.Basic_7    =>
            Answer := STM32_SVD.RCC.RCC_Periph.APBENR1.TIM7EN;

         when Devices.Timers.Advanced_1 =>
            Answer := STM32_SVD.RCC.RCC_Periph.APBENR2.TIM1EN;

         when Devices.Timers.General_15 =>
            Answer := STM32_SVD.RCC.RCC_Periph.APBENR2.TIM15EN;

         when Devices.Timers.General_16 =>
            Answer := STM32_SVD.RCC.RCC_Periph.APBENR2.TIM16EN;
      end case;
   end Clock_Is_Enabled;

   procedure Reset_Clock (Timer : STM32.Devices.Timers.Timer_T) is
   begin
      case Timer is
         when Devices.Timers.General_2  =>
            STM32_SVD.RCC.RCC_Periph.APBRSTR1.TIM2RST := True;
            STM32_SVD.RCC.RCC_Periph.APBRSTR1.TIM2RST := False;

         when Devices.Timers.General_3  =>
            STM32_SVD.RCC.RCC_Periph.APBRSTR1.TIM3RST := True;
            STM32_SVD.RCC.RCC_Periph.APBRSTR1.TIM3RST := False;

         when Devices.Timers.Basic_6    =>
            STM32_SVD.RCC.RCC_Periph.APBRSTR1.TIM6RST := True;
            STM32_SVD.RCC.RCC_Periph.APBRSTR1.TIM6RST := False;

         when Devices.Timers.Basic_7    =>
            STM32_SVD.RCC.RCC_Periph.APBRSTR1.TIM7RST := True;
            STM32_SVD.RCC.RCC_Periph.APBRSTR1.TIM7RST := False;

         when Devices.Timers.Advanced_1 =>
            STM32_SVD.RCC.RCC_Periph.APBRSTR2.TIM1RST := True;
            STM32_SVD.RCC.RCC_Periph.APBRSTR2.TIM1RST := False;

         when Devices.Timers.General_15 =>
            STM32_SVD.RCC.RCC_Periph.APBRSTR2.TIM15RST := True;
            STM32_SVD.RCC.RCC_Periph.APBRSTR2.TIM15RST := False;

         when Devices.Timers.General_16 =>
            STM32_SVD.RCC.RCC_Periph.APBRSTR2.TIM16RST := True;
            STM32_SVD.RCC.RCC_Periph.APBRSTR2.TIM16RST := False;
      end case;
   end Reset_Clock;

   procedure Disable (Timer : STM32.Devices.Timers.Timer_T) is
   begin
      case Timer is
         when Devices.Timers.General_2  =>
            STM32_SVD.TIM.TIM2_Output_Periph.CR1.CEN := False;

         when Devices.Timers.General_3  =>
            STM32_SVD.TIM.TIM3_Output_Periph.CR1.CEN := False;

         when Devices.Timers.Basic_6    =>
            STM32_SVD.TIM.TIM6_Periph.CR1.CEN := False;

         when Devices.Timers.Basic_7    =>
            STM32_SVD.TIM.TIM7_Periph.CR1.CEN := False;

         when Devices.Timers.Advanced_1 =>
            STM32_SVD.TIM.TIM1_Output_Periph.CR1.CEN := False;

         when Devices.Timers.General_15 =>
            STM32_SVD.TIM.TIM15_Output_Periph.CR1.CEN := False;

         when Devices.Timers.General_16 =>
            STM32_SVD.TIM.TIM16_Output_Periph.CR1.CEN := False;
      end case;
   end Disable;

   procedure Enable (Timer : STM32.Devices.Timers.Timer_T) is
      Clock_Enabled : Boolean;
      Timer_Enabled : Boolean;
   begin
      Clock_Is_Enabled (Timer => Timer, Answer => Clock_Enabled);
      if not Clock_Enabled then
         Enable_Clock (Timer);
      end if;

      Enabled (Timer => Timer, Answer => Timer_Enabled);
      if Timer_Enabled then
         Alogs.Log
           (Log_ID  => "dT$2C1s",
            Message => "Timer enabled; Conflict?: " & Timer'Image);
      end if;

      case Timer is
         when Devices.Timers.Advanced_1 =>
            STM32_SVD.TIM.TIM1_Output_Periph.CR1.CEN := True;

         when Devices.Timers.General_2  =>
            STM32_SVD.TIM.TIM2_Output_Periph.CR1.CEN := True;

         when Devices.Timers.General_3  =>
            STM32_SVD.TIM.TIM3_Output_Periph.CR1.CEN := True;

         when Devices.Timers.Basic_6    =>
            STM32_SVD.TIM.TIM6_Periph.CR1.CEN := True;

         when Devices.Timers.Basic_7    =>
            STM32_SVD.TIM.TIM7_Periph.CR1.CEN := True;

         when Devices.Timers.General_15 =>
            STM32_SVD.TIM.TIM15_Output_Periph.CR1.CEN := True;

         when Devices.Timers.General_16 =>
            STM32_SVD.TIM.TIM16_Output_Periph.CR1.CEN := True;
      end case;

   end Enable;

   procedure Enabled
     (Timer : STM32.Devices.Timers.Timer_T; Answer : out Boolean) is
   begin
      case Timer is
         when Devices.Timers.General_2  =>
            Answer := STM32_SVD.TIM.TIM2_Output_Periph.CR1.CEN;

         when Devices.Timers.General_3  =>
            Answer := STM32_SVD.TIM.TIM3_Output_Periph.CR1.CEN;

         when Devices.Timers.Basic_6    =>
            Answer := STM32_SVD.TIM.TIM6_Periph.CR1.CEN;

         when Devices.Timers.Basic_7    =>
            Answer := STM32_SVD.TIM.TIM7_Periph.CR1.CEN;

         when Devices.Timers.Advanced_1 =>
            Answer := STM32_SVD.TIM.TIM1_Output_Periph.CR1.CEN;

         when Devices.Timers.General_15 =>
            Answer := STM32_SVD.TIM.TIM15_Output_Periph.CR1.CEN;

         when Devices.Timers.General_16 =>
            Answer := STM32_SVD.TIM.TIM16_Output_Periph.CR1.CEN;
      end case;
   end Enabled;

   --  Variant record delivers one Configure routine in a more maintainable
   --  way due to case checks but is less wieldy from a user API point of
   --  view procedure Configure (Config : in out Timers.Configuration) is begin
   --     if not Clock_Enabled (Config.Timer) then
   --        Alogs.Log
   --          (Log_ID      => Log_File_Code,
   --           Line_No         => GNAT.Source_Info.Line,
   --           Source_Location => GNAT.Source_Info.Source_Location,
   --           Message         =>
   --             "Warning: The Timers clock should be enabled and managed
   --  by the user");
   --        Enable_Clock (Config.Timer);
   --     end if;
   --
   --     case Config.Timer is
   --        when Devices.Timers.Advanced_1 =>
   --           Config.Advanced_1.ARR := HAL.UInt16
   --  (Config.Autoreload_Period_16);
   --           Config.Advanced_1.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.Advanced_1.CR1.CKD := HAL.UInt2 (Config.Clock_Div);
   --           Config.Advanced_1.CR1.DIR := Boolean (Config.Counter_Dir);
   --           Set_Counter_Mode
   --             (Timer        => Config.Timer,
   --              Counter_Mode => Config.Counter_Mode);
   --           Config.Advanced_1.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.General_2 =>
   --           Config.General_2.ARR     := HAL.UInt32
   --  (Config.Autoreload_Period_32);
   --           Config.General_2.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.General_2.CR1.CKD := HAL.UInt2 (Config.Clock_Div);
   --           Config.General_2.CR1.DIR := Boolean (Config.Counter_Dir);
   --           Set_Counter_Mode
   --             (Timer        => Config.Timer,
   --              Counter_Mode => Config.Counter_Mode);
   --           Config.General_2.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.General_3 =>
   --           Config.General_3.ARR := HAL.UInt16
   --  (Config.Autoreload_Period_16);
   --           Config.General_3.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.General_3.CR1.CKD := HAL.UInt2 (Config.Clock_Div);
   --           Config.General_3.CR1.DIR := Boolean (Config.Counter_Dir);
   --           Set_Counter_Mode
   --             (Timer        => Config.Timer,
   --              Counter_Mode => Config.Counter_Mode);
   --           Config.General_3.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.General_4 =>
   --           Config.General_4.ARR := HAL.UInt16
   --  (Config.Autoreload_Period_16);
   --           Config.General_4.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.General_4.CR1.CKD := HAL.UInt2 (Config.Clock_Div);
   --           Config.General_4.CR1.DIR := Boolean (Config.Counter_Dir);
   --           Set_Counter_Mode
   --             (Timer        => Config.Timer,
   --              Counter_Mode => Config.Counter_Mode);
   --           Config.General_4.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.General_5 =>
   --           Config.General_5.ARR     := HAL.UInt32
   --  (Config.Autoreload_Period_32);
   --           Config.General_5.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.General_5.CR1.CKD := HAL.UInt2 (Config.Clock_Div);
   --           Config.General_5.CR1.DIR := Boolean (Config.Counter_Dir);
   --           Set_Counter_Mode
   --             (Timer        => Config.Timer,
   --              Counter_Mode => Config.Counter_Mode);
   --           Config.General_5.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.Basic_6 =>
   --           Config.Basic_6.ARR := HAL.UInt16 (Config.Autoreload_Period_16);
   --           Config.Basic_6.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.Basic_6.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.Basic_7 =>
   --           Config.Basic_7.ARR := HAL.UInt16 (Config.Autoreload_Period_16);
   --           Config.Basic_7.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.Basic_7.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.Advanced_8 =>
   --           Config.Advanced_8.ARR := HAL.UInt16
   --  (Config.Autoreload_Period_16);
   --           Config.Advanced_8.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.Advanced_8.CR1.CKD := HAL.UInt2 (Config.Clock_Div);
   --           Config.Advanced_8.CR1.DIR := Boolean (Config.Counter_Dir);
   --           Set_Counter_Mode
   --             (Timer        => Config.Timer,
   --              Counter_Mode => Config.Counter_Mode);
   --           Config.Advanced_8.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.General_15 =>
   --           Config.General_15.ARR := HAL.UInt16
   --  (Config.Autoreload_Period_16);
   --           Config.General_15.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.General_15.CR1.CKD := HAL.UInt2 (Config.Clock_Div);
   --           Config.General_15.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.General_16 =>
   --           Config.General_16.ARR := HAL.UInt16
   --  (Config.Autoreload_Period_16);
   --           Config.General_16.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.General_16.CR1.CKD := HAL.UInt2 (Config.Clock_Div);
   --           Config.General_16.CR1.OPM := Boolean (Config.PulseMode);
   --
   --        when Devices.Timers.General_17 =>
   --           Config.General_17.ARR := HAL.UInt16
   --  (Config.Autoreload_Period_16);
   --           Config.General_17.PSC := HAL.UInt16 (Config.Prescaler);
   --           Config.General_17.CR1.CKD := HAL.UInt2 (Config.Clock_Div);
   --           Config.General_17.CR1.OPM := Boolean (Config.PulseMode);
   --     end case;
   --
   --  end Configure;

   procedure Configure
     (Timer_Config : STM32.Timers.Config.Counter_Mode_16;
      Timer        : STM32.Devices.Timers.Counter_Mode_16)
   is
      Clock_Enabled : Boolean;
   begin

      Clock_Is_Enabled (Timer => Timer, Answer => Clock_Enabled);
      if not Clock_Enabled then
         Alogs.Log (Log_ID => "7*:{-vj", Message => Log_Msg.Clock_Not_Enabled);
         Enable_Clock (Timer);
      end if;

      case Timer is
         when Devices.Timers.Advanced_1 =>
            STM32_SVD.TIM.TIM1_Output_Periph.ARR :=
              HAL.UInt16 (Timer_Config.Autoreload_Value);
            STM32_SVD.TIM.TIM1_Output_Periph.PSC :=
              HAL.UInt16 (Timer_Config.Prescaler);
            STM32_SVD.TIM.TIM1_Output_Periph.CR1.CKD :=
              STM32_SVD.TIM.CR1_CKD_Field (Timer_Config.Clock_Div);
            STM32_SVD.TIM.TIM1_Output_Periph.CR1.DIR :=
              STM32_SVD.TIM.CR1_DIR_Field (Timer_Config.Counter_Dir);
            STM32_SVD.TIM.TIM1_Output_Periph.CR1.OPM :=
              Boolean (Timer_Config.PulseMode);

         when Devices.Timers.General_3  =>
            STM32_SVD.TIM.TIM3_Output_Periph.ARR :=
              HAL.UInt32 (Timer_Config.Autoreload_Value);
            STM32_SVD.TIM.TIM3_Output_Periph.PSC :=
              HAL.UInt16 (Timer_Config.Prescaler);
            STM32_SVD.TIM.TIM3_Output_Periph.CR1.CKD :=
              STM32_SVD.TIM.CR1_CKD_Field (Timer_Config.Clock_Div);
            STM32_SVD.TIM.TIM3_Output_Periph.CR1.DIR :=
              STM32_SVD.TIM.CR1_DIR_Field (Timer_Config.Counter_Dir);
            STM32_SVD.TIM.TIM3_Output_Periph.CR1.OPM :=
              Boolean (Timer_Config.PulseMode);
      end case;

   end Configure;

   procedure Configure
     (Timer_Config : STM32.Timers.Config.Counter_Mode_32;
      Timer        : STM32.Devices.Timers.Counter_Mode_32)
   is
      Clock_Enabled : Boolean;
   begin

      Clock_Is_Enabled (Timer => Timer, Answer => Clock_Enabled);
      if not Clock_Enabled then
         Alogs.Log (Log_ID => "KIXybPa", Message => Log_Msg.Clock_Not_Enabled);
         Enable_Clock (Timer);
      end if;

      STM32_SVD.TIM.TIM2_Output_Periph.ARR :=
        HAL.UInt32 (Timer_Config.Autoreload_Value);
      STM32_SVD.TIM.TIM2_Output_Periph.PSC :=
        HAL.UInt16 (Timer_Config.Prescaler);
      STM32_SVD.TIM.TIM2_Output_Periph.CR1.CKD :=
        STM32_SVD.TIM.CR1_CKD_Field (Timer_Config.Clock_Div);
      STM32_SVD.TIM.TIM2_Output_Periph.CR1.DIR :=
        STM32_SVD.TIM.CR1_DIR_Field (Timer_Config.Counter_Dir);
      STM32_SVD.TIM.TIM2_Output_Periph.CR1.OPM :=
        Boolean (Timer_Config.PulseMode);

   end Configure;

   procedure Configure
     (Timer_Config : STM32.Timers.Config.General_Modeless;
      Timer        : STM32.Devices.Timers.General_Modeless)
   is
      Clock_Enabled : Boolean;
   begin
      Clock_Is_Enabled (Timer => Timer, Answer => Clock_Enabled);
      if not Clock_Enabled then
         Alogs.Log (Log_ID => "NlX?Pzm", Message => Log_Msg.Clock_Not_Enabled);
         Enable_Clock (Timer);
      end if;

      case Timer is

         when Devices.Timers.General_15 =>
            STM32_SVD.TIM.TIM15_Output_Periph.ARR :=
              HAL.UInt16 (Timer_Config.Autoreload_Value);
            STM32_SVD.TIM.TIM15_Output_Periph.PSC :=
              HAL.UInt16 (Timer_Config.Prescaler);
            STM32_SVD.TIM.TIM15_Output_Periph.CR1.CKD :=
              STM32_SVD.TIM.CR1_CKD_Field (Timer_Config.Clock_Div);
            STM32_SVD.TIM.TIM15_Output_Periph.CR1.OPM :=
              Boolean (Timer_Config.PulseMode);

         when Devices.Timers.General_16 =>
            STM32_SVD.TIM.TIM16_Output_Periph.ARR :=
              HAL.UInt16 (Timer_Config.Autoreload_Value);
            STM32_SVD.TIM.TIM16_Output_Periph.PSC :=
              HAL.UInt16 (Timer_Config.Prescaler);
            STM32_SVD.TIM.TIM16_Output_Periph.CR1.CKD :=
              STM32_SVD.TIM.CR1_CKD_Field (Timer_Config.Clock_Div);
            STM32_SVD.TIM.TIM16_Output_Periph.CR1.OPM :=
              Boolean (Timer_Config.PulseMode);

      end case;

   end Configure;

   procedure Configure
     (Timer_Config : STM32.Timers.Config.Basic;
      Timer        : STM32.Devices.Timers.Basic)
   is
      Clock_Enabled : Boolean;
   begin
      Clock_Is_Enabled (Timer => Timer, Answer => Clock_Enabled);
      if not Clock_Enabled then
         Alogs.Log (Log_ID => ">Hr/yD3", Message => Log_Msg.Clock_Not_Enabled);
         Enable_Clock (Timer);
      end if;

      case Timer is
         when Devices.Timers.Basic_6 =>
            STM32_SVD.TIM.TIM6_Periph.ARR :=
              HAL.UInt16 (Timer_Config.Autoreload_Value);
            STM32_SVD.TIM.TIM6_Periph.PSC :=
              HAL.UInt16 (Timer_Config.Prescaler);
            STM32_SVD.TIM.TIM6_Periph.CR1.OPM :=
              Boolean (Timer_Config.PulseMode);

         when Devices.Timers.Basic_7 =>
            STM32_SVD.TIM.TIM7_Periph.ARR :=
              HAL.UInt16 (Timer_Config.Autoreload_Value);
            STM32_SVD.TIM.TIM7_Periph.PSC :=
              HAL.UInt16 (Timer_Config.Prescaler);
            STM32_SVD.TIM.TIM7_Periph.CR1.OPM :=
              Boolean (Timer_Config.PulseMode);
      end case;

   end Configure;

   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.Advanced;
   --     Source : Status.Timer1)
   --  is
   --  begin
   --     case Source is
   --        when Status.Update =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.UIF := False;
   --           end case;
   --
   --        when Status.CC1 =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC1IF := False;
   --           end case;
   --
   --        when Status.CC2 =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC2IF := False;
   --           end case;
   --
   --        when Status.CC3 =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC3IF := False;
   --           end case;
   --
   --        when Status.CC4 =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC4IF := False;
   --           end case;
   --
   --        when Status.CC5 =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC5IF := False;
   --           end case;
   --
   --        when Status.CC6 =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC6IF := False;
   --           end case;
   --
   --        when Status.COM =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.COMIF := False;
   --           end case;
   --
   --        when Status.Trigger =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.TIF := False;
   --           end case;
   --
   --        when Status.Break =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.BIF := False;
   --           end case;
   --
   --        when Status.Break2 =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.B2IF := False;
   --           end case;
   --
   --        when Status.CC1OF =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC1OF := False;
   --           end case;
   --
   --        when Status.CC2OF =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC2OF := False;
   --           end case;
   --
   --        when Status.CC3OF =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC3OF := False;
   --           end case;
   --
   --        when Status.CC4OF =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.CC4OF := False;
   --           end case;
   --
   --        when Status.System_Break =>
   --           case Timer is
   --              when Devices.Timers.Advanced_1 =>
   --                 STM32_SVD.TIM.TIM1_Output_Periph.SR.SBIF := False;
   --           end case;
   --     end case;
   --  end Clear_Status;
   --
   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.General_4_Channel;
   --     Source : Status.Timer2)
   --  is
   --  begin
   --     case Source is
   --        when Status.Update =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.UIF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.UIF := False;
   --           end case;
   --
   --        when Status.CC1 =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.CC1IF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.CC1IF := False;
   --           end case;
   --
   --        when Status.CC2 =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.CC2IF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.CC2IF := False;
   --           end case;
   --
   --        when Status.CC3 =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.CC3IF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.CC3IF := False;
   --           end case;
   --
   --        when Status.CC4 =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.CC4IF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.CC4IF := False;
   --           end case;
   --
   --        when Status.Trigger =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.TIF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.TIF := False;
   --           end case;
   --
   --        when Status.CC1OF =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.CC1OF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.CC1OF := False;
   --           end case;
   --
   --        when Status.CC2OF =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.CC2OF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.CC2OF := False;
   --           end case;
   --
   --        when Status.CC3OF =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.CC3OF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.CC3OF := False;
   --           end case;
   --
   --        when Status.CC4OF =>
   --           case Timer is
   --              when Devices.Timers.General_2 =>
   --                 STM32_SVD.TIM.TIM2_Output_Periph.SR.CC4OF := False;
   --              when Devices.Timers.General_3 =>
   --                 STM32_SVD.TIM.TIM3_Output_Periph.SR.CC4OF := False;
   --           end case;
   --     end case;
   --  end Clear_Status;
   --
   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.Basic;
   --     Source : Status.Timer6)
   --  is
   --  begin
   --     case Source is
   --        when Status.Update =>
   --           case Timer is
   --              when Devices.Timers.Basic_6 =>
   --                 STM32_SVD.TIM.TIM6_Periph.SR.UIF := False;
   --              when Devices.Timers.Basic_7 =>
   --                 STM32_SVD.TIM.TIM7_Periph.SR.UIF := False;
   --           end case;
   --     end case;
   --  end Clear_Status;
   --
   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.General_2_Channel;
   --     Source : Status.Timer15)
   --  is
   --  begin
   --     case Timer is
   --        when Devices.Timers.General_15 =>
   --           case Source is
   --              when Status.Update =>
   --                 STM32_SVD.TIM.TIM15_Output_Periph.SR.UIF := False;
   --
   --              when Status.CC1 =>
   --                 STM32_SVD.TIM.TIM15_Output_Periph.SR.CC1IF := False;
   --
   --              when Status.CC2 =>
   --                 STM32_SVD.TIM.TIM15_Output_Periph.SR.CC2IF := False;
   --
   --              when Status.COM =>
   --                 STM32_SVD.TIM.TIM15_Output_Periph.SR.COMIF := False;
   --
   --              when Status.Trigger =>
   --                 STM32_SVD.TIM.TIM15_Output_Periph.SR.TIF := False;
   --
   --              when Status.Break =>
   --                 STM32_SVD.TIM.TIM15_Output_Periph.SR.BIF := False;
   --
   --              when Status.CC1OF =>
   --                 STM32_SVD.TIM.TIM15_Output_Periph.SR.CC1OF := False;
   --
   --              when Status.CC2OF =>
   --                 STM32_SVD.TIM.TIM15_Output_Periph.SR.CC2OF := False;
   --           end case;
   --     end case;
   --  end Clear_Status;
   --
   --  procedure Clear_Status
   --    (Timer  : Devices.Timers.General_1_Channel;
   --     Source : Status.Timer16)
   --  is
   --  begin
   --     case Source is
   --        when Status.Update =>
   --           case Timer is
   --              when Devices.Timers.General_16 =>
   --                 STM32_SVD.TIM.TIM16_Output_Periph.SR.UIF := False;
   --           end case;
   --
   --        when Status.CC1 =>
   --           case Timer is
   --              when Devices.Timers.General_16 =>
   --                 STM32_SVD.TIM.TIM16_Output_Periph.SR.CC1IF := False;
   --           end case;
   --
   --        when Status.COM =>
   --           case Timer is
   --              when Devices.Timers.General_16 =>
   --                 STM32_SVD.TIM.TIM16_Output_Periph.SR.COMIF := False;
   --           end case;
   --
   --        when Status.Break =>
   --           case Timer is
   --              when Devices.Timers.General_16 =>
   --                 STM32_SVD.TIM.TIM16_Output_Periph.SR.BIF := False;
   --           end case;
   --
   --        when Status.CC1OF =>
   --           case Timer is
   --              when Devices.Timers.General_16 =>
   --                 STM32_SVD.TIM.TIM16_Output_Periph.SR.CC1OF := False;
   --           end case;
   --     end case;
   --  end Clear_Status;

   procedure Clear_Status (Timer_Status : Status.Source_T) is
   begin
      case Timer_Status is
         when Status.Advanced_1_Update       =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.UIF := False;

         when Status.Advanced_1_CC1          =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC1IF := False;

         when Status.Advanced_1_CC2          =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC2IF := False;

         when Status.Advanced_1_CC3          =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC3IF := False;

         when Status.Advanced_1_CC4          =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC4IF := False;

         when Status.Advanced_1_CC5          =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC5IF := False;

         when Status.Advanced_1_CC6          =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC6IF := False;

         when Status.Advanced_1_COM          =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.COMIF := False;

         when Status.Advanced_1_Trigger      =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.TIF := False;

         when Status.Advanced_1_Break        =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.BIF := False;

         when Status.Advanced_1_Break2       =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.B2IF := False;

         when Status.Advanced_1_CC1OF        =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC1OF := False;

         when Status.Advanced_1_CC2OF        =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC2OF := False;

         when Status.Advanced_1_CC3OF        =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC3OF := False;

         when Status.Advanced_1_CC4OF        =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.CC4OF := False;

         when Status.Advanced_1_System_Break =>
            STM32_SVD.TIM.TIM1_Output_Periph.SR.SBIF := False;

         when Status.General_2_Update        =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.UIF := False;

         when Status.General_2_CC1           =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.CC1IF := False;

         when Status.General_2_CC2           =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.CC2IF := False;

         when Status.General_2_CC3           =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.CC3IF := False;

         when Status.General_2_CC4           =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.CC4IF := False;

         when Status.General_2_Trigger       =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.TIF := False;

         when Status.General_2_CC1OF         =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.CC1OF := False;

         when Status.General_2_CC2OF         =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.CC2OF := False;

         when Status.General_2_CC3OF         =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.CC3OF := False;

         when Status.General_2_CC4OF         =>
            STM32_SVD.TIM.TIM2_Output_Periph.SR.CC4OF := False;

         when Status.General_3_Update        =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.UIF := False;

         when Status.General_3_CC1           =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.CC1IF := False;

         when Status.General_3_CC2           =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.CC2IF := False;

         when Status.General_3_CC3           =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.CC3IF := False;

         when Status.General_3_CC4           =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.CC4IF := False;

         when Status.General_3_Trigger       =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.TIF := False;

         when Status.General_3_CC1OF         =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.CC1OF := False;

         when Status.General_3_CC2OF         =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.CC2OF := False;

         when Status.General_3_CC3OF         =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.CC3OF := False;

         when Status.General_3_CC4OF         =>
            STM32_SVD.TIM.TIM3_Output_Periph.SR.CC4OF := False;

         when Status.Basic_6_Update          =>
            STM32_SVD.TIM.TIM6_Periph.SR.UIF := False;

         when Status.Basic_7_Update          =>
            STM32_SVD.TIM.TIM7_Periph.SR.UIF := False;

         when Status.General_15_Update       =>
            STM32_SVD.TIM.TIM15_Output_Periph.SR.UIF := False;

         when Status.General_15_CC1          =>
            STM32_SVD.TIM.TIM15_Output_Periph.SR.CC1IF := False;

         when Status.General_15_CC2          =>
            STM32_SVD.TIM.TIM15_Output_Periph.SR.CC2IF := False;

         when Status.General_15_COM          =>
            STM32_SVD.TIM.TIM15_Output_Periph.SR.COMIF := False;

         when Status.General_15_Trigger      =>
            STM32_SVD.TIM.TIM15_Output_Periph.SR.TIF := False;

         when Status.General_15_Break        =>
            STM32_SVD.TIM.TIM15_Output_Periph.SR.BIF := False;

         when Status.General_15_CC1OF        =>
            STM32_SVD.TIM.TIM15_Output_Periph.SR.CC1OF := False;

         when Status.General_15_CC2OF        =>
            STM32_SVD.TIM.TIM15_Output_Periph.SR.CC2OF := False;

         when Status.General_16_Update       =>
            STM32_SVD.TIM.TIM16_Output_Periph.SR.UIF := False;

         when Status.General_16_CC1          =>
            STM32_SVD.TIM.TIM16_Output_Periph.SR.CC1IF := False;

         when Status.General_16_COM          =>
            STM32_SVD.TIM.TIM16_Output_Periph.SR.COMIF := False;

         when Status.General_16_Break        =>
            STM32_SVD.TIM.TIM16_Output_Periph.SR.BIF := False;

         when Status.General_16_CC1OF        =>
            STM32_SVD.TIM.TIM16_Output_Periph.SR.CC1OF := False;
      end case;

   end Clear_Status;

   procedure Get_Status
     (Timer_Status : Status.Source_T; The_Status : out Boolean) is
   begin
      case Timer_Status is
         when Status.Advanced_1_Update       =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.UIF;

         when Status.Advanced_1_CC1          =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC1IF;

         when Status.Advanced_1_CC2          =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC2IF;

         when Status.Advanced_1_CC3          =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC3IF;

         when Status.Advanced_1_CC4          =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC4IF;

         when Status.Advanced_1_CC5          =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC5IF;

         when Status.Advanced_1_CC6          =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC6IF;

         when Status.Advanced_1_COM          =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.COMIF;

         when Status.Advanced_1_Trigger      =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.TIF;

         when Status.Advanced_1_Break        =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.BIF;

         when Status.Advanced_1_Break2       =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.B2IF;

         when Status.Advanced_1_CC1OF        =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC1OF;

         when Status.Advanced_1_CC2OF        =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC2OF;

         when Status.Advanced_1_CC3OF        =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC3OF;

         when Status.Advanced_1_CC4OF        =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.CC4OF;

         when Status.Advanced_1_System_Break =>
            The_Status := STM32_SVD.TIM.TIM1_Output_Periph.SR.SBIF;

         when Status.General_2_Update        =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.UIF;

         when Status.General_2_CC1           =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.CC1IF;

         when Status.General_2_CC2           =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.CC2IF;

         when Status.General_2_CC3           =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.CC3IF;

         when Status.General_2_CC4           =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.CC4IF;

         when Status.General_2_Trigger       =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.TIF;

         when Status.General_2_CC1OF         =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.CC1OF;

         when Status.General_2_CC2OF         =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.CC2OF;

         when Status.General_2_CC3OF         =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.CC3OF;

         when Status.General_2_CC4OF         =>
            The_Status := STM32_SVD.TIM.TIM2_Output_Periph.SR.CC4OF;

         when Status.General_3_Update        =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.UIF;

         when Status.General_3_CC1           =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.CC1IF;

         when Status.General_3_CC2           =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.CC2IF;

         when Status.General_3_CC3           =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.CC3IF;

         when Status.General_3_CC4           =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.CC4IF;

         when Status.General_3_Trigger       =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.TIF;

         when Status.General_3_CC1OF         =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.CC1OF;

         when Status.General_3_CC2OF         =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.CC2OF;

         when Status.General_3_CC3OF         =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.CC3OF;

         when Status.General_3_CC4OF         =>
            The_Status := STM32_SVD.TIM.TIM3_Output_Periph.SR.CC4OF;

         when Status.Basic_6_Update          =>
            The_Status := STM32_SVD.TIM.TIM6_Periph.SR.UIF;

         when Status.Basic_7_Update          =>
            The_Status := STM32_SVD.TIM.TIM7_Periph.SR.UIF;

         when Status.General_15_Update       =>
            The_Status := STM32_SVD.TIM.TIM15_Output_Periph.SR.UIF;

         when Status.General_15_CC1          =>
            The_Status := STM32_SVD.TIM.TIM15_Output_Periph.SR.CC1IF;

         when Status.General_15_CC2          =>
            The_Status := STM32_SVD.TIM.TIM15_Output_Periph.SR.CC2IF;

         when Status.General_15_COM          =>
            The_Status := STM32_SVD.TIM.TIM15_Output_Periph.SR.COMIF;

         when Status.General_15_Trigger      =>
            The_Status := STM32_SVD.TIM.TIM15_Output_Periph.SR.TIF;

         when Status.General_15_Break        =>
            The_Status := STM32_SVD.TIM.TIM15_Output_Periph.SR.BIF;

         when Status.General_15_CC1OF        =>
            The_Status := STM32_SVD.TIM.TIM15_Output_Periph.SR.CC1OF;

         when Status.General_15_CC2OF        =>
            The_Status := STM32_SVD.TIM.TIM15_Output_Periph.SR.CC2OF;

         when Status.General_16_Update       =>
            The_Status := STM32_SVD.TIM.TIM16_Output_Periph.SR.UIF;

         when Status.General_16_CC1          =>
            The_Status := STM32_SVD.TIM.TIM16_Output_Periph.SR.CC1IF;

         when Status.General_16_COM          =>
            The_Status := STM32_SVD.TIM.TIM16_Output_Periph.SR.COMIF;

         when Status.General_16_Break        =>
            The_Status := STM32_SVD.TIM.TIM16_Output_Periph.SR.BIF;

         when Status.General_16_CC1OF        =>
            The_Status := STM32_SVD.TIM.TIM16_Output_Periph.SR.CC1OF;
      end case;

   end Get_Status;

   function Timers_Update_Flag
     (Timer : Devices.Timers.Timer_T) return Status.Source_T is
   begin
      case Timer is
         when Devices.Timers.General_2  =>
            return Status.General_2_Update;

         when Devices.Timers.General_3  =>
            return Status.General_3_Update;

         when Devices.Timers.Basic_6    =>
            return Status.Basic_6_Update;

         when Devices.Timers.Basic_7    =>
            return Status.Basic_7_Update;

         when Devices.Timers.Advanced_1 =>
            return Status.Advanced_1_Update;

         when Devices.Timers.General_15 =>
            return Status.General_15_Update;

         when Devices.Timers.General_16 =>
            return Status.General_16_Update;
      end case;
   end Timers_Update_Flag;

   procedure Set_Counter
     (Timer : STM32.Devices.Timers.Timer_T; Value : Unsigned_32) is
   begin
      case Timer is
         when Devices.Timers.Advanced_1 =>
            STM32_SVD.TIM.TIM1_Output_Periph.CNT.CNT := HAL.UInt16'Mod (Value);

         when Devices.Timers.General_2  =>
            STM32_SVD.TIM.TIM2_Output_Periph.CNT := HAL.UInt32 (Value);

         when Devices.Timers.General_3  =>
            --  XXX The SVD should be updated to be 16 bit
            STM32_SVD.TIM.TIM3_Output_Periph.CNT := HAL.UInt32 (Value);

         when Devices.Timers.Basic_6    =>
            STM32_SVD.TIM.TIM6_Periph.CNT.CNT := HAL.UInt16'Mod (Value);

         when Devices.Timers.Basic_7    =>
            STM32_SVD.TIM.TIM7_Periph.CNT.CNT := HAL.UInt16'Mod (Value);

         when Devices.Timers.General_15 =>
            STM32_SVD.TIM.TIM15_Output_Periph.CNT.CNT :=
              HAL.UInt16'Mod (Value);

         when Devices.Timers.General_16 =>
            STM32_SVD.TIM.TIM16_Output_Periph.CNT.CNT :=
              HAL.UInt16'Mod (Value);
      end case;
   end Set_Counter;

   procedure Counter_Is
     (Timer : STM32.Devices.Timers.Timer_T; Output : out Unsigned_32) is
   begin
      case Timer is
         when Devices.Timers.Advanced_1 =>
            Output := Unsigned_32 (STM32_SVD.TIM.TIM1_Output_Periph.CNT.CNT);

         when Devices.Timers.General_2  =>
            Output := Unsigned_32 (STM32_SVD.TIM.TIM2_Output_Periph.CNT);

         when Devices.Timers.General_3  =>
            Output := Unsigned_32 (STM32_SVD.TIM.TIM3_Output_Periph.CNT);

         when Devices.Timers.Basic_6    =>
            Output := Unsigned_32 (STM32_SVD.TIM.TIM6_Periph.CNT.CNT);

         when Devices.Timers.Basic_7    =>
            Output := Unsigned_32 (STM32_SVD.TIM.TIM7_Periph.CNT.CNT);

         when Devices.Timers.General_15 =>
            Output := Unsigned_32 (STM32_SVD.TIM.TIM15_Output_Periph.CNT.CNT);

         when Devices.Timers.General_16 =>
            Output := Unsigned_32 (STM32_SVD.TIM.TIM16_Output_Periph.CNT.CNT);
      end case;
   end Counter_Is;

   procedure Get_Autoreload
     (Timer : STM32.Devices.Timers.Timer_T; Autoreload : out Unsigned_32) is
   begin
      case Timer is
         when Devices.Timers.Basic_6    =>
            Autoreload := Unsigned_32 (STM32_SVD.TIM.TIM6_Periph.ARR);

         when Devices.Timers.Basic_7    =>
            Autoreload := Unsigned_32 (STM32_SVD.TIM.TIM7_Periph.ARR);

         when Devices.Timers.Advanced_1 =>
            Autoreload := Unsigned_32 (STM32_SVD.TIM.TIM1_Output_Periph.ARR);

         when Devices.Timers.General_2  =>
            Autoreload := Unsigned_32 (STM32_SVD.TIM.TIM2_Output_Periph.ARR);

         when Devices.Timers.General_3  =>
            Autoreload := Unsigned_32 (STM32_SVD.TIM.TIM3_Output_Periph.ARR);

         when Devices.Timers.General_15 =>
            Autoreload := Unsigned_32 (STM32_SVD.TIM.TIM15_Output_Periph.ARR);

         when Devices.Timers.General_16 =>
            Autoreload := Unsigned_32 (STM32_SVD.TIM.TIM16_Output_Periph.ARR);

      end case;
   end Get_Autoreload;

   procedure Set_Autoreload
     (Timer : STM32.Devices.Timers.Timer_T; Value : Unsigned_32) is
   begin
      case Timer is

         when Devices.Timers.Advanced_1 =>
            STM32_SVD.TIM.TIM1_Output_Periph.ARR := HAL.UInt16'Mod (Value);

         when Devices.Timers.General_2  =>
            STM32_SVD.TIM.TIM2_Output_Periph.ARR := HAL.UInt32 (Value);

         when Devices.Timers.General_3  =>
            --  XXX The SVD should be updated to be 16 bit
            STM32_SVD.TIM.TIM3_Output_Periph.ARR := HAL.UInt32 (Value);

         when Devices.Timers.Basic_6    =>
            STM32_SVD.TIM.TIM6_Periph.ARR := HAL.UInt16'Mod (Value);

         when Devices.Timers.Basic_7    =>
            STM32_SVD.TIM.TIM7_Periph.ARR := HAL.UInt16'Mod (Value);

         when Devices.Timers.General_15 =>
            STM32_SVD.TIM.TIM15_Output_Periph.ARR := HAL.UInt16'Mod (Value);

         when Devices.Timers.General_16 =>
            STM32_SVD.TIM.TIM16_Output_Periph.ARR := HAL.UInt16'Mod (Value);

      end case;
   end Set_Autoreload;

   procedure Set_Counter_Direction
     (Timer       : Devices.Timers.Configurable_Direction;
      Counter_Dir : Non_Volatile.CR1_DIR.Field) is
   begin
      case Timer is
         when Devices.Timers.Advanced_1 =>
            STM32_SVD.TIM.TIM1_Output_Periph.CR1.DIR :=
              STM32_SVD.TIM.CR1_DIR_Field (Counter_Dir);

         when Devices.Timers.General_2  =>
            STM32_SVD.TIM.TIM2_Output_Periph.CR1.DIR :=
              STM32_SVD.TIM.CR1_DIR_Field (Counter_Dir);

         when Devices.Timers.General_3  =>
            STM32_SVD.TIM.TIM3_Output_Periph.CR1.DIR :=
              STM32_SVD.TIM.CR1_DIR_Field (Counter_Dir);
      end case;

   end Set_Counter_Direction;

   procedure Is_Counter_Mode_Change_Allowed
     (Timer                : Devices.Timers.Configurable_Direction;
      Desired_Counter_Mode : Non_Volatile.CR1_CMS.Field;
      Allowed              : out Boolean)
   is
      use type Non_Volatile.CR1_CMS.Field;
      Timers_Counter_Mode   : Non_Volatile.CR1_CMS.Field;
      Timer_Counter_Enabled : Boolean;
   begin
      case Timer is

         when STM32.Devices.Timers.Advanced_1 =>
            Timers_Counter_Mode :=
              Non_Volatile.CR1_CMS.Field
                (STM32_SVD.TIM.TIM1_Output_Periph.CR1.CMS);
            Timer_Counter_Enabled := STM32_SVD.TIM.TIM1_Output_Periph.CR1.CEN;

         when STM32.Devices.Timers.General_2  =>
            Timers_Counter_Mode :=
              Non_Volatile.CR1_CMS.Field
                (STM32_SVD.TIM.TIM2_Output_Periph.CR1.CMS);
            Timer_Counter_Enabled := STM32_SVD.TIM.TIM2_Output_Periph.CR1.CEN;

         when STM32.Devices.Timers.General_3  =>
            Timers_Counter_Mode :=
              Non_Volatile.CR1_CMS.Field
                (STM32_SVD.TIM.TIM3_Output_Periph.CR1.CMS);
            Timer_Counter_Enabled := STM32_SVD.TIM.TIM3_Output_Periph.CR1.CEN;

      end case;

      --  RM TIMx Control Register
      --  Switching from edge-aligned mode to center-aligned mode is not
      --  allowed when the Counter is Enabled (CEN=1).
      --* Assumption : Centre to Edge is also not allowed when CEN=1
      if Timer_Counter_Enabled then
         if Desired_Counter_Mode
            in Non_Volatile.CR1_CMS.Field
                 (STM32_SVD.TIM.Centre_Aligned_Up_Down)
             | Non_Volatile.CR1_CMS.Field (STM32_SVD.TIM.Centre_Aligned_Up)
             | Non_Volatile.CR1_CMS.Field (STM32_SVD.TIM.Centre_Aligned_Down)
         then
            if Timers_Counter_Mode
              = Non_Volatile.CR1_CMS.Field (STM32_SVD.TIM.Edge_Aligned)
            then
               Allowed := False;
               return;
            end if;
         end if;

         --  Assumption : Centre to Edge is also not allowed when CEN=1
         if Desired_Counter_Mode
           = Non_Volatile.CR1_CMS.Field (STM32_SVD.TIM.Edge_Aligned)
         then
            if Timers_Counter_Mode
              /= Non_Volatile.CR1_CMS.Field (STM32_SVD.TIM.Edge_Aligned)
            then
               Allowed := False;
               return;
            end if;
         end if;
      end if;

      Allowed := True;

   end Is_Counter_Mode_Change_Allowed;

   procedure Set_Counter_Mode
     (Timer        : Devices.Timers.Counter_Mode;
      Counter_Mode : Non_Volatile.CR1_CMS.Field)
   is
      Timer_Disabled              : Boolean := False;
      Timers_Enabled              : Boolean;
      Counter_Mode_Change_Allowed : Boolean;
   begin

      Enabled (Timer => Timer, Answer => Timers_Enabled);

      Is_Counter_Mode_Change_Allowed
        (Timer                => Timer,
         Desired_Counter_Mode => Counter_Mode,
         Allowed              => Counter_Mode_Change_Allowed);

      case Timer is
         when Devices.Timers.General_2  =>

            if not Counter_Mode_Change_Allowed then

               if Timers_Enabled then
                  Disable (Timer => Timer);
                  Timer_Disabled := True;
                  Alogs.Log
                    (Log_ID  => "Edm[7OI",
                     Message => Log_Msg.Temporarily_Disabled);
                  return;
               end if;
            end if;

            STM32_SVD.TIM.TIM2_Output_Periph.CR1.CMS :=
              STM32_SVD.TIM.CR1_CMS_Field (Counter_Mode);

         when Devices.Timers.General_3  =>
            if not Counter_Mode_Change_Allowed then

               if Timers_Enabled then
                  Disable (Timer => Timer);
                  Timer_Disabled := True;
                  Alogs.Log
                    (Log_ID  => "rBd-us!",
                     Message => Log_Msg.Temporarily_Disabled);
                  return;
               end if;
            end if;
            STM32_SVD.TIM.TIM3_Output_Periph.CR1.CMS :=
              STM32_SVD.TIM.CR1_CMS_Field (Counter_Mode);

         when Devices.Timers.Advanced_1 =>
            if not Counter_Mode_Change_Allowed then

               if Timers_Enabled then
                  Disable (Timer => Timer);
                  Timer_Disabled := True;
                  Alogs.Log
                    (Log_ID  => "SGd]nax",
                     Message => Log_Msg.Temporarily_Disabled);
                  return;
               end if;
            end if;
            STM32_SVD.TIM.TIM1_Output_Periph.CR1.CMS :=
              STM32_SVD.TIM.CR1_CMS_Field (Counter_Mode);
      end case;

      if Timer_Disabled then
         Enable (Timer => Timer);
      end if;

   end Set_Counter_Mode;

   procedure Set_Prescaler
     (Timer : STM32.Devices.Timers.Timer_T; Divide_By : Unsigned_16) is
   begin

      case Timer is
         when Devices.Timers.General_2  =>
            STM32_SVD.TIM.TIM2_Output_Periph.PSC := HAL.UInt16 (Divide_By);

         when Devices.Timers.General_3  =>
            STM32_SVD.TIM.TIM3_Output_Periph.PSC := HAL.UInt16 (Divide_By);

         when Devices.Timers.Basic_6    =>
            STM32_SVD.TIM.TIM6_Periph.PSC := HAL.UInt16 (Divide_By);

         when Devices.Timers.Basic_7    =>
            STM32_SVD.TIM.TIM7_Periph.PSC := HAL.UInt16 (Divide_By);

         when Devices.Timers.Advanced_1 =>
            STM32_SVD.TIM.TIM1_Output_Periph.PSC := HAL.UInt16 (Divide_By);

         when Devices.Timers.General_15 =>
            STM32_SVD.TIM.TIM15_Output_Periph.PSC := HAL.UInt16 (Divide_By);

         when Devices.Timers.General_16 =>
            STM32_SVD.TIM.TIM16_Output_Periph.PSC := HAL.UInt16 (Divide_By);
      end case;

      Generate_Update (Timer);

   end Set_Prescaler;

   procedure Generate_Update (Timer : STM32.Devices.Timers.Timer_T) is
   begin

      case Timer is
         when Devices.Timers.Advanced_1 =>
            STM32_SVD.TIM.TIM1_Output_Periph.EGR.UG := True;

         when Devices.Timers.General_2  =>
            STM32_SVD.TIM.TIM2_Output_Periph.EGR.UG := True;

         when Devices.Timers.General_3  =>
            STM32_SVD.TIM.TIM3_Output_Periph.EGR.UG := True;

         when Devices.Timers.Basic_6    =>
            STM32_SVD.TIM.TIM6_Periph.EGR.UG := True;

         when Devices.Timers.Basic_7    =>
            STM32_SVD.TIM.TIM7_Periph.EGR.UG := True;

         when Devices.Timers.General_15 =>
            STM32_SVD.TIM.TIM15_Output_Periph.EGR.UG := True;

         when Devices.Timers.General_16 =>
            STM32_SVD.TIM.TIM16_Output_Periph.EGR.UG := True;
      end case;

   end Generate_Update;

   procedure Enable_Update_Interrupt (Timer : STM32.Devices.Timers.Timer_T) is
   begin
      case Timer is
         when Devices.Timers.Advanced_1 =>
            STM32_SVD.TIM.TIM1_Output_Periph.DIER.UIE := True;

         when Devices.Timers.General_2  =>
            STM32_SVD.TIM.TIM2_Output_Periph.DIER.UIE := True;

         when Devices.Timers.General_3  =>
            STM32_SVD.TIM.TIM3_Output_Periph.DIER.UIE := True;

         when Devices.Timers.Basic_6    =>
            STM32_SVD.TIM.TIM6_Periph.DIER.UIE := True;

         when Devices.Timers.Basic_7    =>
            STM32_SVD.TIM.TIM7_Periph.DIER.UIE := True;

         when Devices.Timers.General_15 =>
            STM32_SVD.TIM.TIM15_Output_Periph.DIER.UIE := True;

         when Devices.Timers.General_16 =>
            STM32_SVD.TIM.TIM16_Output_Periph.DIER.UIE := True;
      end case;
   end Enable_Update_Interrupt;

   --
   --     ------------------------
   --     -- Set_Clock_Division --
   --     ------------------------
   --
   --     procedure Set_Clock_Division
   --       (This  : in out Timer;
   --        Value : Timer_Clock_Divisor)
   --     is
   --     begin
   --        This.CR1.Clock_Division := Value;
   --     end Set_Clock_Division;
   --
   --     ----------------------------
   --     -- Get_Clock_Division --
   --     ----------------------------
   --
   --     function Get_Clock_Division (This : Timer) return Timer_Clock_Divisor
   --   is
   --     begin
   --        return This.CR1.Clock_Division;
   --     end Get_Clock_Division;
   --
   --
   --     ------------------------
   --     -- No_Outputs_Enabled --
   --     ------------------------
   --
   --     function No_Outputs_Enabled (This : Timer) return Boolean is
   --     begin
   --        for C in Channel_1 .. Channel_3 loop
   --           if This.CCER (C).CCxE = Enable or This.CCER (C).CCxNE =
   --  Enable then
   --              return False;
   --           end if;
   --        end loop;
   --        --  Channel_4 doesn't have the complementary enabler and polarity
   --  bits.
   --        --  If it did they would be in the reserved area, which is zero,
   --  so we
   --        --  could be tricky and pretend that they exist for this function
   --  but
   --        --  doing that would be unnecessarily subtle.  The money is on
   --  clarity.
   --        if This.CCER (Channel_4).CCxE = Enable then
   --           return False;
   --        end if;
   --        return True;
   --     end No_Outputs_Enabled;
   --
   --     -------------
   --     -- Disable --
   --     -------------
   --
   --     procedure Disable (This : in out Timer) is
   --     begin
   --        if No_Outputs_Enabled (This) then
   --           This.CR1.Timer_Enabled := False;
   --        end if;
   --     end Disable;
   --
   --     ------------------------
   --     -- Enable_Main_Output --
   --     ------------------------
   --
   --     procedure Enable_Main_Output (This : in out Timer) is
   --     begin
   --        This.BDTR.Main_Output_Enabled := True;
   --     end Enable_Main_Output;
   --
   --     -------------------------
   --     -- Disable_Main_Output --
   --     -------------------------
   --
   --     procedure Disable_Main_Output (This : in out Timer) is
   --     begin
   --        if No_Outputs_Enabled (This) then
   --           This.BDTR.Main_Output_Enabled := False;
   --        end if;
   --     end Disable_Main_Output;
   --
   --     -------------------------
   --     -- Main_Output_Enabled --
   --     -------------------------
   --
   --     function Main_Output_Enabled (This : Timer) return Boolean is
   --     begin
   --        return This.BDTR.Main_Output_Enabled;
   --     end Main_Output_Enabled;
   --
   --
   --     ----------------------
   --     -- Enable_Interrupt --
   --     ----------------------
   --
   --     procedure Enable_Interrupt
   --       (This   : in out Timer;
   --        Source : Timer_Interrupt)
   --     is
   --     begin
   --        This.DIER := This.DIER or Source'Enum_Rep;
   --     end Enable_Interrupt;
   --
   --     ----------------------
   --     -- Enable_Interrupt --
   --     ----------------------
   --
   --     procedure Enable_Interrupt
   --       (This    : in out Timer;
   --        Sources : Timer_Interrupt_List)
   --     is
   --     begin
   --        for Source of Sources loop
   --           This.DIER := This.DIER or Source'Enum_Rep;
   --        end loop;
   --     end Enable_Interrupt;
   --
   --     -----------------------
   --     -- Disable_Interrupt --
   --     -----------------------
   --
   --     procedure Disable_Interrupt
   --       (This   : in out Timer;
   --        Source : Timer_Interrupt)
   --     is
   --     begin
   --        This.DIER := This.DIER and not Source'Enum_Rep;
   --     end Disable_Interrupt;
   --
   --     -----------------------------
   --     -- Clear_Pending_Interrupt --
   --     -----------------------------
   --
   --     procedure Clear_Pending_Interrupt
   --       (This   : in out Timer;
   --        Source : Timer_Interrupt)
   --     is
   --     begin
   --        This.SR := not Source'Enum_Rep;
   --  We do not, and must not, use the read-modify-write pattern because it
   --  leaves a window of vulnerability open to changes to the state after the
   --  read but before the write. The hardware for this register is designed so
   --  that writing other bits will not change them. This is indicated by the
   --  "rc_w0" notation in the status register definition. See the RM, page 57
   --  for that notation explanation.
   --     end Clear_Pending_Interrupt;
   --
   --     -----------------------
   --     -- Interrupt_Enabled --
   --     -----------------------
   --
   --     function Interrupt_Enabled
   --       (This   : Timer;
   --        Source : Timer_Interrupt)
   --        return Boolean
   --     is
   --     begin
   --        return (This.DIER and Source'Enum_Rep) = Source'Enum_Rep;
   --     end Interrupt_Enabled;
   --
   --     ------------
   --     -- Status --
   --     ------------
   --
   --     function Status (This : Timer;
   --  Flag : Timer_Status_Flag) return Boolean is
   --     begin
   --        return (This.SR and Flag'Enum_Rep) = Flag'Enum_Rep;
   --     end Status;
   --
   --     ------------------
   --     -- Clear_Status --
   --     ------------------
   --
   --     procedure Clear_Status (This : in out Timer;
   --  Flag : Timer_Status_Flag) is
   --     begin
   --        This.SR := not Flag'Enum_Rep;
   --  We do not, and must not, use the read-modify-write pattern because it
   --  leaves a window of vulnerability open to changes to the state after the
   --  read but before the write. The hardware for this register is designed so
   --  that writing other bits will not change them. This is indicated by the
   --  "rc_w0" notation in the status register definition. See the RM, page 57
   --  for that notation explanation.
   --     end Clear_Status;
   --
   --     -----------------------
   --     -- Enable_DMA_Source --
   --     -----------------------
   --
   --     procedure Enable_DMA_Source
   --       (This   : in out Timer;
   --        Source : Timer_DMA_Source)
   --     is
   --     begin
   --        This.DIER := This.DIER or Source'Enum_Rep;
   --     end Enable_DMA_Source;
   --
   --     ------------------------
   --     -- Disable_DMA_Source --
   --     ------------------------
   --
   --     procedure Disable_DMA_Source
   --       (This   : in out Timer;
   --        Source : Timer_DMA_Source)
   --     is
   --     begin
   --        This.DIER := This.DIER and not Source'Enum_Rep;
   --     end Disable_DMA_Source;
   --
   --     ------------------------
   --     -- DMA_Source_Enabled --
   --     ------------------------
   --
   --     function DMA_Source_Enabled
   --       (This   : Timer;
   --        Source : Timer_DMA_Source)
   --        return Boolean
   --     is
   --     begin
   --        return (This.DIER and Source'Enum_Rep) = Source'Enum_Rep;
   --     end DMA_Source_Enabled;
   --
   --     -------------------------
   --     -- Configure_Prescaler --
   --     -------------------------
   --
   --     procedure Configure_Prescaler
   --       (This        : in out Timer;
   --        Prescaler   : UInt16;
   --        Reload_Mode : Timer_Prescaler_Reload_Mode)
   --     is
   --     begin
   --        This.Prescaler := Prescaler;
   --        This.EGR := Reload_Mode'Enum_Rep;
   --     end Configure_Prescaler;
   --
   --     -------------------
   --     -- Configure_DMA --
   --     -------------------
   --
   --     procedure Configure_DMA
   --       (This         : in out Timer;
   --        Base_Address : Timer_DMA_Base_Address;
   --        Burst_Length : Timer_DMA_Burst_Length)
   --     is
   --     begin
   --        This.DCR.Base_Address := Base_Address;
   --        This.DCR.Burst_Length := Burst_Length;
   --     end Configure_DMA;
   --
   --     --------------------------------
   --     -- Enable_Capture_Compare_DMA --
   --     --------------------------------
   --
   --     procedure Enable_Capture_Compare_DMA
   --       (This : in out Timer)
   --  TODO: note that the CCDS field description in the RM, page 550, seems to
   --  indicate other than simply enabled/disabled
   --     is
   --     begin
   --        This.CR2.Capture_Compare_DMA_Selection := True;
   --     end Enable_Capture_Compare_DMA;
   --
   --     ---------------------------------
   --     -- Disable_Capture_Compare_DMA --
   --     ---------------------------------
   --
   --     procedure Disable_Capture_Compare_DMA
   --       (This : in out Timer)
   --  TODO: note that the CCDS field description in the RM, page 550, seems to
   --  indicate other than simply enabled/disabled
   --     is
   --     begin
   --        This.CR2.Capture_Compare_DMA_Selection := False;
   --     end Disable_Capture_Compare_DMA;
   --
   --     -----------------------
   --     -- Get_Prescaler --
   --     -----------------------
   --
   --     function Get_Prescaler (This : Timer) return UInt16 is
   --     begin
   --        return This.Prescaler;
   --     end Get_Prescaler;
   --
   --     -----------------------
   --     -- Set_UpdateDisable --
   --     -----------------------
   --
   --     procedure Set_UpdateDisable
   --       (This : in out Timer;
   --        To   : Boolean)
   --     is
   --     begin
   --        This.CR1.Update_Disable := To;
   --     end Set_UpdateDisable;
   --
   --     -----------------------
   --     -- Set_UpdateRequest --
   --     -----------------------
   --
   --     procedure Set_UpdateRequest
   --       (This   : in out Timer;
   --        Source : Timer_Update_Source)
   --     is
   --     begin
   --        This.CR1.Update_Request_Source := Source /= Global;
   --     end Set_UpdateRequest;
   --
   --     ---------------------------
   --     -- Select_One_Pulse_Mode --
   --     ---------------------------
   --
   --     procedure Select_One_Pulse_Mode
   --       (This : in out Timer;
   --        Mode : Timer_One_Pulse_Mode)
   --     is
   --     begin
   --        This.CR1.One_Pulse_Mode := Mode;
   --     end Select_One_Pulse_Mode;
   --
   --     ----------------------------
   --     -- Set_Autoreload_Preload --
   --     ----------------------------
   --
   --     procedure Set_Autoreload_Preload
   --       (This : in out Timer;
   --        To   : Boolean)
   --     is
   --     begin
   --        This.CR1.ARPE := To;
   --     end Set_Autoreload_Preload;
   --
   --     -----------------------
   --     -- Counter_Direction --
   --     -----------------------
   --
   --     function Get_Counter_Mode
   --       (This : Timer)
   --        return Timer_Counter_Alignment_Mode
   --     is
   --     begin
   --        if Basic_Timer (This) then
   --           return Up;
   --        else
   --           return This.CR1.Mode_And_Dir;
   --        end if;
   --     end Get_Counter_Mode;
   --
   --     --------------------
   --     -- Generate_Event --
   --     --------------------
   --
   --     procedure Generate_Event
   --       (This   : in out Timer;
   --        Source : Timer_Event_Source)
   --     is
   --        Temp_EGR : UInt32 := This.EGR;
   --     begin
   --        Temp_EGR := Temp_EGR or Source'Enum_Rep;
   --        This.EGR  := Temp_EGR;
   --     end Generate_Event;
   --
   --     ---------------------------
   --     -- Select_Output_Trigger --
   --     ---------------------------
   --
   --     procedure Select_Output_Trigger
   --       (This   : in out Timer;
   --        Source : Timer_Trigger_Output_Source)
   --     is
   --     begin
   --        This.CR2.Master_Mode_Selection := Source;
   --     end Select_Output_Trigger;
   --
   --     -----------------------
   --     -- Select_Slave_Mode --
   --     -----------------------
   --
   --     procedure Select_Slave_Mode
   --       (This : in out Timer;
   --        Mode : Timer_Slave_Mode)
   --     is
   --     begin
   --        case Mode
   --        when Reset_and_Trigger =>
   --           This.SMCR.Slave_Mode_Selection := Timer_Slave_Mode.Disabled;
   --           This.SMCR.Slave_Mode_selection_MSB := True;
   --
   --        when others =>
   --           This.SMCR.Slave_Mode_Selection := Mode;
   --           This.SMCR.Slave_Mode_selection_MSB := False
   --     end Select_Slave_Mode;
   --
   --     ------------------------------
   --     -- Enable_Master_Slave_Mode --
   --     ------------------------------
   --
   --     procedure Enable_Master_Slave_Mode (This : in out Timer) is
   --     begin
   --        This.SMCR.Master_Slave_Mode := True;
   --     end Enable_Master_Slave_Mode;
   --
   --     -------------------------------
   --     -- Disable_Master_Slave_Mode --
   --     -------------------------------
   --
   --     procedure Disable_Master_Slave_Mode (This : in out Timer) is
   --     begin
   --        This.SMCR.Master_Slave_Mode := False;
   --     end Disable_Master_Slave_Mode;
   --
   --     --------------------------------
   --     -- Configure_External_Trigger --
   --     --------------------------------
   --
   --     procedure Configure_External_Trigger
   --       (This      : in out Timer;
   --        Polarity  : Timer_External_Trigger_Polarity;
   --        Prescaler : Timer_External_Trigger_Prescaler;
   --        Filter    : Timer_External_Trigger_Filter)
   --     is
   --     begin
   --        This.SMCR.External_Trigger_Polarity := Polarity;
   --        This.SMCR.External_Trigger_Prescaler := Prescaler;
   --        This.SMCR.External_Trigger_Filter := Filter;
   --     end Configure_External_Trigger;
   --
   --     ---------------------------------
   --     -- Configure_As_External_Clock --
   --     ---------------------------------
   --
   --     procedure Configure_As_External_Clock
   --       (This   : in out Timer;
   --        Source : Timer_Internal_Trigger_Source)
   --     is
   --     begin
   --        Select_Input_Trigger (This, Source);
   --        Select_Slave_Mode (This, External_1);
   --     end Configure_As_External_Clock;
   --
   --     ---------------------------------
   --     -- Configure_As_External_Clock --
   --     ---------------------------------
   --
   --     procedure Configure_As_External_Clock
   --       (This     : in out Timer;
   --        Source   : Timer_External_Clock_Source;
   --        Polarity : Timer_Input_Capture_Polarity;
   --        Filter   : Timer_Input_Capture_Filter)
   --     is
   --     begin
   --        if Source = Filtered_Timer_Input_2 then
   --           Configure_Channel_Input
   --             (This,
   --              Channel_2,
   --              Polarity,
   --              Direct_TI,
   --              Div1,       --  default prescalar zero value
   --              Filter);
   --        else
   --           Configure_Channel_Input
   --             (This,
   --              Channel_1,
   --              Polarity,
   --              Direct_TI,
   --              Div1,       --  default prescalar zero value
   --              Filter);
   --        end if;
   --        Select_Input_Trigger (This, Source);
   --        Select_Slave_Mode (This, External_1);
   --     end Configure_As_External_Clock;
   --
   --     ------------------------------------
   --     -- Configure_External_Clock_Mode1 --
   --     ------------------------------------
   --
   --     procedure Configure_External_Clock_Mode1
   --       (This      : in out Timer;
   --        Polarity  : Timer_External_Trigger_Polarity;
   --        Prescaler : Timer_External_Trigger_Prescaler;
   --        Filter    : Timer_External_Trigger_Filter)
   --     is
   --     begin
   --        Configure_External_Trigger (This, Polarity, Prescaler, Filter);
   --        Select_Slave_Mode (This, External_1);
   --        Select_Input_Trigger (This, External_Trigger_Input);
   --     end Configure_External_Clock_Mode1;
   --
   --     ------------------------------------
   --     -- Configure_External_Clock_Mode2 --
   --     ------------------------------------
   --
   --     procedure Configure_External_Clock_Mode2
   --       (This      : in out Timer;
   --        Polarity  : Timer_External_Trigger_Polarity;
   --        Prescaler : Timer_External_Trigger_Prescaler;
   --        Filter    : Timer_External_Trigger_Filter)
   --     is
   --     begin
   --        Configure_External_Trigger (This, Polarity, Prescaler, Filter);
   --        This.SMCR.External_Clock_Enable := True;
   --     end Configure_External_Clock_Mode2;
   --
   --     --------------------------
   --     -- Select_Input_Trigger --
   --     --------------------------
   --
   --     procedure Select_Input_Trigger
   --       (This   : in out Timer;
   --        Source : Timer_Trigger_Input_Source)
   --     is
   --     begin
   --        This.SMCR.Trigger_Selection := Source;
   --     end Select_Input_Trigger;
   --
   --     ------------------------------
   --     -- Configure_Channel_Output --
   --     ------------------------------
   --
   --     procedure Configure_Channel_Output
   --       (This     : in out Timer;
   --        Channel  : Timer_Channel;
   --        Mode     : Timer_Output_Compare_And_PWM_Mode;
   --        State    : Timer_Capture_Compare_State;
   --        Pulse    : UInt32;
   --        Polarity : Timer_Output_Compare_Polarity)
   --     is
   --     begin
   --        --  first disable the channel
   --        This.CCER (Channel).CCxE := Disable;
   --
   --        Set_Output_Compare_Mode (This, Channel, Mode);
   --
   --        This.CCER (Channel).CCxE := State;
   --        This.CCER (Channel).CCxP := Polarity'Enum_Rep;
   --
   --        This.CCR1_4 (Channel) := Pulse;
   --  Only timers 2 and 5 have 32-bit CCR registers. The others must maintain
   --  the upper half at zero. We use a precondition to ensure values greater
   --  than a half-word are only specified for the proper timers.
   --     end Configure_Channel_Output;
   --
   --     ------------------------------
   --     -- Configure_Channel_Output --
   --     ------------------------------
   --
   --     procedure Configure_Channel_Output
   --       (This                     : in out Timer;
   --        Channel                  : Timer_Channel;
   --        Mode                     : Timer_Output_Compare_And_PWM_Mode;
   --        State                    : Timer_Capture_Compare_State;
   --        Pulse                    : UInt32;
   --        Polarity                 : Timer_Output_Compare_Polarity;
   --        Idle_State               : Timer_Capture_Compare_State;
   --        Complementary_Polarity   : Timer_Output_Compare_Polarity;
   --        Complementary_Idle_State : Timer_Capture_Compare_State)
   --     is
   --     begin
   --        --  first disable the channel
   --        This.CCER (Channel).CCxE := Disable;
   --
   --        Set_Output_Compare_Mode (This, Channel, Mode);
   --
   --        This.CCER (Channel).CCxE := State;
   --        This.CCER (Channel).CCxNP := Complementary_Polarity'Enum_Rep;
   --        This.CCER (Channel).CCxP := Polarity'Enum_Rep;
   --
   --        case Channel is
   --           when Channel_1 =>
   --              This.CR2.Channel_1_Output_Idle_State := Idle_State;
   --              This.CR2.Channel_1_Complementary_Output_Idle_State :=
   --                Complementary_Idle_State;
   --           when Channel_2 =>
   --              This.CR2.Channel_2_Output_Idle_State := Idle_State;
   --              This.CR2.Channel_2_Complementary_Output_Idle_State :=
   --                Complementary_Idle_State;
   --           when Channel_3 =>
   --              This.CR2.Channel_3_Output_Idle_State := Idle_State;
   --              This.CR2.Channel_3_Complementary_Output_Idle_State :=
   --                Complementary_Idle_State;
   --           when Channel_4 =>
   --              This.CR2.Channel_4_Output_Idle_State := Idle_State;
   --        end case;
   --
   --        This.CCR1_4 (Channel) := Pulse;
   --  Only timers 2 and 5 have 32-bit CCR registers. The others must maintain
   --  the upper half at zero. We use a precondition to ensure values greater
   --  than a half-word are only specified for the proper timers.
   --     end Configure_Channel_Output;
   --
   --     -----------------------
   --     -- Set_Single_Output --
   --     -----------------------
   --
   --     procedure Set_Single_Output
   --       (This             : in out Timer;
   --        Channel          : Timer_Channel;
   --        Mode             : Timer_Output_Compare_And_PWM_Mode;
   --        OC_Clear_Enabled : Boolean;
   --        Preload_Enabled  : Boolean;
   --        Fast_Enabled     : Boolean)
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --        Description      : Channel_Output_Descriptor;
   --     begin
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --
   --        Description := (OCxMode  => Mode,
   --                        OCxFast_Enable => Fast_Enabled,
   --                        OCxPreload_Enable => Preload_Enabled,
   --                        OCxClear_Enable => OC_Clear_Enabled);
   --
   --        Temp.Descriptors (Descriptor_Index) := (Output, Description);
   --
   --        This.CCMR1_2 (CCMR_Index) := Temp;
   --     end Set_Single_Output;
   --
   --     -----------------------------
   --     -- Set_Output_Compare_Mode --
   --     -----------------------------
   --
   --     procedure Set_Output_Compare_Mode
   --       (This    : in out Timer;
   --        Channel : Timer_Channel;
   --        Mode    : Timer_Output_Compare_And_PWM_Mode)
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --     begin
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --
   --        if Temp.Descriptors (Descriptor_Index).CCxSelection /= Output then
   --           raise Timer_Channel_Access_Error;
   --        end if;
   --
   --        Temp.Descriptors (Descriptor_Index).Compare.OCxMode := Mode;
   --        This.CCMR1_2 (CCMR_Index) := Temp;
   --     end Set_Output_Compare_Mode;
   --
   --     ----------------------------------
   --     -- Get_Capture_Compare_Mode --
   --     ----------------------------------
   --
   --     function Get_Capture_Compare_Mode
   --       (This    : Timer;
   --        Channel : Timer_Channel)
   --        return Timer_Capture_Compare_Modes
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --     begin
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --
   --        return Temp.Descriptors (Descriptor_Index).CCxSelection;
   --     end Get_Capture_Compare_Mode;
   --
   --     ------------------------------
   --     -- Set_Output_Forced_Action --
   --     ------------------------------
   --
   --     procedure Set_Output_Forced_Action
   --       (This    : in out Timer;
   --        Channel : Timer_Channel;
   --        Active  : Boolean)
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --     begin
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --
   --        if Temp.Descriptors (Descriptor_Index).CCxSelection /= Output then
   --           raise Timer_Channel_Access_Error;
   --        end if;
   --
   --        if Active then
   --           Temp.Descriptors (Descriptor_Index).Compare.OCxMode
   --  := Force_Active;
   --        else
   --           Temp.Descriptors (Descriptor_Index).Compare.OCxMode
   --  := Force_Inactive;
   --        end if;
   --
   --        This.CCMR1_2 (CCMR_Index) := Temp;
   --     end Set_Output_Forced_Action;
   --
   --     -------------------------------
   --     -- Set_Output_Preload_Enable --
   --     -------------------------------
   --
   --     procedure Set_Output_Preload_Enable
   --       (This    : in out Timer;
   --        Channel : Timer_Channel;
   --        Enabled : Boolean)
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --     begin
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --
   --        Temp.Descriptors (Descriptor_Index).Compare.OCxPreload_Enable
   --  := Enabled;
   --        This.CCMR1_2 (CCMR_Index) := Temp;
   --     end Set_Output_Preload_Enable;
   --
   --     ----------------------------
   --     -- Set_Output_Fast_Enable --
   --     ----------------------------
   --
   --     procedure Set_Output_Fast_Enable
   --       (This    : in out Timer;
   --        Channel : Timer_Channel;
   --        Enabled : Boolean)
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --     begin
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --
   --        Temp.Descriptors (Descriptor_Index).Compare.OCxFast_Enable
   --  := Enabled;
   --        This.CCMR1_2 (CCMR_Index) := Temp;
   --     end Set_Output_Fast_Enable;
   --
   --     -----------------------
   --     -- Set_Clear_Control --
   --     -----------------------
   --
   --     procedure Set_Clear_Control
   --       (This    : in out Timer;
   --        Channel : Timer_Channel;
   --        Enabled : Boolean)
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --     begin
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --
   --        Temp.Descriptors (Descriptor_Index).Compare.OCxClear_Enable
   --  := Enabled;
   --        This.CCMR1_2 (CCMR_Index) := Temp;
   --     end Set_Clear_Control;
   --
   --     --------------------
   --     -- Enable_Channel --
   --     --------------------
   --
   --     procedure Enable_Channel
   --       (This    : in out Timer;
   --        Channel : Timer_Channel)
   --     is
   --        Temp_EGR  : UInt32 := This.EGR;
   --     begin
   --        This.CCER (Channel).CCxE := Enable;
   --
   --        --  Trigger an event to initialize preload register
   --        Temp_EGR := Temp_EGR or (2 ** (Timer_Channel'Pos (Channel) + 1));
   --
   --        This.EGR  := Temp_EGR;
   --     end Enable_Channel;
   --
   --     -------------------------
   --     -- Set_Output_Polarity --
   --     -------------------------
   --
   --     procedure Set_Output_Polarity
   --       (This     : in out Timer;
   --        Channel  : Timer_Channel;
   --        Polarity : Timer_Output_Compare_Polarity)
   --     is
   --     begin
   --        This.CCER (Channel).CCxP := Polarity'Enum_Rep;
   --     end Set_Output_Polarity;
   --
   --     ---------------------------------------
   --     -- Set_Output_Complementary_Polarity --
   --     ---------------------------------------
   --
   --     procedure Set_Output_Complementary_Polarity
   --       (This     : in out Timer;
   --        Channel  : Timer_Channel;
   --        Polarity : Timer_Output_Compare_Polarity)
   --     is
   --     begin
   --        This.CCER (Channel).CCxNP := Polarity'Enum_Rep;
   --     end Set_Output_Complementary_Polarity;
   --
   --     ---------------------
   --     -- Disable_Channel --
   --     ---------------------
   --
   --     procedure Disable_Channel
   --       (This    : in out Timer;
   --        Channel : Timer_Channel)
   --     is
   --     begin
   --        This.CCER (Channel).CCxE := Disable;
   --     end Disable_Channel;
   --
   --     ---------------------
   --     -- Channel_Enabled --
   --     ---------------------
   --
   --     function Channel_Enabled
   --       (This    : Timer;
   --        Channel : Timer_Channel)
   --        return Boolean
   --     is
   --     begin
   --        return This.CCER (Channel).CCxE = Enable;
   --     end Channel_Enabled;
   --
   --     ----------------------------------
   --     -- Enable_Complementary_Channel --
   --     ----------------------------------
   --
   --     procedure Enable_Complementary_Channel
   --       (This    : in out Timer;
   --        Channel : Timer_Channel)
   --     is
   --     begin
   --        This.CCER (Channel).CCxNE := Enable;
   --     end Enable_Complementary_Channel;
   --
   --     -----------------------------------
   --     -- Disable_Complementary_Channel --
   --     -----------------------------------
   --
   --     procedure Disable_Complementary_Channel
   --       (This    : in out Timer;
   --        Channel : Timer_Channel)
   --     is
   --     begin
   --        This.CCER (Channel).CCxNE := Disable;
   --     end Disable_Complementary_Channel;
   --
   --     -----------------------------------
   --     -- Complementary_Channel_Enabled --
   --     -----------------------------------
   --
   --     function Complementary_Channel_Enabled
   --       (This : Timer;  Channel : Timer_Channel)
   --        return Boolean
   --     is
   --     begin
   --        return This.CCER (Channel).CCxNE = Enable;
   --     end Complementary_Channel_Enabled;
   --
   --     -----------------------
   --     -- Set_Compare_Value --
   --     -----------------------
   --
   --     procedure Set_Compare_Value
   --       (This       : in out Timer;
   --        Channel    : Timer_Channel;
   --        Word_Value : UInt32)
   --     is
   --     begin
   --        This.CCR1_4 (Channel) := Word_Value;
   --        --  Timers 2 and 5 really do have 32-bit capture/compare registers
   --  so we
   --        --  don't need to require half-words as inputs.
   --     end Set_Compare_Value;
   --
   --     -----------------------
   --     -- Set_Compare_Value --
   --     -----------------------
   --
   --     procedure Set_Compare_Value
   --       (This    : in out Timer;
   --        Channel : Timer_Channel;
   --        Value   : UInt16)
   --     is
   --     begin
   --        This.CCR1_4 (Channel) := UInt32 (Value);
   --        --  These capture/compare registers are really only 15-bits wide,
   --  except
   --        --  for those of timers 2 and 5. For the sake of simplicity we
   --  represent
   --        --  all of them with full words, but only write word values when
   --        --  appropriate. The caller has to treat them as half-word values,
   --  since
   --        --  that's the type for the formal parameter, therefore our
   --  casting up to
   --        --  a word value will retain the reserved upper half-word value
   --  of zero.
   --     end Set_Compare_Value;
   --
   --     ---------------------------
   --     -- Get_Capture_Value --
   --     ---------------------------
   --
   --     function Get_Capture_Value
   --       (This    : Timer;
   --        Channel : Timer_Channel)
   --        return UInt32
   --     is
   --     begin
   --        return This.CCR1_4 (Channel);
   --     end Get_Capture_Value;
   --
   --     ---------------------------
   --     -- Get_Capture_Value --
   --     ---------------------------
   --
   --     function Get_Capture_Value
   --       (This    : Timer;
   --        Channel : Timer_Channel)
   --        return UInt16
   --     is
   --     begin
   --        return UInt16 (This.CCR1_4 (Channel));
   --     end Get_Capture_Value;
   --
   --     -------------------------------------
   --     -- Write_Channel_Input_Description --
   --     -------------------------------------
   --
   --     procedure Write_Channel_Input_Description
   --       (This        : in out Timer;
   --        Channel     : Timer_Channel;
   --        Kind        : Timer_Input_Capture_Selection;
   --        Description : Channel_Input_Descriptor)
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --        New_Value        : IO_Descriptor;
   --     begin
   --        case Kind is
   --           when Direct_TI =>
   --              New_Value := (CCxSelection => Direct_TI,
   --  Capture => Description);
   --           when Indirect_TI =>
   --              New_Value := (CCxSelection => Indirect_TI,
   --  Capture => Description);
   --           when TRC =>
   --              New_Value := (CCxSelection => TRC, Capture => Description);
   --        end case;
   --
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --        Temp.Descriptors (Descriptor_Index) := New_Value;
   --        This.CCMR1_2 (CCMR_Index) := Temp;
   --     end Write_Channel_Input_Description;
   --
   --     -------------------------
   --     -- Set_Input_Prescaler --
   --     -------------------------
   --
   --     procedure Set_Input_Prescaler
   --       (This    : in out Timer;
   --        Channel : Timer_Channel;
   --        Value   : Timer_Input_Capture_Prescaler)
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --     begin
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --
   --        Temp.Descriptors (Descriptor_Index).Capture.ICxPrescaler := Value;
   --        This.CCMR1_2 (CCMR_Index) := Temp;
   --     end Set_Input_Prescaler;
   --
   --     -----------------------------
   --     -- Get_Input_Prescaler --
   --     -----------------------------
   --
   --     function Get_Input_Prescaler
   --       (This    : Timer;
   --        Channel : Timer_Channel)
   --        return Timer_Input_Capture_Prescaler
   --     is
   --        CCMR_Index       : CCMRx_Index;
   --        Descriptor_Index : Lower_Half_Index;
   --        Temp             : TIMx_CCMRx;
   --     begin
   --        case Channel is
   --           when Channel_1 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 1;
   --           when Channel_2 =>
   --              CCMR_Index := 1;
   --              Descriptor_Index := 2;
   --           when Channel_3 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 1;
   --           when Channel_4 =>
   --              CCMR_Index := 2;
   --              Descriptor_Index := 2;
   --        end case;
   --        Temp := This.CCMR1_2 (CCMR_Index);  -- effectively get CCMR1
   --  or CCMR2
   --
   --        return Temp.Descriptors (Descriptor_Index).Capture.ICxPrescaler;
   --     end Get_Input_Prescaler;
   --
   --     -----------------------------
   --     -- Configure_Channel_Input --
   --     -----------------------------
   --
   --     procedure Configure_Channel_Input
   --       (This      : in out Timer;
   --        Channel   : Timer_Channel;
   --        Polarity  : Timer_Input_Capture_Polarity;
   --        Selection : Timer_Input_Capture_Selection;
   --        Prescaler : Timer_Input_Capture_Prescaler;
   --        Filter    : Timer_Input_Capture_Filter)
   --     is
   --        Input     : Channel_Input_Descriptor;
   --     begin
   --        --  first disable the channel
   --        This.CCER (Channel).CCxE := Disable;
   --
   --        Input := (ICxFilter => Filter, ICxPrescaler => Prescaler);
   --        Write_Channel_Input_Description
   --          (This          => This,
   --           Channel     => Channel,
   --           Kind        => Selection,
   --           Description => Input);
   --
   --        case Polarity is
   --           when Rising =>
   --              This.CCER (Channel).CCxNP := 0;
   --              This.CCER (Channel).CCxP := 0;
   --           when Falling =>
   --              This.CCER (Channel).CCxNP := 0;
   --              This.CCER (Channel).CCxP := 1;
   --           when Both_Edges =>
   --              This.CCER (Channel).CCxNP := 1;
   --              This.CCER (Channel).CCxP := 1;
   --        end case;
   --
   --        This.CCER (Channel).CCxE := Enable;
   --     end Configure_Channel_Input;
   --
   --     ---------------------------------
   --     -- Configure_Channel_Input_PWM --
   --     ---------------------------------
   --
   --     procedure Configure_Channel_Input_PWM
   --       (This      : in out Timer;
   --        Channel   : Timer_Channel;
   --        Selection : Timer_Input_Capture_Selection;
   --        Polarity  : Timer_Input_Capture_Polarity;
   --        Prescaler : Timer_Input_Capture_Prescaler;
   --        Filter    : Timer_Input_Capture_Filter)
   --     is
   --        Opposite_Polarity  : Timer_Input_Capture_Polarity;
   --        Opposite_Selection : Timer_Input_Capture_Selection;
   --     begin
   --        Disable_Channel (This, Channel);
   --
   --        if Polarity = Rising then
   --           Opposite_Polarity := Falling;
   --        else
   --           Opposite_Polarity := Rising;
   --        end if;
   --
   --        if Selection = Indirect_TI then
   --           Opposite_Selection := Direct_TI;
   --        else
   --           Opposite_Selection := Indirect_TI;
   --        end if;
   --
   --        if Channel = Channel_1 then
   --           Configure_Channel_Input
   --             (This, Channel_1, Polarity, Selection, Prescaler, Filter);
   --
   --           Configure_Channel_Input (This,
   --                                    Channel_2,
   --                                    Opposite_Polarity,
   --                                    Opposite_Selection,
   --                                    Prescaler,
   --                                    Filter);
   --        else
   --           Configure_Channel_Input
   --             (This, Channel_2, Polarity, Selection, Prescaler, Filter);
   --
   --           Configure_Channel_Input (This,
   --                                    Channel_1,
   --                                    Opposite_Polarity,
   --                                    Opposite_Selection,
   --                                    Prescaler,
   --                                    Filter);
   --        end if;
   --
   --        Enable_Channel (This, Channel);
   --     end Configure_Channel_Input_PWM;
   --
   --     -------------------------------
   --     -- Enable_CC_Preload_Control --
   --     -------------------------------
   --
   --     procedure Enable_CC_Preload_Control (This : in out Timer) is
   --     begin
   --        This.CR2.Capture_Compare_Preloaded_Control := True;
   --     end Enable_CC_Preload_Control;
   --
   --     --------------------------------
   --     -- Disable_CC_Preload_Control --
   --     --------------------------------
   --
   --     procedure Disable_CC_Preload_Control (This : in out Timer) is
   --     begin
   --        This.CR2.Capture_Compare_Preloaded_Control := False;
   --     end Disable_CC_Preload_Control;
   --
   --     ------------------------
   --     -- Select_Commutation --
   --     ------------------------
   --
   --     procedure Select_Commutation (This : in out Timer) is
   --     begin
   --        This.CR2.Capture_Compare_Control_Update_Selection := True;
   --     end Select_Commutation;
   --
   --     --------------------------
   --     -- Deselect_Commutation --
   --     --------------------------
   --
   --     procedure Deselect_Commutation (This : in out Timer) is
   --     begin
   --        This.CR2.Capture_Compare_Control_Update_Selection := False;
   --     end Deselect_Commutation;
   --
   --     --------------------
   --     -- Configure_BDTR --
   --     --------------------
   --
   --     procedure Configure_BDTR
   --       (This                          : in out Timer;
   --        Automatic_Output_Enabled      : Boolean;
   --        Break_Polarity                : Timer_Break_Polarity;
   --        Break_Enabled                 : Boolean;
   --        Off_State_Selection_Run_Mode  : Bit;
   --        Off_State_Selection_Idle_Mode : Bit;
   --        Lock_Configuration            : Timer_Lock_Level;
   --        Deadtime_Generator            : UInt8)
   --     is
   --     begin
   --        This.BDTR.Automatic_Output_Enabled
   --  := Automatic_Output_Enabled;
   --        This.BDTR.Break_Polarity                := Break_Polarity;
   --        This.BDTR.Break_Enable                  := Break_Enabled;
   --        This.BDTR.Off_State_Selection_Run_Mode
   --  := Off_State_Selection_Run_Mode;
   --        This.BDTR.Off_State_Selection_Idle_Mode
   --  := Off_State_Selection_Idle_Mode;
   --        This.BDTR.Lock                          := Lock_Configuration;
   --        This.BDTR.Deadtime_Generator            := Deadtime_Generator;
   --     end Configure_BDTR;
   --
   --     ---------------------------------
   --     -- Configure_Timer_2_Remapping --
   --     ---------------------------------
   --
   --     procedure Configure_Timer_2_Remapping
   --       (This   : in out Timer;
   --        Option : Timer_2_Remapping_Options)
   --     is
   --     begin
   --        case Option is
   --           when TIM2_ITR_TIM8_TRGO | TIM2_ITR_USBFS_SOF =>
   --              This.Options.ITR1_RMP := Option;
   --           when TIM2_ETR_GPIO | TIM2_ETR_LSE  =>
   --              This.Options.ETR_RMP := Option;
   --           when Both_Edges =>
   --              This.CCER (Channel_1).CCxNP := 1;
   --              This.CCER (Channel_1).CCxP := 1;
   --        end case;
   --        This.Options.ITR1_RMP := Option;
   --     end Configure_Timer_2_Remapping;
   --
   --     ---------------------------------
   --     -- Configure_Timer_3_Remapping --
   --     ---------------------------------
   --
   --     procedure Configure_Timer_3_Remapping
   --       (This   : in out Timer;
   --        Option : Timer_3_Remapping_Options)
   --     is
   --     begin
   --        This.Options.TI2_RMP := Option;
   --     end Configure_Timer_3_Remapping;
   --
   --     ----------------------------------
   --     -- Configure_Timer_11_Remapping --
   --     ----------------------------------
   --
   --     procedure Configure_Timer_11_Remapping
   --       (This   : in out Timer;
   --        Option : Timer_11_Remapping_Options)
   --     is
   --     begin
   --        This.Options.TI1_RMP := Option;
   --     end Configure_Timer_11_Remapping;
   --
   --     ---------------------------------
   --     -- Configure_Encoder_Interface --
   --     ---------------------------------
   --
   --     procedure Configure_Encoder_Interface
   --       (This         : in out Timer;
   --        Mode         : Timer_Encoder_Mode;
   --        IC1_Polarity : Timer_Input_Capture_Polarity;
   --        IC2_Polarity : Timer_Input_Capture_Polarity)
   --     is
   --     begin
   --        This.SMCR.Slave_Mode_Selection := Mode;
   --
   --        Write_Channel_Input_Description
   --          (This,
   --           Channel     => Channel_1,
   --           Kind        => Direct_TI,
   --           Description => Channel_Input_Descriptor'(ICxFilter => 0,
   --                                                  ICxPrescaler => Div1));
   --
   --        Write_Channel_Input_Description
   --          (This,
   --           Channel     => Channel_2,
   --           Kind        => Direct_TI,
   --           Description => Channel_Input_Descriptor'(ICxFilter => 0,
   --                                                  ICxPrescaler => Div1));
   --
   --        case IC1_Polarity is
   --           when Rising =>
   --              This.CCER (Channel_1).CCxNP := 0;
   --              This.CCER (Channel_1).CCxP := 0;
   --           when Falling =>
   --              This.CCER (Channel_1).CCxNP := 0;
   --              This.CCER (Channel_1).CCxP := 1;
   --           when Both_Edges =>
   --              This.CCER (Channel_1).CCxNP := 1;
   --              This.CCER (Channel_1).CCxP := 1;
   --        end case;
   --
   --        case IC2_Polarity is
   --           when Rising =>
   --              This.CCER (Channel_2).CCxNP := 0;
   --              This.CCER (Channel_2).CCxP := 0;
   --           when Falling =>
   --              This.CCER (Channel_2).CCxNP := 0;
   --              This.CCER (Channel_2).CCxP := 1;
   --           when Both_Edges =>
   --              This.CCER (Channel_2).CCxNP := 1;
   --              This.CCER (Channel_2).CCxP := 1;
   --        end case;
   --     end Configure_Encoder_Interface;
   --
   --     ------------------------
   --     -- Enable_Hall_Sensor --
   --     ------------------------
   --
   --     procedure Enable_Hall_Sensor
   --       (This : in out Timer)
   --     is
   --     begin
   --        This.CR2.TI1_Selection := True;
   --     end Enable_Hall_Sensor;
   --
   --     -------------------------
   --     -- Disable_Hall_Sensor --
   --     -------------------------
   --
   --     procedure Disable_Hall_Sensor
   --       (This : in out Timer)
   --     is
   --     begin
   --        This.CR2.TI1_Selection := False;
   --     end Disable_Hall_Sensor;
   --

end STM32.Timers.Run;
