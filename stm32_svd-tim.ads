pragma Style_Checks (Off);

--  This spec has been automatically generated from STM32U073.svd

pragma Restrictions (No_Elaboration_Code);

with HAL;
with System;

package STM32_SVD.TIM is

   ---------------
   -- Registers --
   ---------------

   --  Direction Note: This bit is read only when the timer is configured in
   --  Center-aligned mode or Encoder mode.
   type CR1_DIR_Field is
     (--  Up counter
      Up,
      --  Down Counter
      Down)
     with Size => 1;
   for CR1_DIR_Field use
     (Up => 0,
      Down => 1);

   --  Center-aligned mode selection Note: Switch from edge-aligned mode to
   --  center-aligned mode as long as the counter is enabled (CEN=1) is not
   --  allowed
   type CR1_CMS_Field is
     (--  Edge-aligned mode. The counter counts up or down depending on the direction
--  bit (DIR).
      Edge_Aligned,
      --  Center-aligned mode 1. The counter counts up and down alternatively. Output
--  compare interrupt flags of channels configured in output (CCxS=00 in
--  TIMx_CCMRx register) are set only when the counter is counting down.
      Centre_Aligned_Down,
      --  Center-aligned mode 2. The counter counts up and down alternatively. Output
--  compare interrupt flags of channels configured in output (CCxS=00 in
--  TIMx_CCMRx register) are set only when the counter is counting up.
      Centre_Aligned_Up,
      --  Center-aligned mode 3. The counter counts up and down alternatively. Output
--  compare interrupt flags of channels configured in output (CCxS=00 in
--  TIMx_CCMRx register) are set both when the counter is counting up or down.
      Centre_Aligned_Up_Down)
     with Size => 2;
   for CR1_CMS_Field use
     (Edge_Aligned => 0,
      Centre_Aligned_Down => 1,
      Centre_Aligned_Up => 2,
      Centre_Aligned_Up_Down => 3);

   --  Clock division This bit-field indicates the division ratio between the
   --  timer clock (CK_INT) frequency and the dead-time and sampling clock
   --  (tDTS)used by the dead-time generators and the digital filters (ETR,
   --  TIx): Note: tDTS = 1/fDTS, tCK_INT = 1/fCK_INT.
   type CR1_CKD_Field is
     (--  tdts=tck_int
      Div_1,
      --  tdts=2*tck_int
      Div_2,
      --  tdts=4*tck_int
      Div_4)
     with Size => 2;
   for CR1_CKD_Field use
     (Div_1 => 0,
      Div_2 => 1,
      Div_4 => 2);

   --  TIM1 control register 1
   type CR1_Register is record
      --  Counter enable Note: External clock, gated mode and encoder mode can
      --  work only if the CEN bit has been previously set by software. However
      --  trigger mode can set the CEN bit automatically by hardware.
      CEN            : Boolean := False;
      --  Update disable This bit is set and cleared by software to
      --  enable/disable UEV event generation. Counter overflow/underflow
      --  Setting the UG bit Update generation through the slave mode
      --  controller Buffered registers are then loaded with their preload
      --  values.
      UDIS           : Boolean := False;
      --  Update request source This bit is set and cleared by software to
      --  select the UEV event sources. Counter overflow/underflow Setting the
      --  UG bit Update generation through the slave mode controller
      URS            : Boolean := False;
      --  One pulse mode
      OPM            : Boolean := False;
      --  Direction Note: This bit is read only when the timer is configured in
      --  Center-aligned mode or Encoder mode.
      DIR            : CR1_DIR_Field := STM32_SVD.TIM.Up;
      --  Center-aligned mode selection Note: Switch from edge-aligned mode to
      --  center-aligned mode as long as the counter is enabled (CEN=1) is not
      --  allowed
      CMS            : CR1_CMS_Field := STM32_SVD.TIM.Edge_Aligned;
      --  Auto-reload preload enable
      ARPE           : Boolean := False;
      --  Clock division This bit-field indicates the division ratio between
      --  the timer clock (CK_INT) frequency and the dead-time and sampling
      --  clock (tDTS)used by the dead-time generators and the digital filters
      --  (ETR, TIx): Note: tDTS = 1/fDTS, tCK_INT = 1/fCK_INT.
      CKD            : CR1_CKD_Field := STM32_SVD.TIM.Div_1;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      --  UIF status bit remapping
      UIFREMAP       : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CR1_Register use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      DIR            at 0 range 4 .. 4;
      CMS            at 0 range 5 .. 6;
      ARPE           at 0 range 7 .. 7;
      CKD            at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   --  Master mode selection These bits allow selected information to be sent
   --  in master mode to slave timers for synchronization (TRGO). The
   --  combination is as follows: Note: The clock of the slave timer or ADC
   --  must be enabled prior to receive events from the master timer, and must
   --  not be changed on-the-fly while triggers are received from the master
   --  timer.
   type CR2_MMS_Field is
     (--  Reset - the UG bit from the TIMx_EGR register is used as trigger output
--  (TRGO). If the reset is generated by the trigger input (slave mode
--  controller configured in reset mode) then the signal on TRGO is delayed
--  compared to the actual reset.
      Reset,
      --  Enable - the Counter Enable signal CNT_EN is used as trigger output (TRGO).
--  It is useful to start several timers at the same time or to control a
--  window in which a slave timer is enable. The Counter Enable signal is
--  generated by a logic AND between CEN control bit and the trigger input when
--  configured in gated mode. When the Counter Enable signal is controlled by
--  the trigger input, there is a delay on TRGO, except if the master/slave
--  mode is selected (see the MSM bit description in TIMx_SMCR register).
      Enable,
      --  Update - The update event is selected as trigger output (TRGO). For
--  instance a master timer can then be used as a prescaler for a slave timer.
      Update,
      --  Compare Pulse - The trigger output send a positive pulse when the CC1IF
--  flag is to be set (even if it was already high), as soon as a capture or a
--  compare match occurred. (TRGO).
      Compare_Pulse,
      --  Compare - OC1REFC signal is used as trigger output (TRGO)
      Compare_OC1,
      --  Compare - OC2REFC signal is used as trigger output (TRGO)
      Compare_OC2,
      --  Compare - OC3REFC signal is used as trigger output (TRGO)
      Compare_OC3,
      --  Compare - OC4REFC signal is used as trigger output (TRGO)
      Compare_OC4)
     with Size => 3;
   for CR2_MMS_Field use
     (Reset => 0,
      Enable => 1,
      Update => 2,
      Compare_Pulse => 3,
      Compare_OC1 => 4,
      Compare_OC2 => 5,
      Compare_OC3 => 6,
      Compare_OC4 => 7);

   --  Master mode selection 2 These bits allow the information to be sent to
   --  ADC for synchronization (TRGO2) to be selected. The combination is as
   --  follows: Note: The clock of the slave timer or ADC must be enabled prior
   --  to receive events from the master timer, and must not be changed
   --  on-the-fly while triggers are received from the master timer.
   type CR2_MMS2_Field is
     (--  Reset - the UG bit from the TIMx_EGR register is used as trigger output
--  (TRGO2). If the reset is generated by the trigger input (slave mode
--  controller configured in reset mode), the signal on TRGO2 is delayed
--  compared to the actual reset.
      Reset,
      --  Enable - the Counter Enable signal CNT_EN is used as trigger output
--  (TRGO2). It is useful to start several timers at the same time or to
--  control a window in which a slave timer is enabled. The Counter Enable
--  signal is generated by a logic AND between the CEN control bit and the
--  trigger input when configured in Gated mode. When the Counter Enable signal
--  is controlled by the trigger input, there is a delay on TRGO2, except if
--  the Master/Slave mode is selected (see the MSM bit description in TIMx_SMCR
--  register).
      Enable,
      --  Update - the update event is selected as trigger output (TRGO2). For
--  instance, a master timer can then be used as a prescaler for a slave timer.
      Update,
      --  Compare pulse - the trigger output sends a positive pulse when the CC1IF
--  flag is to be set (even if it was already high), as soon as a capture or
--  compare match occurs (TRGO2).
      Compare_Pulse,
      --  Compare - OC1REFC signal is used as trigger output (TRGO2)
      Compare_OC1,
      --  Compare - OC2REFC signal is used as trigger output (TRGO2)
      Compare_OC2,
      --  Compare - OC3REFC signal is used as trigger output (TRGO2)
      Compare_OC3,
      --  Compare - OC4REFC signal is used as trigger output (TRGO2)
      Compare_OC4,
      --  Compare - OC5REFC signal is used as trigger output (TRGO2)
      Compare_OC5,
      --  Compare - OC6REFC signal is used as trigger output (TRGO2)
      Compare_OC6,
      --  Compare Pulse - OC4REFC rising or falling edges generate pulses on TRGO2
      Compare_Pulse_OC4,
      --  Compare Pulse - OC6REFC rising or falling edges generate pulses on TRGO2
      Compare_Pulse_OC6,
      --  Compare Pulse - OC4REFC or OC6REFC rising edges generate pulses on TRGO2
      Compare_Pulse_OC4_OC6_Rising,
      --  Compare Pulse - OC4REFC rising or OC6REFC falling edges generate pulses on
--  TRGO2
      Compare_Pulse_OC4_Rise_OC6_Fall,
      --  Compare Pulse - OC5REFC or OC6REFC rising edges generate pulses on TRGO2
      Compare_Pulse_OC5_OC6_Rising,
      --  Compare Pulse - OC5REFC rising or OC6REFC falling edges generate pulses on
--  TRGO2
      Compare_Pulse_OC5_Rise_OC6_Fall)
     with Size => 4;
   for CR2_MMS2_Field use
     (Reset => 0,
      Enable => 1,
      Update => 2,
      Compare_Pulse => 3,
      Compare_OC1 => 4,
      Compare_OC2 => 5,
      Compare_OC3 => 6,
      Compare_OC4 => 7,
      Compare_OC5 => 8,
      Compare_OC6 => 9,
      Compare_Pulse_OC4 => 10,
      Compare_Pulse_OC6 => 11,
      Compare_Pulse_OC4_OC6_Rising => 12,
      Compare_Pulse_OC4_Rise_OC6_Fall => 13,
      Compare_Pulse_OC5_OC6_Rising => 14,
      Compare_Pulse_OC5_Rise_OC6_Fall => 15);

   --  TIM1 control register 2
   type CR2_Register is record
      --  Capture/compare preloaded control Note: This bit acts only on
      --  channels that have a complementary output.
      CCPC           : Boolean := False;
      --  unspecified
      Reserved_1_1   : HAL.Bit := 16#0#;
      --  Capture/compare control update selection Note: This bit acts only on
      --  channels that have a complementary output.
      CCUS           : Boolean := False;
      --  Capture/compare DMA selection
      CCDS           : Boolean := False;
      --  Master mode selection These bits allow selected information to be
      --  sent in master mode to slave timers for synchronization (TRGO). The
      --  combination is as follows: Note: The clock of the slave timer or ADC
      --  must be enabled prior to receive events from the master timer, and
      --  must not be changed on-the-fly while triggers are received from the
      --  master timer.
      MMS            : CR2_MMS_Field := STM32_SVD.TIM.Reset;
      --  TI1 selection
      TI1S           : Boolean := False;
      --  Output Idle state 1 (OC1 output) Note: This bit can not be modified
      --  as long as LOCK level 1, 2 or 3 has been programmed (LOCK bits in
      --  TIMx_BDTR register).
      OIS1           : Boolean := False;
      --  Output Idle state 1 (OC1N output) Note: This bit can not be modified
      --  as long as LOCK level 1, 2 or 3 has been programmed (LOCK bits in
      --  TIMx_BDTR register).
      OIS1N          : Boolean := False;
      --  Output Idle state 2 (OC2 output) Refer to OIS1 bit
      OIS2           : Boolean := False;
      --  Output Idle state 2 (OC2N output) Refer to OIS1N bit
      OIS2N          : Boolean := False;
      --  Output Idle state 3 (OC3 output) Refer to OIS1 bit
      OIS3           : Boolean := False;
      --  Output Idle state 3 (OC3N output) Refer to OIS1N bit
      OIS3N          : Boolean := False;
      --  Output Idle state 4 (OC4 output) Refer to OIS1 bit
      OIS4           : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  Output Idle state 5 (OC5 output) Refer to OIS1 bit
      OIS5           : Boolean := False;
      --  unspecified
      Reserved_17_17 : HAL.Bit := 16#0#;
      --  Output Idle state 6 (OC6 output) Refer to OIS1 bit
      OIS6           : Boolean := False;
      --  unspecified
      Reserved_19_19 : HAL.Bit := 16#0#;
      --  Master mode selection 2 These bits allow the information to be sent
      --  to ADC for synchronization (TRGO2) to be selected. The combination is
      --  as follows: Note: The clock of the slave timer or ADC must be enabled
      --  prior to receive events from the master timer, and must not be
      --  changed on-the-fly while triggers are received from the master timer.
      MMS2           : CR2_MMS2_Field := STM32_SVD.TIM.Reset;
      --  unspecified
      Reserved_24_31 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CR2_Register use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      MMS            at 0 range 4 .. 6;
      TI1S           at 0 range 7 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      OIS2           at 0 range 10 .. 10;
      OIS2N          at 0 range 11 .. 11;
      OIS3           at 0 range 12 .. 12;
      OIS3N          at 0 range 13 .. 13;
      OIS4           at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      OIS5           at 0 range 16 .. 16;
      Reserved_17_17 at 0 range 17 .. 17;
      OIS6           at 0 range 18 .. 18;
      Reserved_19_19 at 0 range 19 .. 19;
      MMS2           at 0 range 20 .. 23;
      Reserved_24_31 at 0 range 24 .. 31;
   end record;

   subtype SMCR_SMS_2_0_Field is HAL.UInt3;

   --  TIM1 TS[0]: Trigger selection This bit-field selects the trigger input
   --  to be used to synchronize the counter. Others: Reserved See Table1118:
   --  TIM1 internal trigger connection on page1561 for more details on ITRx
   --  meaning for each Timer. Note: These bits must be changed only when they
   --  are not used (e.g. when SMS=000) to avoid wrong edge detections at the
   --  transition.
   type SMCR_TS_2_0_Field is
     (--  Internal Trigger 0 (ITR0)
      Internal_0,
      --  Internal Trigger 1 (ITR1)
      Internal_1,
      --  Internal Trigger 2 (ITR2)
      Internal_2,
      --  Internal Trigger 3 (ITR3)
      Internal_3,
      --  TI1 Edge Detector (TI1F_ED)
      TI1_Edge_Detector,
      --  Filtered Timer Input 1 (TI1FP1)
      Filtered_Timer_Input_1,
      --  Filtered Timer Input 2 (TI2FP2)
      Filtered_Timer_Input_2,
      --  External Trigger input (ETRF)
      External_Trigger_Input)
     with Size => 3;
   for SMCR_TS_2_0_Field use
     (Internal_0 => 0,
      Internal_1 => 1,
      Internal_2 => 2,
      Internal_3 => 3,
      TI1_Edge_Detector => 4,
      Filtered_Timer_Input_1 => 5,
      Filtered_Timer_Input_2 => 6,
      External_Trigger_Input => 7);

   --  External trigger filter This bit-field then defines the frequency used
   --  to sample ETRP signal and the length of the digital filter applied to
   --  ETRP. The digital filter is made of an event counter in which N
   --  consecutive events are needed to validate a transition on the output:
   type SMCR_ETF_Field is
     (--  No filter, sampling is done at fDTS
      No_Filter,
      --  fSAMPLING=fCK_INT, N=2
      N2,
      --  fSAMPLING=fCK_INT, N=4
      N4,
      --  fSAMPLING=fCK_INT, N=8
      N8,
      --  fSAMPLING=fDTS/2, N=6
      DIV_2_N6,
      --  fSAMPLING=fDTS/2, N=8
      DIV_2_N8,
      --  fSAMPLING=fDTS/4, N=6
      DIV_4_N6,
      --  fSAMPLING=fDTS/4, N=8
      DIV_4_N8,
      --  fSAMPLING=fDTS/8, N=6
      DIV_8_N6,
      --  fSAMPLING=fDTS/8, N=8
      DIV_8_N8,
      --  fSAMPLING=fDTS/16, N=5
      DIV_16_N5,
      --  fSAMPLING=fDTS/16, N=6
      DIV_16_N6,
      --  fSAMPLING=fDTS/16, N=8
      DIV_16_N8,
      --  fSAMPLING=fDTS/32, N=5
      DIV_32_N5,
      --  fSAMPLING=fDTS/32, N=6
      DIV_32_N6,
      --  fSAMPLING=fDTS/32, N=8
      DIV_32_N8)
     with Size => 4;
   for SMCR_ETF_Field use
     (No_Filter => 0,
      N2 => 1,
      N4 => 2,
      N8 => 3,
      DIV_2_N6 => 4,
      DIV_2_N8 => 5,
      DIV_4_N6 => 6,
      DIV_4_N8 => 7,
      DIV_8_N6 => 8,
      DIV_8_N8 => 9,
      DIV_16_N5 => 10,
      DIV_16_N6 => 11,
      DIV_16_N8 => 12,
      DIV_32_N5 => 13,
      DIV_32_N6 => 14,
      DIV_32_N8 => 15);

   --  External trigger prescaler External trigger signal ETRP frequency must
   --  be at most 1/4 of fCK_INT frequency. A prescaler can be enabled to
   --  reduce ETRP frequency. It is useful when inputting fast external clocks.
   type SMCR_ETPS_Field is
     (--  Prescaler OFF
      Off,
      --  ETRP frequency divided by 2
      DIV_2,
      --  ETRP frequency divided by 4
      DIV_4,
      --  ETRP frequency divided by 8
      DIV_8)
     with Size => 2;
   for SMCR_ETPS_Field use
     (Off => 0,
      DIV_2 => 1,
      DIV_4 => 2,
      DIV_8 => 3);

   --  TIM1 slave mode control register
   type SMCR_Register is record
      --  SMS[0]: Slave mode selection When external signals are selected the
      --  active edge of the trigger signal (TRGI) is linked to the polarity
      --  selected on the external input (see Input Control register and
      --  Control Register description. Codes above 1000: Reserved. Note: The
      --  gated mode must not be used if TI1F_ED is selected as the trigger
      --  input (TS=00100). Indeed, TI1F_ED outputs 1 pulse for each transition
      --  on TI1F, whereas the gated mode checks the level of the trigger
      --  signal. Note: The clock of the slave peripherals (timer, ADC, ...)
      --  receiving the TRGO or the TRGO2 signals must be enabled prior to
      --  receive events from the master timer, and the clock frequency
      --  (prescaler) must not be changed on-the-fly while triggers are
      --  received from the master timer.
      SMS_2_0        : SMCR_SMS_2_0_Field := 16#0#;
      --  OCREF clear selection This bit is used to select the OCREF clear
      --  source.
      OCCS           : Boolean := False;
      --  TIM1 TS[0]: Trigger selection This bit-field selects the trigger
      --  input to be used to synchronize the counter. Others: Reserved See
      --  Table1118: TIM1 internal trigger connection on page1561 for more
      --  details on ITRx meaning for each Timer. Note: These bits must be
      --  changed only when they are not used (e.g. when SMS=000) to avoid
      --  wrong edge detections at the transition.
      TS_2_0         : SMCR_TS_2_0_Field := STM32_SVD.TIM.Internal_0;
      --  Master/slave mode
      MSM            : Boolean := False;
      --  External trigger filter This bit-field then defines the frequency
      --  used to sample ETRP signal and the length of the digital filter
      --  applied to ETRP. The digital filter is made of an event counter in
      --  which N consecutive events are needed to validate a transition on the
      --  output:
      ETF            : SMCR_ETF_Field := STM32_SVD.TIM.No_Filter;
      --  External trigger prescaler External trigger signal ETRP frequency
      --  must be at most 1/4 of fCK_INT frequency. A prescaler can be enabled
      --  to reduce ETRP frequency. It is useful when inputting fast external
      --  clocks.
      ETPS           : SMCR_ETPS_Field := STM32_SVD.TIM.Off;
      --  External clock enable This bit enables External clock mode 2. Note:
      --  Setting the ECE bit has the same effect as selecting external clock
      --  mode 1 with TRGI connected to ETRF (SMS=111 and TS=00111). It is
      --  possible to simultaneously use external clock mode 2 with the
      --  following slave modes: reset mode, gated mode and trigger mode.
      --  Nevertheless, TRGI must not be connected to ETRF in this case (TS
      --  bits must not be 00111). Note: If external clock mode 1 and external
      --  clock mode 2 are enabled at the same time, the external clock input
      --  is ETRF.
      ECE            : Boolean := False;
      --  External trigger polarity This bit selects whether ETR or ETR is used
      --  for trigger operations
      ETP            : Boolean := False;
      --  SMS[3]
      SMS_3          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register use record
      SMS_2_0        at 0 range 0 .. 2;
      OCCS           at 0 range 3 .. 3;
      TS_2_0         at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      ETF            at 0 range 8 .. 11;
      ETPS           at 0 range 12 .. 13;
      ECE            at 0 range 14 .. 14;
      ETP            at 0 range 15 .. 15;
      SMS_3          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  TIM1 DMA/interrupt enable register
   type DIER_Register is record
      --  Update interrupt enable
      UIE            : Boolean := False;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : Boolean := False;
      --  Capture/Compare 2 interrupt enable
      CC2IE          : Boolean := False;
      --  Capture/Compare 3 interrupt enable
      CC3IE          : Boolean := False;
      --  Capture/Compare 4 interrupt enable
      CC4IE          : Boolean := False;
      --  COM interrupt enable
      COMIE          : Boolean := False;
      --  Trigger interrupt enable
      TIE            : Boolean := False;
      --  Break interrupt enable
      BIE            : Boolean := False;
      --  Update DMA request enable
      UDE            : Boolean := False;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : Boolean := False;
      --  Capture/Compare 2 DMA request enable
      CC2DE          : Boolean := False;
      --  Capture/Compare 3 DMA request enable
      CC3DE          : Boolean := False;
      --  Capture/Compare 4 DMA request enable
      CC4DE          : Boolean := False;
      --  COM DMA request enable
      COMDE          : Boolean := False;
      --  Trigger DMA request enable
      TDE            : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DIER_Register use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      CC3IE          at 0 range 3 .. 3;
      CC4IE          at 0 range 4 .. 4;
      COMIE          at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      CC2DE          at 0 range 10 .. 10;
      CC3DE          at 0 range 11 .. 11;
      CC4DE          at 0 range 12 .. 12;
      COMDE          at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   --  TIM1 status register
   type SR_Register is record
      --  Update interrupt flag This bit is set by hardware on an update event.
      --  It is cleared by software. At overflow or underflow regarding the
      --  repetition counter value (update if repetition counter = 0) and if
      --  the UDIS=0 in the TIMx_CR1 register. When CNT is reinitialized by
      --  software using the UG bit in TIMx_EGR register, if URS=0 and UDIS=0
      --  in the TIMx_CR1 register. When CNT is reinitialized by a trigger
      --  event (refer to Section122.4.3: TIM1 slave mode control register
      --  (TIM1_SMCR)), if URS=0 and UDIS=0 in the TIMx_CR1 register.
      UIF            : Boolean := False;
      --  Capture/Compare 1 interrupt flag This flag is set by hardware. It is
      --  cleared by software (input capture or output compare mode) or by
      --  reading the TIMx_CCR1 register (input capture mode only). If channel
      --  CC1 is configured as output: this flag is set when the content of the
      --  counter TIMx_CNT matches the content of the TIMx_CCR1 register. When
      --  the content of TIMx_CCR1 is greater than the content of TIMx_ARR, the
      --  CC1IF bit goes high on the counter overflow (in up-counting and
      --  up/down-counting modes) or underflow (in down-counting mode). There
      --  are 3 possible options for flag setting in center-aligned mode, refer
      --  to the CMS bits in the TIMx_CR1 register for the full description. If
      --  channel CC1 is configured as input: this bit is set when counter
      --  value has been captured in TIMx_CCR1 register (an edge has been
      --  detected on IC1, as per the edge sensitivity defined with the CC1P
      --  and CC1NP bits setting, in TIMx_CCER).
      CC1IF          : Boolean := False;
      --  Capture/Compare 2 interrupt flag Refer to CC1IF description
      CC2IF          : Boolean := False;
      --  Capture/Compare 3 interrupt flag Refer to CC1IF description
      CC3IF          : Boolean := False;
      --  Capture/Compare 4 interrupt flag Refer to CC1IF description
      CC4IF          : Boolean := False;
      --  COM interrupt flag This flag is set by hardware on COM event (when
      --  Capture/compare Control bits - CCxE, CCxNE, OCxM - have been
      --  updated). It is cleared by software.
      COMIF          : Boolean := False;
      --  Trigger interrupt flag This flag is set by hardware on the TRG
      --  trigger event (active edge detected on TRGI input when the slave mode
      --  controller is enabled in all modes but gated mode. It is set when the
      --  counter starts or stops when gated mode is selected. It is cleared by
      --  software.
      TIF            : Boolean := False;
      --  Break interrupt flag This flag is set by hardware as soon as the
      --  break input goes active. It can be cleared by software if the break
      --  input is not active.
      BIF            : Boolean := False;
      --  Break 2 interrupt flag This flag is set by hardware as soon as the
      --  break 2 input goes active. It can be cleared by software if the break
      --  2 input is not active.
      B2IF           : Boolean := False;
      --  Capture/Compare 1 overcapture flag This flag is set by hardware only
      --  when the corresponding channel is configured in input capture mode.
      --  It is cleared by software by writing it to 0.
      CC1OF          : Boolean := False;
      --  Capture/Compare 2 overcapture flag Refer to CC1OF description
      CC2OF          : Boolean := False;
      --  Capture/Compare 3 overcapture flag Refer to CC1OF description
      CC3OF          : Boolean := False;
      --  Capture/Compare 4 overcapture flag Refer to CC1OF description
      CC4OF          : Boolean := False;
      --  System Break interrupt flag This flag is set by hardware as soon as
      --  the system break input goes active. It can be cleared by software if
      --  the system break input is not active. This flag must be reset to
      --  re-start PWM operation.
      SBIF           : Boolean := False;
      --  unspecified
      Reserved_14_15 : HAL.UInt2 := 16#0#;
      --  Compare 5 interrupt flag Refer to CC1IF description (Note: Channel 5
      --  can only be configured as output)
      CC5IF          : Boolean := False;
      --  Compare 6 interrupt flag Refer to CC1IF description (Note: Channel 6
      --  can only be configured as output)
      CC6IF          : Boolean := False;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SR_Register use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      CC3IF          at 0 range 3 .. 3;
      CC4IF          at 0 range 4 .. 4;
      COMIF          at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      B2IF           at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      CC3OF          at 0 range 11 .. 11;
      CC4OF          at 0 range 12 .. 12;
      SBIF           at 0 range 13 .. 13;
      Reserved_14_15 at 0 range 14 .. 15;
      CC5IF          at 0 range 16 .. 16;
      CC6IF          at 0 range 17 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  TIM1 event generation register
   type EGR_Register is record
      --  Write-only. Update generation This bit can be set by software, it is
      --  automatically cleared by hardware.
      UG            : Boolean := False;
      --  Write-only. Capture/Compare 1 generation This bit is set by software
      --  in order to generate an event, it is automatically cleared by
      --  hardware. If channel CC1 is configured as output: CC1IF flag is set,
      --  Corresponding interrupt or DMA request is sent if enabled. If channel
      --  CC1 is configured as input: The current value of the counter is
      --  captured in TIMx_CCR1 register. The CC1IF flag is set, the
      --  corresponding interrupt or DMA request is sent if enabled. The CC1OF
      --  flag is set if the CC1IF flag was already high.
      CC1G          : Boolean := False;
      --  Write-only. Capture/Compare 2 generation Refer to CC1G description
      CC2G          : Boolean := False;
      --  Write-only. Capture/Compare 3 generation Refer to CC1G description
      CC3G          : Boolean := False;
      --  Write-only. Capture/Compare 4 generation Refer to CC1G description
      CC4G          : Boolean := False;
      --  Write-only. Capture/Compare control update generation This bit can be
      --  set by software, it is automatically cleared by hardware Note: This
      --  bit acts only on channels having a complementary output.
      COMG          : Boolean := False;
      --  Write-only. Trigger generation This bit is set by software in order
      --  to generate an event, it is automatically cleared by hardware.
      TG            : Boolean := False;
      --  Write-only. Break generation This bit is set by software in order to
      --  generate an event, it is automatically cleared by hardware.
      BG            : Boolean := False;
      --  Write-only. Break 2 generation This bit is set by software in order
      --  to generate an event, it is automatically cleared by hardware.
      B2G           : Boolean := False;
      --  unspecified
      Reserved_9_15 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for EGR_Register use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      CC3G          at 0 range 3 .. 3;
      CC4G          at 0 range 4 .. 4;
      COMG          at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      B2G           at 0 range 8 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   --  Capture/Compare 1 Selection This bit-field defines the direction of the
   --  channel (input/output) as well as the used input. Note: CC1S bits are
   --  writable only when the channel is OFF (CC1E = 0 in TIMx_CCER).
   type CCMR1_INPUT_CC1S_Field is
     (--  CC1 channel is configured as output
      B_0x0,
      --  CC1 channel is configured as input, IC1 is mapped on TI1
      B_0x1,
      --  CC1 channel is configured as input, IC1 is mapped on TI2
      B_0x2,
      --  CC1 channel is configured as input, IC1 is mapped on TRC. This mode is
--  working only if an internal trigger input is selected through TS bit
--  (TIMx_SMCR register)
      B_0x3)
     with Size => 2;
   for CCMR1_INPUT_CC1S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  Input capture 1 prescaler This bit-field defines the ratio of the
   --  prescaler acting on CC1 input (IC1). The prescaler is reset as soon as
   --  CC1E=0 (TIMx_CCER register).
   type CCMR1_INPUT_IC1PSC_Field is
     (--  no prescaler, capture is done each time an edge is detected on the capture
--  input
      B_0x0,
      --  capture is done once every 2 events
      B_0x1,
      --  capture is done once every 4 events
      B_0x2,
      --  capture is done once every 8 events
      B_0x3)
     with Size => 2;
   for CCMR1_INPUT_IC1PSC_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  Input capture 1 filter This bit-field defines the frequency used to
   --  sample TI1 input and the length of the digital filter applied to TI1.
   --  The digital filter is made of an event counter in which N consecutive
   --  events are needed to validate a transition on the output:
   type CCMR1_INPUT_IC1F_Field is
     (--  No filter, sampling is done at fDTS
      B_0x0,
      --  fSAMPLING=fCK_INT, N=2
      B_0x1,
      --  fSAMPLING=fCK_INT, N=4
      B_0x2,
      --  fSAMPLING=fCK_INT, N=8
      B_0x3,
      --  fSAMPLING=fDTS/2, N=6
      B_0x4,
      --  fSAMPLING=fDTS/2, N=8
      B_0x5,
      --  fSAMPLING=fDTS/4, N=6
      B_0x6,
      --  fSAMPLING=fDTS/4, N=8
      B_0x7,
      --  fSAMPLING=fDTS/8, N=6
      B_0x8,
      --  fSAMPLING=fDTS/8, N=8
      B_0x9,
      --  fSAMPLING=fDTS/16, N=5
      B_0xA,
      --  fSAMPLING=fDTS/16, N=6
      B_0xB,
      --  fSAMPLING=fDTS/16, N=8
      B_0xC,
      --  fSAMPLING=fDTS/32, N=5
      B_0xD,
      --  fSAMPLING=fDTS/32, N=6
      B_0xE,
      --  fSAMPLING=fDTS/32, N=8
      B_0xF)
     with Size => 4;
   for CCMR1_INPUT_IC1F_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7,
      B_0x8 => 8,
      B_0x9 => 9,
      B_0xA => 10,
      B_0xB => 11,
      B_0xC => 12,
      B_0xD => 13,
      B_0xE => 14,
      B_0xF => 15);

   --  Capture/Compare 2 selection This bit-field defines the direction of the
   --  channel (input/output) as well as the used input. Note: CC2S bits are
   --  writable only when the channel is OFF (CC2E = 0 in TIMx_CCER).
   type CCMR1_INPUT_CC2S_Field is
     (--  CC2 channel is configured as output
      B_0x0,
      --  CC2 channel is configured as input, IC2 is mapped on TI2
      B_0x1,
      --  CC2 channel is configured as input, IC2 is mapped on TI1
      B_0x2,
      --  CC2 channel is configured as input, IC2 is mapped on TRC. This mode is
--  working only if an internal trigger input is selected through TS bit
--  (TIMx_SMCR register)
      B_0x3)
     with Size => 2;
   for CCMR1_INPUT_CC2S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR1_INPUT_IC2PSC_Field is HAL.UInt2;
   subtype CCMR1_INPUT_IC2F_Field is HAL.UInt4;

   --  TIM1 capture/compare mode register 1
   type CCMR1_INPUT_Register is record
      --  Capture/Compare 1 Selection This bit-field defines the direction of
      --  the channel (input/output) as well as the used input. Note: CC1S bits
      --  are writable only when the channel is OFF (CC1E = 0 in TIMx_CCER).
      CC1S           : CCMR1_INPUT_CC1S_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 1 prescaler This bit-field defines the ratio of the
      --  prescaler acting on CC1 input (IC1). The prescaler is reset as soon
      --  as CC1E=0 (TIMx_CCER register).
      IC1PSC         : CCMR1_INPUT_IC1PSC_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 1 filter This bit-field defines the frequency used to
      --  sample TI1 input and the length of the digital filter applied to TI1.
      --  The digital filter is made of an event counter in which N consecutive
      --  events are needed to validate a transition on the output:
      IC1F           : CCMR1_INPUT_IC1F_Field := STM32_SVD.TIM.B_0x0;
      --  Capture/Compare 2 selection This bit-field defines the direction of
      --  the channel (input/output) as well as the used input. Note: CC2S bits
      --  are writable only when the channel is OFF (CC2E = 0 in TIMx_CCER).
      CC2S           : CCMR1_INPUT_CC2S_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 2 prescaler Refer to IC1PSC[1:0] description.
      IC2PSC         : CCMR1_INPUT_IC2PSC_Field := 16#0#;
      --  Input capture 2 filter Refer to IC1F[3:0] description.
      IC2F           : CCMR1_INPUT_IC2F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_INPUT_Register use record
      CC1S           at 0 range 0 .. 1;
      IC1PSC         at 0 range 2 .. 3;
      IC1F           at 0 range 4 .. 7;
      CC2S           at 0 range 8 .. 9;
      IC2PSC         at 0 range 10 .. 11;
      IC2F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Capture/Compare 1 selection This bit-field defines the direction of the
   --  channel (input/output) as well as the used input. Note: CC1S bits are
   --  writable only when the channel is OFF (CC1E = 0 in TIMx_CCER).
   type CCMR1_OUTPUT_CC1S_Field is
     (--  CC1 channel is configured as output
      B_0x0,
      --  CC1 channel is configured as input, IC1 is mapped on TI1
      B_0x1,
      --  CC1 channel is configured as input, IC1 is mapped on TI2
      B_0x2,
      --  CC1 channel is configured as input, IC1 is mapped on TRC. This mode is
--  working only if an internal trigger input is selected through TS bit
--  (TIMx_SMCR register)
      B_0x3)
     with Size => 2;
   for CCMR1_OUTPUT_CC1S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  OC1M[2:0]: Output Compare 1 mode These bits define the behavior of the
   --  output reference signal OC1REF from which OC1 and OC1N are derived.
   --  OC1REF is active high whereas OC1 and OC1N active level depends on CC1P
   --  and CC1NP bits. Note: These bits can not be modified as long as LOCK
   --  level 3 has been programmed (LOCK bits in TIMx_BDTR register) and
   --  CC1S=00 (the channel is configured in output). Note: In PWM mode, the
   --  OCREF level changes only when the result of the comparison changes or
   --  when the output compare mode switches from frozen mode to PWM mode.
   --  Note: On channels having a complementary output, this bit field is
   --  preloaded. If the CCPC bit is set in the TIMx_CR2 register then the OC1M
   --  active bits take the new value from the preloaded bits only when a COM
   --  event is generated. Note: The OC1M[3] bit is not contiguous, located in
   --  bit 16.
   type CCMR1_OUTPUT_OC1M_Field is
     (--  Frozen - The comparison between the output compare register TIMx_CCR1 and
--  the counter TIMx_CNT has no effect on the outputs.This mode can be used
--  when the timer serves as a software timebase. When the frozen mode is
--  enabled during timer operation, the output keeps the state (active or
--  inactive) it had before entering the frozen state.
      B_0x0,
      --  Set channel 1 to active level on match. OC1REF signal is forced high when
--  the counter TIMx_CNT matches the capture/compare register 1 (TIMx_CCR1).
      B_0x1,
      --  Set channel 1 to inactive level on match. OC1REF signal is forced low when
--  the counter TIMx_CNT matches the capture/compare register 1 (TIMx_CCR1).
      B_0x2,
      --  Toggle - OC1REF toggles when TIMx_CNT=TIMx_CCR1.
      B_0x3,
      --  Force inactive level - OC1REF is forced low.
      B_0x4,
      --  Force active level - OC1REF is forced high.
      B_0x5,
      --  PWM mode 1 - In upcounting, channel 1 is active as long as
--  TIMx_CNT<TIMx_CCR1 else inactive. In downcounting, channel 1 is inactive
--  (OC1REF=0) as long as TIMx_CNT>TIMx_CCR1 else active (OC1REF=1).
      B_0x6,
      --  PWM mode 2 - In upcounting, channel 1 is inactive as long as
--  TIMx_CNT<TIMx_CCR1 else active. In downcounting, channel 1 is active as
--  long as TIMx_CNT>TIMx_CCR1 else inactive.
      B_0x7)
     with Size => 3;
   for CCMR1_OUTPUT_OC1M_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7);

   --  Capture/Compare 2 selection This bit-field defines the direction of the
   --  channel (input/output) as well as the used input. Note: CC2S bits are
   --  writable only when the channel is OFF (CC2E = 0 in TIMx_CCER).
   type CCMR1_OUTPUT_CC2S_Field is
     (--  CC2 channel is configured as output
      B_0x0,
      --  CC2 channel is configured as input, IC2 is mapped on TI2
      B_0x1,
      --  CC2 channel is configured as input, IC2 is mapped on TI1
      B_0x2,
      --  CC2 channel is configured as input, IC2 is mapped on TRC. This mode is
--  working only if an internal trigger input is selected through the TS bit
--  (TIMx_SMCR register)
      B_0x3)
     with Size => 2;
   for CCMR1_OUTPUT_CC2S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR1_OUTPUT_OC2M_Field is HAL.UInt3;

   --  TIM1 capture/compare mode register 1
   type CCMR1_OUTPUT_Register is record
      --  Capture/Compare 1 selection This bit-field defines the direction of
      --  the channel (input/output) as well as the used input. Note: CC1S bits
      --  are writable only when the channel is OFF (CC1E = 0 in TIMx_CCER).
      CC1S           : CCMR1_OUTPUT_CC1S_Field := STM32_SVD.TIM.B_0x0;
      --  Output Compare 1 fast enable This bit decreases the latency between a
      --  trigger event and a transition on the timer output. It must be used
      --  in one-pulse mode (OPM bit set in TIMx_CR1 register), to have the
      --  output pulse starting as soon as possible after the starting trigger.
      OC1FE          : Boolean := False;
      --  Output Compare 1 preload enable Note: These bits can not be modified
      --  as long as LOCK level 3 has been programmed (LOCK bits in TIMx_BDTR
      --  register) and CC1S=00 (the channel is configured in output).
      OC1PE          : Boolean := False;
      --  OC1M[2:0]: Output Compare 1 mode These bits define the behavior of
      --  the output reference signal OC1REF from which OC1 and OC1N are
      --  derived. OC1REF is active high whereas OC1 and OC1N active level
      --  depends on CC1P and CC1NP bits. Note: These bits can not be modified
      --  as long as LOCK level 3 has been programmed (LOCK bits in TIMx_BDTR
      --  register) and CC1S=00 (the channel is configured in output). Note: In
      --  PWM mode, the OCREF level changes only when the result of the
      --  comparison changes or when the output compare mode switches from
      --  frozen mode to PWM mode. Note: On channels having a complementary
      --  output, this bit field is preloaded. If the CCPC bit is set in the
      --  TIMx_CR2 register then the OC1M active bits take the new value from
      --  the preloaded bits only when a COM event is generated. Note: The
      --  OC1M[3] bit is not contiguous, located in bit 16.
      OC1M           : CCMR1_OUTPUT_OC1M_Field := STM32_SVD.TIM.B_0x0;
      --  Output Compare 1 clear enable
      OC1CE          : Boolean := False;
      --  Capture/Compare 2 selection This bit-field defines the direction of
      --  the channel (input/output) as well as the used input. Note: CC2S bits
      --  are writable only when the channel is OFF (CC2E = 0 in TIMx_CCER).
      CC2S           : CCMR1_OUTPUT_CC2S_Field := STM32_SVD.TIM.B_0x0;
      --  Output Compare 2 fast enable Refer to OC1FE description.
      OC2FE          : Boolean := False;
      --  Output Compare 2 preload enable Refer to OC1PE description.
      OC2PE          : Boolean := False;
      --  OC2M[2:0]: Output Compare 2 mode Refer to OC1M[3:0] description.
      OC2M           : CCMR1_OUTPUT_OC2M_Field := 16#0#;
      --  Output Compare 2 clear enable Refer to OC1CE description.
      OC2CE          : Boolean := False;
      --  OC1M[3]
      OC1M_1         : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  OC2M[3]
      OC2M_1         : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_OUTPUT_Register use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      OC1CE          at 0 range 7 .. 7;
      CC2S           at 0 range 8 .. 9;
      OC2FE          at 0 range 10 .. 10;
      OC2PE          at 0 range 11 .. 11;
      OC2M           at 0 range 12 .. 14;
      OC2CE          at 0 range 15 .. 15;
      OC1M_1         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC2M_1         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  Capture/compare 3 selection This bit-field defines the direction of the
   --  channel (input/output) as well as the used input. Note: CC3S bits are
   --  writable only when the channel is OFF (CC3E = 0 in TIMx_CCER).
   type CCMR2_INPUT_CC3S_Field is
     (--  CC3 channel is configured as output
      B_0x0,
      --  CC3 channel is configured as input, IC3 is mapped on TI3
      B_0x1,
      --  CC3 channel is configured as input, IC3 is mapped on TI4
      B_0x2,
      --  CC3 channel is configured as input, IC3 is mapped on TRC. This mode is
--  working only if an internal trigger input is selected through TS bit
--  (TIMx_SMCR register)
      B_0x3)
     with Size => 2;
   for CCMR2_INPUT_CC3S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR2_INPUT_IC3PSC_Field is HAL.UInt2;
   subtype CCMR2_INPUT_IC3F_Field is HAL.UInt4;

   --  Capture/Compare 4 selection This bit-field defines the direction of the
   --  channel (input/output) as well as the used input. Note: CC4S bits are
   --  writable only when the channel is OFF (CC4E = 0 in TIMx_CCER).
   type CCMR2_INPUT_CC4S_Field is
     (--  CC4 channel is configured as output
      B_0x0,
      --  CC4 channel is configured as input, IC4 is mapped on TI4
      B_0x1,
      --  CC4 channel is configured as input, IC4 is mapped on TI3
      B_0x2,
      --  CC4 channel is configured as input, IC4 is mapped on TRC. This mode is
--  working only if an internal trigger input is selected through TS bit
--  (TIMx_SMCR register)
      B_0x3)
     with Size => 2;
   for CCMR2_INPUT_CC4S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR2_INPUT_IC4PSC_Field is HAL.UInt2;
   subtype CCMR2_INPUT_IC4F_Field is HAL.UInt4;

   --  TIM1 capture/compare mode register 2
   type CCMR2_INPUT_Register is record
      --  Capture/compare 3 selection This bit-field defines the direction of
      --  the channel (input/output) as well as the used input. Note: CC3S bits
      --  are writable only when the channel is OFF (CC3E = 0 in TIMx_CCER).
      CC3S           : CCMR2_INPUT_CC3S_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 3 prescaler Refer to IC1PSC[1:0] description.
      IC3PSC         : CCMR2_INPUT_IC3PSC_Field := 16#0#;
      --  Input capture 3 filter Refer to IC1F[3:0] description.
      IC3F           : CCMR2_INPUT_IC3F_Field := 16#0#;
      --  Capture/Compare 4 selection This bit-field defines the direction of
      --  the channel (input/output) as well as the used input. Note: CC4S bits
      --  are writable only when the channel is OFF (CC4E = 0 in TIMx_CCER).
      CC4S           : CCMR2_INPUT_CC4S_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 4 prescaler Refer to IC1PSC[1:0] description.
      IC4PSC         : CCMR2_INPUT_IC4PSC_Field := 16#0#;
      --  Input capture 4 filter Refer to IC1F[3:0] description.
      IC4F           : CCMR2_INPUT_IC4F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_INPUT_Register use record
      CC3S           at 0 range 0 .. 1;
      IC3PSC         at 0 range 2 .. 3;
      IC3F           at 0 range 4 .. 7;
      CC4S           at 0 range 8 .. 9;
      IC4PSC         at 0 range 10 .. 11;
      IC4F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Capture/Compare 3 selection This bit-field defines the direction of the
   --  channel (input/output) as well as the used input. Note: CC3S bits are
   --  writable only when the channel is OFF (CC3E = 0 in TIMx_CCER).
   type CCMR2_OUTPUT_CC3S_Field is
     (--  CC3 channel is configured as output
      B_0x0,
      --  CC3 channel is configured as input, IC3 is mapped on TI3
      B_0x1,
      --  CC3 channel is configured as input, IC3 is mapped on TI4
      B_0x2,
      --  CC3 channel is configured as input, IC3 is mapped on TRC. This mode is
--  working only if an internal trigger input is selected through TS bit
--  (TIMx_SMCR register)
      B_0x3)
     with Size => 2;
   for CCMR2_OUTPUT_CC3S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR2_OUTPUT_OC3M_Field is HAL.UInt3;

   --  Capture/Compare 4 selection This bit-field defines the direction of the
   --  channel (input/output) as well as the used input. Note: CC4S bits are
   --  writable only when the channel is OFF (CC4E = 0 in TIMx_CCER).
   type CCMR2_OUTPUT_CC4S_Field is
     (--  CC4 channel is configured as output
      B_0x0,
      --  CC4 channel is configured as input, IC4 is mapped on TI4
      B_0x1,
      --  CC4 channel is configured as input, IC4 is mapped on TI3
      B_0x2,
      --  CC4 channel is configured as input, IC4 is mapped on TRC. This mode is
--  working only if an internal trigger input is selected through TS bit
--  (TIMx_SMCR register)
      B_0x3)
     with Size => 2;
   for CCMR2_OUTPUT_CC4S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR2_OUTPUT_OC4M_Field is HAL.UInt3;

   --  TIM1 capture/compare mode register 1
   type CCMR2_OUTPUT_Register is record
      --  Capture/Compare 3 selection This bit-field defines the direction of
      --  the channel (input/output) as well as the used input. Note: CC3S bits
      --  are writable only when the channel is OFF (CC3E = 0 in TIMx_CCER).
      CC3S           : CCMR2_OUTPUT_CC3S_Field := STM32_SVD.TIM.B_0x0;
      --  Output compare 3 fast enable Refer to OC1FE description.
      OC3FE          : Boolean := False;
      --  Output compare 3 preload enable Refer to OC1PE description.
      OC3PE          : Boolean := False;
      --  OC3M[2:0]: Output compare 3 mode Refer to OC1M[3:0] description.
      OC3M           : CCMR2_OUTPUT_OC3M_Field := 16#0#;
      --  Output compare 3 clear enable Refer to OC1CE description.
      OC3CE          : Boolean := False;
      --  Capture/Compare 4 selection This bit-field defines the direction of
      --  the channel (input/output) as well as the used input. Note: CC4S bits
      --  are writable only when the channel is OFF (CC4E = 0 in TIMx_CCER).
      CC4S           : CCMR2_OUTPUT_CC4S_Field := STM32_SVD.TIM.B_0x0;
      --  Output compare 4 fast enable Refer to OC1FE description.
      OC4FE          : Boolean := False;
      --  Output compare 4 preload enable Refer to OC1PE description.
      OC4PE          : Boolean := False;
      --  OC4M[2:0]: Output compare 4 mode Refer to OC3M[3:0] description.
      OC4M           : CCMR2_OUTPUT_OC4M_Field := 16#0#;
      --  Output compare 4 clear enable Refer to OC1CE description.
      OC4CE          : Boolean := False;
      --  OC3M[3]
      OC3M_1         : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  OC4M[3]
      OC4M_1         : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_OUTPUT_Register use record
      CC3S           at 0 range 0 .. 1;
      OC3FE          at 0 range 2 .. 2;
      OC3PE          at 0 range 3 .. 3;
      OC3M           at 0 range 4 .. 6;
      OC3CE          at 0 range 7 .. 7;
      CC4S           at 0 range 8 .. 9;
      OC4FE          at 0 range 10 .. 10;
      OC4PE          at 0 range 11 .. 11;
      OC4M           at 0 range 12 .. 14;
      OC4CE          at 0 range 15 .. 15;
      OC3M_1         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC4M_1         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  TIM1 capture/compare enable register
   type CCER_Register is record
      --  Capture/Compare 1 output enable When CC1 channel is configured as
      --  output, the OC1 level depends on MOE, OSSI, OSSR, OIS1, OIS1N and
      --  CC1NE bits, regardless of the CC1E bits state. Refer to Table1119 for
      --  details. Note: On channels having a complementary output, this bit is
      --  preloaded. If the CCPC bit is set in the TIMx_CR2 register then the
      --  CC1E active bit takes the new value from the preloaded bit only when
      --  a Commutation event is generated.
      CC1E           : Boolean := False;
      --  Capture/Compare 1 output polarity When CC1 channel is configured as
      --  input, both CC1NP/CC1P bits select the active polarity of TI1FP1 and
      --  TI2FP1 for trigger or capture operations. CC1NP=0,
      --  CC1P=0:	non-inverted/rising edge. The circuit is sensitive to TIxFP1
      --  rising edge (capture or trigger operations in reset, external clock
      --  or trigger mode), TIxFP1 is not inverted (trigger operation in gated
      --  mode or encoder mode). CC1NP=0, CC1P=1:	inverted/falling edge. The
      --  circuit is sensitive to TIxFP1 falling edge (capture or trigger
      --  operations in reset, external clock or trigger mode), TIxFP1 is
      --  inverted (trigger operation in gated mode or encoder mode). CC1NP=1,
      --  CC1P=1:	non-inverted/both edges/ The circuit is sensitive to both
      --  TIxFP1 rising and falling edges (capture or trigger operations in
      --  reset, external clock or trigger mode), TIxFP1is not inverted
      --  (trigger operation in gated mode). This configuration must not be
      --  used in encoder mode. CC1NP=1, CC1P=0:	The configuration is reserved,
      --  it must not be used. Note: This bit is not writable as soon as LOCK
      --  level 2 or 3 has been programmed (LOCK bits in TIMx_BDTR register).
      --  Note: On channels having a complementary output, this bit is
      --  preloaded. If the CCPC bit is set in the TIMx_CR2 register then the
      --  CC1P active bit takes the new value from the preloaded bit only when
      --  a Commutation event is generated.
      CC1P           : Boolean := False;
      --  Capture/Compare 1 complementary output enable On channels having a
      --  complementary output, this bit is preloaded. If the CCPC bit is set
      --  in the TIMx_CR2 register then the CC1NE active bit takes the new
      --  value from the preloaded bit only when a Commutation event is
      --  generated.
      CC1NE          : Boolean := False;
      --  Capture/Compare 1 complementary output polarity CC1 channel
      --  configured as output: CC1 channel configured as input: This bit is
      --  used in conjunction with CC1P to define the polarity of TI1FP1 and
      --  TI2FP1. Refer to CC1P description. Note: This bit is not writable as
      --  soon as LOCK level 2 or 3 has been programmed (LOCK bits in TIMx_BDTR
      --  register) and CC1S=00 (channel configured as output). On channels
      --  having a complementary output, this bit is preloaded. If the CCPC bit
      --  is set in the TIMx_CR2 register then the CC1NP active bit takes the
      --  new value from the preloaded bit only when a Commutation event is
      --  generated.
      CC1NP          : Boolean := False;
      --  Capture/Compare 2 output enable Refer to CC1E description
      CC2E           : Boolean := False;
      --  Capture/Compare 2 output polarity Refer to CC1P description
      CC2P           : Boolean := False;
      --  Capture/Compare 2 complementary output enable Refer to CC1NE
      --  description
      CC2NE          : Boolean := False;
      --  Capture/Compare 2 complementary output polarity Refer to CC1NP
      --  description
      CC2NP          : Boolean := False;
      --  Capture/Compare 3 output enable Refer to CC1E description
      CC3E           : Boolean := False;
      --  Capture/Compare 3 output polarity Refer to CC1P description
      CC3P           : Boolean := False;
      --  Capture/Compare 3 complementary output enable Refer to CC1NE
      --  description
      CC3NE          : Boolean := False;
      --  Capture/Compare 3 complementary output polarity Refer to CC1NP
      --  description
      CC3NP          : Boolean := False;
      --  Capture/Compare 4 output enable Refer to CC1E description
      CC4E           : Boolean := False;
      --  Capture/Compare 4 output polarity Refer to CC1P description
      CC4P           : Boolean := False;
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      --  Capture/Compare 4 complementary output polarity Refer to CC1NP
      --  description
      CC4NP          : Boolean := False;
      --  Capture/Compare 5 output enable Refer to CC1E description
      CC5E           : Boolean := False;
      --  Capture/Compare 5 output polarity Refer to CC1P description
      CC5P           : Boolean := False;
      --  unspecified
      Reserved_18_19 : HAL.UInt2 := 16#0#;
      --  Capture/Compare 6 output enable Refer to CC1E description
      CC6E           : Boolean := False;
      --  Capture/Compare 6 output polarity Refer to CC1P description
      CC6P           : Boolean := False;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCER_Register use record
      CC1E           at 0 range 0 .. 0;
      CC1P           at 0 range 1 .. 1;
      CC1NE          at 0 range 2 .. 2;
      CC1NP          at 0 range 3 .. 3;
      CC2E           at 0 range 4 .. 4;
      CC2P           at 0 range 5 .. 5;
      CC2NE          at 0 range 6 .. 6;
      CC2NP          at 0 range 7 .. 7;
      CC3E           at 0 range 8 .. 8;
      CC3P           at 0 range 9 .. 9;
      CC3NE          at 0 range 10 .. 10;
      CC3NP          at 0 range 11 .. 11;
      CC4E           at 0 range 12 .. 12;
      CC4P           at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      CC4NP          at 0 range 15 .. 15;
      CC5E           at 0 range 16 .. 16;
      CC5P           at 0 range 17 .. 17;
      Reserved_18_19 at 0 range 18 .. 19;
      CC6E           at 0 range 20 .. 20;
      CC6P           at 0 range 21 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   subtype CNT_CNT_Field is HAL.UInt16;

   --  TIM1 counter
   type CNT_Register is record
      --  Counter value
      CNT            : CNT_CNT_Field := 16#0#;
      --  unspecified
      Reserved_16_30 : HAL.UInt15 := 16#0#;
      --  Read-only. UIF copy This bit is a read-only copy of the UIF bit of
      --  the TIMx_ISR register. If the UIFREMAP bit in the TIMxCR1 is reset,
      --  bit 31 is reserved and read at 0.
      UIFCPY         : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CNT_Register use record
      CNT            at 0 range 0 .. 15;
      Reserved_16_30 at 0 range 16 .. 30;
      UIFCPY         at 0 range 31 .. 31;
   end record;

   subtype BDTR_DTG_Field is HAL.UInt8;

   --  Lock configuration These bits offer a write protection against software
   --  errors. Note: The LOCK bits can be written only once after the reset.
   --  Once the TIMx_BDTR register has been written, their content is frozen
   --  until the next reset.
   type BDTR_LOCK_Field is
     (--  LOCK OFF - No bit is write protected.
      B_0x0,
      --  LOCK Level 1 = DTG bits in TIMx_BDTR register, OISx and OISxN bits in
--  TIMx_CR2 register and BK2BID, BKBID, BK2DSRM, BKDSRM, BK2P, BK2E,
--  BK2F[3:0], BKF[3:0], AOE, BKP, BKE, OSSI, OSSR and DTG[7:0] bits in
--  TIMx_BDTR register can no longer be written.
      B_0x1,
      --  LOCK Level 2 = LOCK Level 1 + CC Polarity bits (CCxP/CCxNP bits in
--  TIMx_CCER register, as long as the related channel is configured in output
--  through the CCxS bits) as well as OSSR and OSSI bits can no longer be
--  written.
      B_0x2,
      --  LOCK Level 3 = LOCK Level 2 + CC Control bits (OCxM and OCxPE bits in
--  TIMx_CCMRx registers, as long as the related channel is configured in
--  output through the CCxS bits) can no longer be written.
      B_0x3)
     with Size => 2;
   for BDTR_LOCK_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  Break filter This bit-field defines the frequency used to sample BRK
   --  input and the length of the digital filter applied to BRK. The digital
   --  filter is made of an event counter in which N consecutive events are
   --  needed to validate a transition on the output: Note: This bit cannot be
   --  modified when LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR
   --  register).
   type BDTR_BKF_Field is
     (--  No filter, BRK acts asynchronously
      B_0x0,
      --  fSAMPLING=fCK_INT, N=2
      B_0x1,
      --  fSAMPLING=fCK_INT, N=4
      B_0x2,
      --  fSAMPLING=fCK_INT, N=8
      B_0x3,
      --  fSAMPLING=fDTS/2, N=6
      B_0x4,
      --  fSAMPLING=fDTS/2, N=8
      B_0x5,
      --  fSAMPLING=fDTS/4, N=6
      B_0x6,
      --  fSAMPLING=fDTS/4, N=8
      B_0x7,
      --  fSAMPLING=fDTS/8, N=6
      B_0x8,
      --  fSAMPLING=fDTS/8, N=8
      B_0x9,
      --  fSAMPLING=fDTS/16, N=5
      B_0xA,
      --  fSAMPLING=fDTS/16, N=6
      B_0xB,
      --  fSAMPLING=fDTS/16, N=8
      B_0xC,
      --  fSAMPLING=fDTS/32, N=5
      B_0xD,
      --  fSAMPLING=fDTS/32, N=6
      B_0xE,
      --  fSAMPLING=fDTS/32, N=8
      B_0xF)
     with Size => 4;
   for BDTR_BKF_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7,
      B_0x8 => 8,
      B_0x9 => 9,
      B_0xA => 10,
      B_0xB => 11,
      B_0xC => 12,
      B_0xD => 13,
      B_0xE => 14,
      B_0xF => 15);

   --  Break 2 filter This bit-field defines the frequency used to sample BRK2
   --  input and the length of the digital filter applied to BRK2. The digital
   --  filter is made of an event counter in which N consecutive events are
   --  needed to validate a transition on the output: Note: This bit cannot be
   --  modified when LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR
   --  register).
   type BDTR_BK2F_Field is
     (--  No filter, BRK2 acts asynchronously
      B_0x0,
      --  fSAMPLING=fCK_INT, N=2
      B_0x1,
      --  fSAMPLING=fCK_INT, N=4
      B_0x2,
      --  fSAMPLING=fCK_INT, N=8
      B_0x3,
      --  fSAMPLING=fDTS/2, N=6
      B_0x4,
      --  fSAMPLING=fDTS/2, N=8
      B_0x5,
      --  fSAMPLING=fDTS/4, N=6
      B_0x6,
      --  fSAMPLING=fDTS/4, N=8
      B_0x7,
      --  fSAMPLING=fDTS/8, N=6
      B_0x8,
      --  fSAMPLING=fDTS/8, N=8
      B_0x9,
      --  fSAMPLING=fDTS/16, N=5
      B_0xA,
      --  fSAMPLING=fDTS/16, N=6
      B_0xB,
      --  fSAMPLING=fDTS/16, N=8
      B_0xC,
      --  fSAMPLING=fDTS/32, N=5
      B_0xD,
      --  fSAMPLING=fDTS/32, N=6
      B_0xE,
      --  fSAMPLING=fDTS/32, N=8
      B_0xF)
     with Size => 4;
   for BDTR_BK2F_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7,
      B_0x8 => 8,
      B_0x9 => 9,
      B_0xA => 10,
      B_0xB => 11,
      B_0xC => 12,
      B_0xD => 13,
      B_0xE => 14,
      B_0xF => 15);

   --  TIM1 break and dead-time register
   type BDTR_Register is record
      --  Dead-time generator setup
      DTG            : BDTR_DTG_Field := 16#0#;
      --  Lock configuration These bits offer a write protection against
      --  software errors. Note: The LOCK bits can be written only once after
      --  the reset. Once the TIMx_BDTR register has been written, their
      --  content is frozen until the next reset.
      LOCK           : BDTR_LOCK_Field := STM32_SVD.TIM.B_0x0;
      --  Off-state selection for Idle mode This bit is used when MOE=0 due to
      --  a break event or by a software write, on channels configured as
      --  outputs. See OC/OCN enable description for more details
      --  (Section122.4.11: TIM1 capture/compare enable register (TIM1_CCER)).
      --  Note: This bit can not be modified as soon as the LOCK level 2 has
      --  been programmed (LOCK bits in TIMx_BDTR register).
      OSSI           : Boolean := False;
      --  Off-state selection for Run mode This bit is used when MOE=1 on
      --  channels having a complementary output which are configured as
      --  outputs. OSSR is not implemented if no complementary output is
      --  implemented in the timer. See OC/OCN enable description for more
      --  details (Section122.4.11: TIM1 capture/compare enable register
      --  (TIM1_CCER)). Note: This bit can not be modified as soon as the LOCK
      --  level 2 has been programmed (LOCK bits in TIMx_BDTR register).
      OSSR           : Boolean := False;
      --  Break enable This bit enables the complete break protection
      --  (including all sources connected to bk_acth and BRK sources, as per
      --  Figure1152: Break and Break2 circuitry overview). Note: This bit
      --  cannot be modified when LOCK level 1 has been programmed (LOCK bits
      --  in TIMx_BDTR register). Note: Any write operation to this bit takes a
      --  delay of 1 APB clock cycle to become effective.
      BKE            : Boolean := False;
      --  Break polarity Note: This bit can not be modified as long as LOCK
      --  level 1 has been programmed (LOCK bits in TIMx_BDTR register). Note:
      --  Any write operation to this bit takes a delay of 1 APB clock cycle to
      --  become effective.
      BKP            : Boolean := False;
      --  Automatic output enable Note: This bit can not be modified as long as
      --  LOCK level 1 has been programmed (LOCK bits in TIMx_BDTR register).
      AOE            : Boolean := False;
      --  Main output enable This bit is cleared asynchronously by hardware as
      --  soon as one of the break inputs is active (BRK or BRK2). It is set by
      --  software or automatically depending on the AOE bit. It is acting only
      --  on the channels which are configured in output. In response to a
      --  break event or if MOE is written to 0: OC and OCN outputs are
      --  disabled or forced to idle state depending on the OSSI bit. See
      --  OC/OCN enable description for more details (Section122.4.11: TIM1
      --  capture/compare enable register (TIM1_CCER)).
      MOE            : Boolean := False;
      --  Break filter This bit-field defines the frequency used to sample BRK
      --  input and the length of the digital filter applied to BRK. The
      --  digital filter is made of an event counter in which N consecutive
      --  events are needed to validate a transition on the output: Note: This
      --  bit cannot be modified when LOCK level 1 has been programmed (LOCK
      --  bits in TIMx_BDTR register).
      BKF            : BDTR_BKF_Field := STM32_SVD.TIM.B_0x0;
      --  Break 2 filter This bit-field defines the frequency used to sample
      --  BRK2 input and the length of the digital filter applied to BRK2. The
      --  digital filter is made of an event counter in which N consecutive
      --  events are needed to validate a transition on the output: Note: This
      --  bit cannot be modified when LOCK level 1 has been programmed (LOCK
      --  bits in TIMx_BDTR register).
      BK2F           : BDTR_BK2F_Field := STM32_SVD.TIM.B_0x0;
      --  Break 2 enable Note: The BRK2 must only be used with OSSR = OSSI = 1.
      --  Note: This bit cannot be modified when LOCK level 1 has been
      --  programmed (LOCK bits in TIMx_BDTR register). Note: Any write
      --  operation to this bit takes a delay of 1 APB clock cycle to become
      --  effective.
      BK2E           : Boolean := False;
      --  Break 2 polarity Note: This bit cannot be modified as long as LOCK
      --  level 1 has been programmed (LOCK bits in TIMx_BDTR register). Note:
      --  Any write operation to this bit takes a delay of 1 APB clock cycle to
      --  become effective.
      BK2P           : Boolean := False;
      --  Break Disarm This bit is cleared by hardware when no break source is
      --  active. The BKDSRM bit must be set by software to release the
      --  bidirectional output control (open-drain output in Hi-Z state) and
      --  then be polled it until it is reset by hardware, indicating that the
      --  fault condition has disappeared. Note: Any write operation to this
      --  bit takes a delay of 1 APB clock cycle to become effective.
      BKDSRM         : Boolean := False;
      --  Break2 Disarm Refer to BKDSRM description
      BK2DSRM        : Boolean := False;
      --  Break Bidirectional In the bidirectional mode (BKBID bit set to 1),
      --  the break input is configured both in input mode and in open drain
      --  output mode. Any active break event asserts a low logic level on the
      --  Break input to indicate an internal break event to external devices.
      --  Note: This bit cannot be modified as long as LOCK level 1 has been
      --  programmed (LOCK bits in TIMx_BDTR register). Note: Any write
      --  operation to this bit takes a delay of 1 APB clock cycle to become
      --  effective.
      BKBID          : Boolean := False;
      --  Break2 bidirectional Refer to BKBID description
      BK2BID         : Boolean := False;
      --  unspecified
      Reserved_30_31 : HAL.UInt2 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BDTR_Register use record
      DTG            at 0 range 0 .. 7;
      LOCK           at 0 range 8 .. 9;
      OSSI           at 0 range 10 .. 10;
      OSSR           at 0 range 11 .. 11;
      BKE            at 0 range 12 .. 12;
      BKP            at 0 range 13 .. 13;
      AOE            at 0 range 14 .. 14;
      MOE            at 0 range 15 .. 15;
      BKF            at 0 range 16 .. 19;
      BK2F           at 0 range 20 .. 23;
      BK2E           at 0 range 24 .. 24;
      BK2P           at 0 range 25 .. 25;
      BKDSRM         at 0 range 26 .. 26;
      BK2DSRM        at 0 range 27 .. 27;
      BKBID          at 0 range 28 .. 28;
      BK2BID         at 0 range 29 .. 29;
      Reserved_30_31 at 0 range 30 .. 31;
   end record;

   --  DMA base address This 5-bits vector defines the base-address for DMA
   --  transfers (when read/write access are done through the TIMx_DMAR
   --  address). DBA is defined as an offset starting from the address of the
   --  TIMx_CR1 register. Example: ...
   type DCR_DBA_Field is
     (--  TIMx_CR1,
      B_0x0,
      --  TIMx_CR2,
      B_0x1,
      --  TIMx_SMCR,
      B_0x2)
     with Size => 5;
   for DCR_DBA_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2);

   --  DMA burst length This 5-bit vector defines the length of DMA transfers
   --  (the timer recognizes a burst transfer when a read or a write access is
   --  done to the TIMx_DMAR address), i.e. the number of transfers. Transfers
   --  can be in half-words or in bytes (see example below). ... Example: Let
   --  us consider the following transfer: DBL = 7 bytes & DBA = TIMx_CR1. If
   --  DBL = 7 bytes and DBA = TIMx_CR1 represents the address of the byte to
   --  be transferred, the address of the transfer should be given by the
   --  following equation: (TIMx_CR1 address) + DBA + (DMA index), where DMA
   --  index = DBL In this example, 7 bytes are added to (TIMx_CR1 address) +
   --  DBA, which gives us the address from/to which the data is copied. In
   --  this case, the transfer is done to 7 registers starting from the
   --  following address: (TIMx_CR1 address) + DBA According to the
   --  configuration of the DMA Data Size, several cases may occur: If the DMA
   --  Data Size is configured in half-words, 16-bit data is transferred to
   --  each of the 7 registers. If the DMA Data Size is configured in bytes,
   --  the data is also transferred to 7 registers: the first register contains
   --  the first MSB byte, the second register, the first LSB byte and so on.
   --  So with the transfer Timer, one also has to specify the size of data
   --  transferred by DMA.
   type DCR_DBL_Field is
     (--  1 transfer
      B_0x0,
      --  2 transfers
      B_0x1,
      --  3 transfers
      B_0x2,
      --  18 transfers
      B_0x11)
     with Size => 5;
   for DCR_DBL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x11 => 17);

   --  TIM1 DMA control register
   type DCR_Register is record
      --  DMA base address This 5-bits vector defines the base-address for DMA
      --  transfers (when read/write access are done through the TIMx_DMAR
      --  address). DBA is defined as an offset starting from the address of
      --  the TIMx_CR1 register. Example: ...
      DBA            : DCR_DBA_Field := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_5_7   : HAL.UInt3 := 16#0#;
      --  DMA burst length This 5-bit vector defines the length of DMA
      --  transfers (the timer recognizes a burst transfer when a read or a
      --  write access is done to the TIMx_DMAR address), i.e. the number of
      --  transfers. Transfers can be in half-words or in bytes (see example
      --  below). ... Example: Let us consider the following transfer: DBL = 7
      --  bytes & DBA = TIMx_CR1. If DBL = 7 bytes and DBA = TIMx_CR1
      --  represents the address of the byte to be transferred, the address of
      --  the transfer should be given by the following equation: (TIMx_CR1
      --  address) + DBA + (DMA index), where DMA index = DBL In this example,
      --  7 bytes are added to (TIMx_CR1 address) + DBA, which gives us the
      --  address from/to which the data is copied. In this case, the transfer
      --  is done to 7 registers starting from the following address: (TIMx_CR1
      --  address) + DBA According to the configuration of the DMA Data Size,
      --  several cases may occur: If the DMA Data Size is configured in
      --  half-words, 16-bit data is transferred to each of the 7 registers. If
      --  the DMA Data Size is configured in bytes, the data is also
      --  transferred to 7 registers: the first register contains the first MSB
      --  byte, the second register, the first LSB byte and so on. So with the
      --  transfer Timer, one also has to specify the size of data transferred
      --  by DMA.
      DBL            : DCR_DBL_Field := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DCR_Register use record
      DBA            at 0 range 0 .. 4;
      Reserved_5_7   at 0 range 5 .. 7;
      DBL            at 0 range 8 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
   end record;

   subtype OR1_OCREF_CLR_Field is HAL.UInt2;

   --  TIM1 option register 1
   type OR1_Register is record
      --  Ocref_clr source selection This bit selects the ocref_clr input
      --  source. Others: Reserved Note: COMP3 is available on STM32G0B1xx and
      --  STM32G0C1xx salestypes only.
      OCREF_CLR     : OR1_OCREF_CLR_Field := 16#0#;
      --  unspecified
      Reserved_2_31 : HAL.UInt30 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for OR1_Register use record
      OCREF_CLR     at 0 range 0 .. 1;
      Reserved_2_31 at 0 range 2 .. 31;
   end record;

   subtype CCMR3_OC5M_Field is HAL.UInt3;
   subtype CCMR3_OC6M_Field is HAL.UInt3;

   --  TIM1 capture/compare mode register 3
   type CCMR3_Register is record
      --  unspecified
      Reserved_0_1   : HAL.UInt2 := 16#0#;
      --  Output compare 5 fast enable Refer to OC1FE description.
      OC5FE          : Boolean := False;
      --  Output compare 5 preload enable Refer to OC1PE description.
      OC5PE          : Boolean := False;
      --  OC5M[0]: Output compare 5 mode Refer to OC1M description.
      OC5M           : CCMR3_OC5M_Field := 16#0#;
      --  Output compare 5 clear enable Refer to OC1CE description.
      OC5CE          : Boolean := False;
      --  unspecified
      Reserved_8_9   : HAL.UInt2 := 16#0#;
      --  Output compare 6 fast enable Refer to OC1FE description.
      OC6FE          : Boolean := False;
      --  Output compare 6 preload enable Refer to OC1PE description.
      OC6PE          : Boolean := False;
      --  OC6M[0]: Output compare 6 mode Refer to OC1M description.
      OC6M           : CCMR3_OC6M_Field := 16#0#;
      --  Output compare 6 clear enable Refer to OC1CE description.
      OC6CE          : Boolean := False;
      --  OC5M[3]
      OC5M_1         : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  OC6M[3]
      OC6M_1         : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR3_Register use record
      Reserved_0_1   at 0 range 0 .. 1;
      OC5FE          at 0 range 2 .. 2;
      OC5PE          at 0 range 3 .. 3;
      OC5M           at 0 range 4 .. 6;
      OC5CE          at 0 range 7 .. 7;
      Reserved_8_9   at 0 range 8 .. 9;
      OC6FE          at 0 range 10 .. 10;
      OC6PE          at 0 range 11 .. 11;
      OC6M           at 0 range 12 .. 14;
      OC6CE          at 0 range 15 .. 15;
      OC5M_1         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC6M_1         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   subtype CCR5_CCR5_Field is HAL.UInt16;

   --  CCR5_GC5C array
   type CCR5_GC5C_Field_Array is array (1 .. 3) of Boolean
     with Component_Size => 1, Size => 3;

   --  Type definition for CCR5_GC5C
   type CCR5_GC5C_Field
   is record
            Arr : CCR5_GC5C_Field_Array;
   end record
     with Size => 3;

   for CCR5_GC5C_Field use record
      Arr at 0 range 0 .. 2;
   end record;

   --  TIM1 capture/compare register 5
   type CCR5_Register is record
      --  Capture/Compare 5 value CCR5 is the value to be loaded in the actual
      --  capture/compare 5 register (preload value). It is loaded permanently
      --  if the preload feature is not selected in the TIMx_CCMR3 register
      --  (bit OC5PE). Else the preload value is copied in the active
      --  capture/compare 5 register when an update event occurs. The active
      --  capture/compare register contains the value to be compared to the
      --  counter TIMx_CNT and signaled on OC5 output.
      CCR5           : CCR5_CCR5_Field := 16#0#;
      --  unspecified
      Reserved_16_28 : HAL.UInt13 := 16#0#;
      --  Group Channel 5 and Channel 1 Distortion on Channel 1 output: This
      --  bit can either have immediate effect or be preloaded and taken into
      --  account after an update event (if preload feature is selected in
      --  TIMxCCMR1). Note: it is also possible to apply this distortion on
      --  combined PWM signals.
      GC5C           : CCR5_GC5C_Field;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCR5_Register use record
      CCR5           at 0 range 0 .. 15;
      Reserved_16_28 at 0 range 16 .. 28;
      GC5C           at 0 range 29 .. 31;
   end record;

   --  ETR source selection These bits select the ETR input source. Others:
   --  Reserved Note: These bits can not be modified as long as LOCK level 1
   --  has been programmed (LOCK bits in TIMx_BDTR register).
   type AF1_ETRSEL_Field is
     (--  ETR legacy mode
      B_0x0,
      --  COMP1 output
      B_0x1,
      --  COMP2 output
      B_0x2,
      --  ADC1 AWD1
      B_0x3,
      --  ADC1 AWD2
      B_0x4,
      --  ADC1 AWD3
      B_0x5,
      --  COMP3 output (available on STM32G0B1xx and STM32G0C1xx salestypes only)
      B_0x6)
     with Size => 4;
   for AF1_ETRSEL_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6);

   --  TIM1 alternate function option register 1
   type AF1_Register is record
      --  BRK BKIN input enable This bit enables the BKIN alternate function
      --  input for the timers BRK input. BKIN input is ORed with the other BRK
      --  sources. Note: This bit can not be modified as long as LOCK level 1
      --  has been programmed (LOCK bits in TIMx_BDTR register).
      BKINE          : Boolean := True;
      --  BRK COMP1 enable This bit enables the COMP1 for the timers BRK input.
      --  COMP1 output is ORed with the other BRK sources. Note: This bit can
      --  not be modified as long as LOCK level 1 has been programmed (LOCK
      --  bits in TIMx_BDTR register).
      BKCMP1E        : Boolean := False;
      --  BRK COMP2 enable This bit enables the COMP2 for the timers BRK input.
      --  COMP2 output is ORed with the other BRK sources. Note: This bit can
      --  not be modified as long as LOCK level 1 has been programmed (LOCK
      --  bits in TIMx_BDTR register).
      BKCMP2E        : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      --  BRK BKIN input polarity This bit selects the BKIN alternate function
      --  input sensitivity. It must be programmed together with the BKP
      --  polarity bit. Note: This bit can not be modified as long as LOCK
      --  level 1 has been programmed (LOCK bits in TIMx_BDTR register).
      BKINP          : Boolean := False;
      --  BRK COMP1 input polarity This bit selects the COMP1 input
      --  sensitivity. It must be programmed together with the BKP polarity
      --  bit. Note: This bit can not be modified as long as LOCK level 1 has
      --  been programmed (LOCK bits in TIMx_BDTR register).
      BKCMP1P        : Boolean := False;
      --  BRK COMP2 input polarity This bit selects the COMP2 input
      --  sensitivity. It must be programmed together with the BKP polarity
      --  bit. Note: This bit can not be modified as long as LOCK level 1 has
      --  been programmed (LOCK bits in TIMx_BDTR register).
      BKCMP2P        : Boolean := False;
      --  unspecified
      Reserved_12_13 : HAL.UInt2 := 16#0#;
      --  ETR source selection These bits select the ETR input source. Others:
      --  Reserved Note: These bits can not be modified as long as LOCK level 1
      --  has been programmed (LOCK bits in TIMx_BDTR register).
      ETRSEL         : AF1_ETRSEL_Field := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF1_Register use record
      BKINE          at 0 range 0 .. 0;
      BKCMP1E        at 0 range 1 .. 1;
      BKCMP2E        at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      BKINP          at 0 range 9 .. 9;
      BKCMP1P        at 0 range 10 .. 10;
      BKCMP2P        at 0 range 11 .. 11;
      Reserved_12_13 at 0 range 12 .. 13;
      ETRSEL         at 0 range 14 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  TIM1 Alternate function register 2
   type AF2_Register is record
      --  BRK2 BKIN input enable This bit enables the BKIN2 alternate function
      --  input for the timers BRK2 input. BKIN2 input is ORed with the other
      --  BRK2 sources. Note: This bit can not be modified as long as LOCK
      --  level 1 has been programmed (LOCK bits in TIMx_BDTR register).
      BK2INE         : Boolean := True;
      --  BRK2 COMP1 enable This bit enables the COMP1 for the timers BRK2
      --  input. COMP1 output is ORed with the other BRK2 sources. Note: This
      --  bit can not be modified as long as LOCK level 1 has been programmed
      --  (LOCK bits in TIMx_BDTR register).
      BK2CMP1E       : Boolean := False;
      --  BRK2 COMP2 enable This bit enables the COMP2 for the timers BRK2
      --  input. COMP2 output is ORed with the other BRK2 sources. Note: This
      --  bit can not be modified as long as LOCK level 1 has been programmed
      --  (LOCK bits in TIMx_BDTR register).
      BK2CMP2E       : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      --  BRK2 BKIN2 input polarity This bit selects the BKIN2 alternate
      --  function input sensitivity. It must be programmed together with the
      --  BK2P polarity bit. Note: This bit can not be modified as long as LOCK
      --  level 1 has been programmed (LOCK bits in TIMx_BDTR register).
      BK2INP         : Boolean := False;
      --  BRK2 COMP1 input polarity This bit selects the COMP1 input
      --  sensitivity. It must be programmed together with the BK2P polarity
      --  bit. Note: This bit can not be modified as long as LOCK level 1 has
      --  been programmed (LOCK bits in TIMx_BDTR register).
      BK2CMP1P       : Boolean := False;
      --  BRK2 COMP2 input polarity This bit selects the COMP2 input
      --  sensitivity. It must be programmed together with the BK2P polarity
      --  bit. Note: This bit can not be modified as long as LOCK level 1 has
      --  been programmed (LOCK bits in TIMx_BDTR register).
      BK2CMP2P       : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF2_Register use record
      BK2INE         at 0 range 0 .. 0;
      BK2CMP1E       at 0 range 1 .. 1;
      BK2CMP2E       at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      BK2INP         at 0 range 9 .. 9;
      BK2CMP1P       at 0 range 10 .. 10;
      BK2CMP2P       at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   subtype TISEL_TI1SEL_Field is HAL.UInt4;
   subtype TISEL_TI2SEL_Field is HAL.UInt4;
   subtype TISEL_TI3SEL_Field is HAL.UInt4;
   subtype TISEL_TI4SEL_Field is HAL.UInt4;

   --  TIM1 timer input selection register
   type TISEL_Register is record
      --  selects TI1[0] to TI1[15] input Others: Reserved
      TI1SEL         : TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  selects TI2[0] to TI2[15] input Others: Reserved
      TI2SEL         : TISEL_TI2SEL_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  selects TI3[0] to TI3[15] input Others: Reserved
      TI3SEL         : TISEL_TI3SEL_Field := 16#0#;
      --  unspecified
      Reserved_20_23 : HAL.UInt4 := 16#0#;
      --  selects TI4[0] to TI4[15] input Others: Reserved
      TI4SEL         : TISEL_TI4SEL_Field := 16#0#;
      --  unspecified
      Reserved_28_31 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TISEL_Register use record
      TI1SEL         at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      TI2SEL         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TI3SEL         at 0 range 16 .. 19;
      Reserved_20_23 at 0 range 20 .. 23;
      TI4SEL         at 0 range 24 .. 27;
      Reserved_28_31 at 0 range 28 .. 31;
   end record;

   --  TIM2 control register 2
   type CR2_Register_1 is record
      --  unspecified
      Reserved_0_2  : HAL.UInt3 := 16#0#;
      --  Capture/compare DMA selection
      CCDS          : Boolean := False;
      --  Master mode selection 	
      MMS           : CR2_MMS_Field := STM32_SVD.TIM.Reset;
      --  TI1 selection
      TI1S          : Boolean := False;
      --  unspecified
      Reserved_8_15 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_1 use record
      Reserved_0_2  at 0 range 0 .. 2;
      CCDS          at 0 range 3 .. 3;
      MMS           at 0 range 4 .. 6;
      TI1S          at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   subtype SMCR_TS_2_0_Field_1 is HAL.UInt3;
   subtype SMCR_TS_4_3_Field is HAL.UInt2;

   --  TIM2 slave mode control register
   type SMCR_Register_1 is record
      --  SMS[2:0]: Slave mode selection 	
      SMS_2_0        : SMCR_SMS_2_0_Field := 16#0#;
      --  OCREF clear selection 	
      OCCS           : Boolean := False;
      --  TIM2 TS[2:0]: Trigger selection 	
      TS_2_0         : SMCR_TS_2_0_Field_1 := 16#0#;
      --  Master/Slave mode
      MSM            : Boolean := False;
      --  External trigger filter 	
      ETF            : SMCR_ETF_Field := STM32_SVD.TIM.No_Filter;
      --  External trigger prescaler 	
      ETPS           : SMCR_ETPS_Field := STM32_SVD.TIM.Off;
      --  External clock enable 	
      ECE            : Boolean := False;
      --  External trigger polarity 	
      ETP            : Boolean := False;
      --  SMS[3]
      SMS_2_0_1      : Boolean := False;
      --  unspecified
      Reserved_17_19 : HAL.UInt3 := 16#0#;
      --  TIM2 TS[4:3]
      TS_4_3         : SMCR_TS_4_3_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register_1 use record
      SMS_2_0        at 0 range 0 .. 2;
      OCCS           at 0 range 3 .. 3;
      TS_2_0         at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      ETF            at 0 range 8 .. 11;
      ETPS           at 0 range 12 .. 13;
      ECE            at 0 range 14 .. 14;
      ETP            at 0 range 15 .. 15;
      SMS_2_0_1      at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      TS_4_3         at 0 range 20 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  TIM2 DMA/Interrupt enable register
   type DIER_Register_1 is record
      --  Update interrupt enable
      UIE            : Boolean := False;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : Boolean := False;
      --  Capture/Compare 2 interrupt enable
      CC2IE          : Boolean := False;
      --  Capture/Compare 3 interrupt enable
      CC3IE          : Boolean := False;
      --  Capture/Compare 4 interrupt enable
      CC4IE          : Boolean := False;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  Trigger interrupt enable
      TIE            : Boolean := False;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Update DMA request enable
      UDE            : Boolean := False;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : Boolean := False;
      --  Capture/Compare 2 DMA request enable
      CC2DE          : Boolean := False;
      --  Capture/Compare 3 DMA request enable
      CC3DE          : Boolean := False;
      --  Capture/Compare 4 DMA request enable
      CC4DE          : Boolean := False;
      --  unspecified
      Reserved_13_13 : HAL.Bit := 16#0#;
      --  Trigger DMA request enable
      TDE            : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_1 use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      CC3IE          at 0 range 3 .. 3;
      CC4IE          at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      CC2DE          at 0 range 10 .. 10;
      CC3DE          at 0 range 11 .. 11;
      CC4DE          at 0 range 12 .. 12;
      Reserved_13_13 at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   --  TIM2 status register
   type SR_Register_1 is record
      --  Update interrupt flag 	
      UIF            : Boolean := False;
      --  Capture/compare 1 interrupt flag 	
      CC1IF          : Boolean := False;
      --  Capture/Compare 2 interrupt flag 	
      CC2IF          : Boolean := False;
      --  Capture/Compare 3 interrupt flag 	
      CC3IF          : Boolean := False;
      --  Capture/Compare 4 interrupt flag 	
      CC4IF          : Boolean := False;
      --  unspecified
      Reserved_5_5   : HAL.Bit := 16#0#;
      --  Trigger interrupt flag 	
      TIF            : Boolean := False;
      --  unspecified
      Reserved_7_8   : HAL.UInt2 := 16#0#;
      --  Capture/Compare 1 overcapture flag 	
      CC1OF          : Boolean := False;
      --  Capture/compare 2 overcapture flag 	
      CC2OF          : Boolean := False;
      --  Capture/Compare 3 overcapture flag 	
      CC3OF          : Boolean := False;
      --  Capture/Compare 4 overcapture flag 	
      CC4OF          : Boolean := False;
      --  unspecified
      Reserved_13_15 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SR_Register_1 use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      CC3IF          at 0 range 3 .. 3;
      CC4IF          at 0 range 4 .. 4;
      Reserved_5_5   at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      Reserved_7_8   at 0 range 7 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      CC3OF          at 0 range 11 .. 11;
      CC4OF          at 0 range 12 .. 12;
      Reserved_13_15 at 0 range 13 .. 15;
   end record;

   --  TIM2 event generation register
   type EGR_Register_1 is record
      --  Write-only. Update generation 	
      UG            : Boolean := False;
      --  Write-only. Capture/compare 1 generation 	
      CC1G          : Boolean := False;
      --  Write-only. Capture/compare 2 generation 	
      CC2G          : Boolean := False;
      --  Write-only. Capture/compare 3 generation 	
      CC3G          : Boolean := False;
      --  Write-only. Capture/compare 4 generation 	
      CC4G          : Boolean := False;
      --  unspecified
      Reserved_5_5  : HAL.Bit := 16#0#;
      --  Write-only. Trigger generation 	
      TG            : Boolean := False;
      --  unspecified
      Reserved_7_15 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_1 use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      CC3G          at 0 range 3 .. 3;
      CC4G          at 0 range 4 .. 4;
      Reserved_5_5  at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      Reserved_7_15 at 0 range 7 .. 15;
   end record;

   --  Capture/Compare 1 selection 	
   type CCMR1_CC1S_Field is
     (--  CC1 channel is configured as output
      B_0x0,
      --  CC1 channel is configured as input, IC1 is mapped on TI1
      B_0x1,
      --  CC1 channel is configured as input, IC1 is mapped on TI2
      B_0x2,
      --  CC1 channel is configured as input, IC1 is mapped on TRC.
      B_0x3)
     with Size => 2;
   for CCMR1_CC1S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  Input capture 1 prescaler 	
   type CCMR1_IC1PSC_Field is
     (--  no prescaler, capture is done each time an edge is detected on the capture
--  input
      B_0x0,
      --  capture is done once every 2 events
      B_0x1,
      --  capture is done once every 4 events
      B_0x2,
      --  capture is done once every 8 events
      B_0x3)
     with Size => 2;
   for CCMR1_IC1PSC_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  Input capture 1 filter 	
   type CCMR1_IC1F_Field is
     (--  No filter, sampling is done at f		less thansub>DTSless than/sub>
      B_0x0,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>CK_INTless than/sub>,
--  N=2
      B_0x1,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>CK_INTless than/sub>,
--  N=4
      B_0x2,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>CK_INTless than/sub>,
--  N=8
      B_0x3,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/2, N=6
      B_0x4,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/2, N=8
      B_0x5,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/4, N=6
      B_0x6,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/4, N=8
      B_0x7,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/8, N=6
      B_0x8,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/8, N=8
      B_0x9,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/16,
--  N=5
      B_0xA,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/16,
--  N=6
      B_0xB,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/16,
--  N=8
      B_0xC,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/32,
--  N=5
      B_0xD,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/32,
--  N=6
      B_0xE,
      --  fless thansub>SAMPLINGless than/sub>=fless thansub>DTSless than/sub>/32,
--  N=8
      B_0xF)
     with Size => 4;
   for CCMR1_IC1F_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7,
      B_0x8 => 8,
      B_0x9 => 9,
      B_0xA => 10,
      B_0xB => 11,
      B_0xC => 12,
      B_0xD => 13,
      B_0xE => 14,
      B_0xF => 15);

   --  Capture/compare 2 selection 	
   type CCMR1_CC2S_Field is
     (--  CC2 channel is configured as output.
      B_0x0,
      --  CC2 channel is configured as input, IC2 is mapped on TI2.
      B_0x1,
      --  CC2 channel is configured as input, IC2 is mapped on TI1.
      B_0x2,
      --  CC2 channel is configured as input, IC2 is mapped on TRC.
      B_0x3)
     with Size => 2;
   for CCMR1_CC2S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR1_IC2PSC_Field is HAL.UInt2;
   subtype CCMR1_IC2F_Field is HAL.UInt4;

   --  TIM2 capture/compare mode register 1
   type CCMR1_Register is record
      --  Capture/Compare 1 selection 	
      CC1S           : CCMR1_CC1S_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 1 prescaler 	
      IC1PSC         : CCMR1_IC1PSC_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 1 filter 	
      IC1F           : CCMR1_IC1F_Field := STM32_SVD.TIM.B_0x0;
      --  Capture/compare 2 selection 	
      CC2S           : CCMR1_CC2S_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 2 prescaler
      IC2PSC         : CCMR1_IC2PSC_Field := 16#0#;
      --  Input capture 2 filter
      IC2F           : CCMR1_IC2F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Register use record
      CC1S           at 0 range 0 .. 1;
      IC1PSC         at 0 range 2 .. 3;
      IC1F           at 0 range 4 .. 7;
      CC2S           at 0 range 8 .. 9;
      IC2PSC         at 0 range 10 .. 11;
      IC2F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Capture/Compare 1 selection 	
   type CCMR1_ALTERNATE1_CC1S_Field is
     (--  CC1 channel is configured as output.
      B_0x0,
      --  CC1 channel is configured as input, IC1 is mapped on TI1.
      B_0x1,
      --  CC1 channel is configured as input, IC1 is mapped on TI2.
      B_0x2,
      --  CC1 channel is configured as input, IC1 is mapped on TRC.
      B_0x3)
     with Size => 2;
   for CCMR1_ALTERNATE1_CC1S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   --  OC1M[2:0]: Output compare 1 mode 	
   type CCMR1_ALTERNATE1_OC1M_Field is
     (--  Frozen - The comparison between the output compare register TIMx_CCR1 and
--  the counter TIMx_CNT has no effect on the outputs.
      B_0x0,
      --  Set channel 1 to active level on match.
      B_0x1,
      --  Set channel 1 to inactive level on match.
      B_0x2,
      --  Toggle - OC1REF toggles when TIMx_CNT=TIMx_CCR1.
      B_0x3,
      --  Force inactive level - OC1REF is forced low.
      B_0x4,
      --  Force active level - OC1REF is forced high.
      B_0x5,
      --  PWM mode 1 - In upcounting, channel 1 is active as long as TIMx_CNTless
--  thanTIMx_CCR1 else inactive.
      B_0x6,
      --  PWM mode 2 - In upcounting, channel 1 is inactive as long as TIMx_CNTless
--  thanTIMx_CCR1 else active.
      B_0x7)
     with Size => 3;
   for CCMR1_ALTERNATE1_OC1M_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5,
      B_0x6 => 6,
      B_0x7 => 7);

   --  Capture/Compare 2 selection 	
   type CCMR1_ALTERNATE1_CC2S_Field is
     (--  CC2 channel is configured as output
      B_0x0,
      --  CC2 channel is configured as input, IC2 is mapped on TI2
      B_0x1,
      --  CC2 channel is configured as input, IC2 is mapped on TI1
      B_0x2,
      --  CC2 channel is configured as input, IC2 is mapped on TRC.
      B_0x3)
     with Size => 2;
   for CCMR1_ALTERNATE1_CC2S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR1_ALTERNATE1_OC2M_Field is HAL.UInt3;

   --  TIM2 capture/compare mode register 1
   type CCMR1_ALTERNATE1_Register is record
      --  Capture/Compare 1 selection 	
      CC1S           : CCMR1_ALTERNATE1_CC1S_Field := STM32_SVD.TIM.B_0x0;
      --  Output compare 1 fast enable 	
      OC1FE          : Boolean := False;
      --  Output compare 1 preload enable
      OC1PE          : Boolean := False;
      --  OC1M[2:0]: Output compare 1 mode 	
      OC1M           : CCMR1_ALTERNATE1_OC1M_Field := STM32_SVD.TIM.B_0x0;
      --  Output compare 1 clear enable
      OC1CE          : Boolean := False;
      --  Capture/Compare 2 selection 	
      CC2S           : CCMR1_ALTERNATE1_CC2S_Field := STM32_SVD.TIM.B_0x0;
      --  Output compare 2 fast enable
      OC2FE          : Boolean := False;
      --  Output compare 2 preload enable
      OC2PE          : Boolean := False;
      --  OC2M[2:0]: Output compare 2 mode 	
      OC2M           : CCMR1_ALTERNATE1_OC2M_Field := 16#0#;
      --  Output compare 2 clear enable
      OC2CE          : Boolean := False;
      --  OC1M[3]
      OC1M_1         : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  OC2M[3]
      OC2M_1         : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_ALTERNATE1_Register use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      OC1CE          at 0 range 7 .. 7;
      CC2S           at 0 range 8 .. 9;
      OC2FE          at 0 range 10 .. 10;
      OC2PE          at 0 range 11 .. 11;
      OC2M           at 0 range 12 .. 14;
      OC2CE          at 0 range 15 .. 15;
      OC1M_1         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC2M_1         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  Capture/Compare 3 selection 	
   type CCMR2_CC3S_Field is
     (--  CC3 channel is configured as output
      B_0x0,
      --  CC3 channel is configured as input, IC3 is mapped on TI3
      B_0x1,
      --  CC3 channel is configured as input, IC3 is mapped on TI4
      B_0x2,
      --  CC3 channel is configured as input, IC3 is mapped on TRC.
      B_0x3)
     with Size => 2;
   for CCMR2_CC3S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR2_IC3PSC_Field is HAL.UInt2;
   subtype CCMR2_IC3F_Field is HAL.UInt4;

   --  Capture/Compare 4 selection 	
   type CCMR2_CC4S_Field is
     (--  CC4 channel is configured as output
      B_0x0,
      --  CC4 channel is configured as input, IC4 is mapped on TI4
      B_0x1,
      --  CC4 channel is configured as input, IC4 is mapped on TI3
      B_0x2,
      --  CC4 channel is configured as input, IC4 is mapped on TRC.
      B_0x3)
     with Size => 2;
   for CCMR2_CC4S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR2_IC4PSC_Field is HAL.UInt2;
   subtype CCMR2_IC4F_Field is HAL.UInt4;

   --  TIM2 capture/compare mode register 2
   type CCMR2_Register is record
      --  Capture/Compare 3 selection 	
      CC3S           : CCMR2_CC3S_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 3 prescaler
      IC3PSC         : CCMR2_IC3PSC_Field := 16#0#;
      --  Input capture 3 filter
      IC3F           : CCMR2_IC3F_Field := 16#0#;
      --  Capture/Compare 4 selection 	
      CC4S           : CCMR2_CC4S_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 4 prescaler
      IC4PSC         : CCMR2_IC4PSC_Field := 16#0#;
      --  Input capture 4 filter
      IC4F           : CCMR2_IC4F_Field := 16#0#;
      --  unspecified
      Reserved_16_31 : HAL.UInt16 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_Register use record
      CC3S           at 0 range 0 .. 1;
      IC3PSC         at 0 range 2 .. 3;
      IC3F           at 0 range 4 .. 7;
      CC4S           at 0 range 8 .. 9;
      IC4PSC         at 0 range 10 .. 11;
      IC4F           at 0 range 12 .. 15;
      Reserved_16_31 at 0 range 16 .. 31;
   end record;

   --  Capture/Compare 3 selection 	
   type CCMR2_ALTERNATE1_CC3S_Field is
     (--  CC3 channel is configured as output
      B_0x0,
      --  CC3 channel is configured as input, IC3 is mapped on TI3
      B_0x1,
      --  CC3 channel is configured as input, IC3 is mapped on TI4
      B_0x2,
      --  CC3 channel is configured as input, IC3 is mapped on TRC.
      B_0x3)
     with Size => 2;
   for CCMR2_ALTERNATE1_CC3S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR2_ALTERNATE1_OC3M_Field is HAL.UInt3;

   --  Capture/Compare 4 selection 	
   type CCMR2_ALTERNATE1_CC4S_Field is
     (--  CC4 channel is configured as output
      B_0x0,
      --  CC4 channel is configured as input, IC4 is mapped on TI4
      B_0x1,
      --  CC4 channel is configured as input, IC4 is mapped on TI3
      B_0x2,
      --  CC4 channel is configured as input, IC4 is mapped on TRC.
      B_0x3)
     with Size => 2;
   for CCMR2_ALTERNATE1_CC4S_Field use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3);

   subtype CCMR2_ALTERNATE1_OC4M_Field is HAL.UInt3;

   --  TIM2 capture/compare mode register 2
   type CCMR2_ALTERNATE1_Register is record
      --  Capture/Compare 3 selection 	
      CC3S           : CCMR2_ALTERNATE1_CC3S_Field := STM32_SVD.TIM.B_0x0;
      --  Output compare 3 fast enable
      OC3FE          : Boolean := False;
      --  Output compare 3 preload enable
      OC3PE          : Boolean := False;
      --  OC3M[2:0]: Output compare 3 mode 	
      OC3M           : CCMR2_ALTERNATE1_OC3M_Field := 16#0#;
      --  Output compare 3 clear enable
      OC3CE          : Boolean := False;
      --  Capture/Compare 4 selection 	
      CC4S           : CCMR2_ALTERNATE1_CC4S_Field := STM32_SVD.TIM.B_0x0;
      --  Output compare 4 fast enable
      OC4FE          : Boolean := False;
      --  Output compare 4 preload enable
      OC4PE          : Boolean := False;
      --  OC4M[2:0]: Output compare 4 mode 	
      OC4M           : CCMR2_ALTERNATE1_OC4M_Field := 16#0#;
      --  Output compare 4 clear enable
      OC4CE          : Boolean := False;
      --  OC3M[3]
      OC3M_1         : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  OC4M[3]
      OC4M_1         : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR2_ALTERNATE1_Register use record
      CC3S           at 0 range 0 .. 1;
      OC3FE          at 0 range 2 .. 2;
      OC3PE          at 0 range 3 .. 3;
      OC3M           at 0 range 4 .. 6;
      OC3CE          at 0 range 7 .. 7;
      CC4S           at 0 range 8 .. 9;
      OC4FE          at 0 range 10 .. 10;
      OC4PE          at 0 range 11 .. 11;
      OC4M           at 0 range 12 .. 14;
      OC4CE          at 0 range 15 .. 15;
      OC3M_1         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC4M_1         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  TIM2 capture/compare enable register
   type CCER_Register_1 is record
      --  Capture/Compare 1 output enable.
      CC1E           : Boolean := False;
      --  Capture/Compare 1 output Polarity.
      CC1P           : Boolean := False;
      --  unspecified
      Reserved_2_2   : HAL.Bit := 16#0#;
      --  Capture/Compare 1 output Polarity.
      CC1NP          : Boolean := False;
      --  Capture/Compare 2 output enable.
      CC2E           : Boolean := False;
      --  Capture/Compare 2 output Polarity.
      CC2P           : Boolean := False;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      --  Capture/Compare 2 output Polarity.
      CC2NP          : Boolean := False;
      --  Capture/Compare 3 output enable.
      CC3E           : Boolean := False;
      --  Capture/Compare 3 output Polarity.
      CC3P           : Boolean := False;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      --  Capture/Compare 3 output Polarity.
      CC3NP          : Boolean := False;
      --  Capture/Compare 4 output enable.
      CC4E           : Boolean := False;
      --  Capture/Compare 4 output Polarity.
      CC4P           : Boolean := False;
      --  unspecified
      Reserved_14_14 : HAL.Bit := 16#0#;
      --  Capture/Compare 4 output Polarity.
      CC4NP          : Boolean := False;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CCER_Register_1 use record
      CC1E           at 0 range 0 .. 0;
      CC1P           at 0 range 1 .. 1;
      Reserved_2_2   at 0 range 2 .. 2;
      CC1NP          at 0 range 3 .. 3;
      CC2E           at 0 range 4 .. 4;
      CC2P           at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      CC2NP          at 0 range 7 .. 7;
      CC3E           at 0 range 8 .. 8;
      CC3P           at 0 range 9 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      CC3NP          at 0 range 11 .. 11;
      CC4E           at 0 range 12 .. 12;
      CC4P           at 0 range 13 .. 13;
      Reserved_14_14 at 0 range 14 .. 14;
      CC4NP          at 0 range 15 .. 15;
   end record;

   --  ETR source selection 	
   type AF1_ETRSEL_Field_1 is
     (--  ETR legacy mode
      B_0x0,
      --  COMP1
      B_0x1,
      --  COMP2
      B_0x2,
      --  LSE
      B_0x3,
      --  MCO
      B_0x4,
      --  MCO2
      B_0x5)
     with Size => 4;
   for AF1_ETRSEL_Field_1 use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4,
      B_0x5 => 5);

   --  TIM2 alternate function option register 1
   type AF1_Register_1 is record
      --  unspecified
      Reserved_0_13  : HAL.UInt14 := 16#0#;
      --  ETR source selection 	
      ETRSEL         : AF1_ETRSEL_Field_1 := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_18_31 : HAL.UInt14 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF1_Register_1 use record
      Reserved_0_13  at 0 range 0 .. 13;
      ETRSEL         at 0 range 14 .. 17;
      Reserved_18_31 at 0 range 18 .. 31;
   end record;

   --  TIM2 timer input selection register
   type TISEL_Register_1 is record
      --  TI1[0] to TI1[15] input selection 	
      TI1SEL         : TISEL_TI1SEL_Field := 16#0#;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  TI2[0] to TI2[15] input selection 	
      TI2SEL         : TISEL_TI2SEL_Field := 16#0#;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
      --  TI3[0] to TI3[15] input selection 	
      TI3SEL         : TISEL_TI3SEL_Field := 16#0#;
      --  unspecified
      Reserved_20_31 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TISEL_Register_1 use record
      TI1SEL         at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      TI2SEL         at 0 range 8 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
      TI3SEL         at 0 range 16 .. 19;
      Reserved_20_31 at 0 range 20 .. 31;
   end record;

   --  SMS[2:0]: Slave mode selection 	
   type SMCR_SMS_2_0_Field_1 is
     (--  Slave mode disabled - if CEN = 1 then the prescaler is clocked directly by
--  the internal clock.
      Disabled,
      --  Encoder mode 1 - Counter counts up/down on TI1FP1 edge depending on TI2FP2
--  level.
      Encoder_1,
      --  Encoder mode 2 - Counter counts up/down on TI2FP2 edge depending on TI1FP1
--  level.
      Encoder_2,
      --  Encoder mode 3 - Counter counts up/down on both TI1FP1 and TI2FP2 edges
--  depending on the level of the other input.
      Encoder_3,
      --  Reset Mode - Rising edge of the selected trigger input (TRGI) reinitializes
--  the counter and generates an update of the registers.
      Reset,
      --  Gated Mode - The counter clock is enabled when the trigger input (TRGI) is
--  high.
      Gated,
      --  Trigger Mode - The counter starts at a rising edge of the trigger TRGI (but
--  it is not reset).
      B_0x6,
      --  External Clock Mode 1 - Rising edges of the selected trigger (TRGI) clock
--  the counter.
      External_Clock)
     with Size => 3;
   for SMCR_SMS_2_0_Field_1 use
     (Disabled => 0,
      Encoder_1 => 1,
      Encoder_2 => 2,
      Encoder_3 => 3,
      Reset => 4,
      Gated => 5,
      B_0x6 => 6,
      External_Clock => 7);

   --  TIM3 slave mode control register
   type SMCR_Register_2 is record
      --  SMS[2:0]: Slave mode selection 	
      SMS_2_0        : SMCR_SMS_2_0_Field_1 := STM32_SVD.TIM.Disabled;
      --  OCREF clear selection 	
      OCCS           : Boolean := False;
      --  TIM3 TS[2:0]: Trigger selection 	
      TS_2_0         : SMCR_TS_2_0_Field_1 := 16#0#;
      --  Master/Slave mode
      MSM            : Boolean := False;
      --  External trigger filter 	
      ETF            : SMCR_ETF_Field := STM32_SVD.TIM.No_Filter;
      --  External trigger prescaler 	
      ETPS           : SMCR_ETPS_Field := STM32_SVD.TIM.Off;
      --  External clock enable 	
      ECE            : Boolean := False;
      --  External trigger polarity 	
      ETP            : Boolean := False;
      --  SMS[3]
      SMS_3          : Boolean := False;
      --  unspecified
      Reserved_17_19 : HAL.UInt3 := 16#0#;
      --  TIM 3 TS[4:3]
      TS_4_3         : SMCR_TS_4_3_Field := 16#0#;
      --  unspecified
      Reserved_22_31 : HAL.UInt10 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register_2 use record
      SMS_2_0        at 0 range 0 .. 2;
      OCCS           at 0 range 3 .. 3;
      TS_2_0         at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      ETF            at 0 range 8 .. 11;
      ETPS           at 0 range 12 .. 13;
      ECE            at 0 range 14 .. 14;
      ETP            at 0 range 15 .. 15;
      SMS_3          at 0 range 16 .. 16;
      Reserved_17_19 at 0 range 17 .. 19;
      TS_4_3         at 0 range 20 .. 21;
      Reserved_22_31 at 0 range 22 .. 31;
   end record;

   --  TIM6 control register 1
   type CR1_Register_1 is record
      --  Counter enable 	Note: Gated mode can work only if the CEN bit has
      --  been previously set by software. However trigger mode can set the CEN
      --  bit automatically by hardware. 	CEN is cleared automatically in
      --  one-pulse mode, when an update event occurs.
      CEN            : Boolean := False;
      --  Update disable 	This bit is set and cleared by software to
      --  enable/disable UEV event generation. 	Counter overflow/underflow
      --  	Setting the UG bit 	Update generation through the slave mode
      --  controller 	Buffered registers are then loaded with their preload
      --  values.
      UDIS           : Boolean := False;
      --  Update request source 	This bit is set and cleared by software to
      --  select the UEV event sources. 	Counter overflow/underflow 	Setting
      --  the UG bit 	Update generation through the slave mode controller
      URS            : Boolean := False;
      --  One-pulse mode
      OPM            : Boolean := False;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
      --  Auto-reload preload enable
      ARPE           : Boolean := False;
      --  unspecified
      Reserved_8_10  : HAL.UInt3 := 16#0#;
      --  UIF status bit remapping
      UIFREMAP       : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CR1_Register_1 use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      ARPE           at 0 range 7 .. 7;
      Reserved_8_10  at 0 range 8 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   --  Master mode selection 	These bits are used to select the information to
   --  be sent in master mode to slave timers for synchronization (TRGO). The
   --  combination is as follows: 	When the Counter Enable signal is controlled
   --  by the trigger input, there is a delay on TRGO, except if the
   --  master/slave mode is selected (see the MSM bit description in the
   --  TIMx_SMCR register). 	Note: The clock of the slave timer or ADC must be
   --  enabled prior to receive events from the master timer, and must not be
   --  changed on-the-fly while triggers are received from the master timer.
   type CR2_MMS_Field_1 is
     (--  Reset - the UG bit from the TIMx_EGR register is used as a trigger output
--  (TRGO). If reset is generated by the trigger input (slave mode controller
--  configured in reset mode) then the signal on TRGO is delayed compared to
--  the actual reset.
      Reset,
      --  Enable - the Counter enable signal, CNT_EN, is used as a trigger output
--  (TRGO). It is useful to start several timers at the same time or to control
--  a window in which a slave timer is enabled. The Counter Enable signal is
--  generated by a logic OR between CEN control bit and the trigger input when
--  configured in gated mode.
      Enable,
      --  Update - The update event is selected as a trigger output (TRGO). For
--  instance a master timer can then be used as a prescaler for a slave timer.
      Update)
     with Size => 3;
   for CR2_MMS_Field_1 use
     (Reset => 0,
      Enable => 1,
      Update => 2);

   --  TIM6 control register 2
   type CR2_Register_2 is record
      --  unspecified
      Reserved_0_3  : HAL.UInt4 := 16#0#;
      --  Master mode selection 	These bits are used to select the information
      --  to be sent in master mode to slave timers for synchronization (TRGO).
      --  The combination is as follows: 	When the Counter Enable signal is
      --  controlled by the trigger input, there is a delay on TRGO, except if
      --  the master/slave mode is selected (see the MSM bit description in the
      --  TIMx_SMCR register). 	Note: The clock of the slave timer or ADC must
      --  be enabled prior to receive events from the master timer, and must
      --  not be changed on-the-fly while triggers are received from the master
      --  timer.
      MMS           : CR2_MMS_Field_1 := STM32_SVD.TIM.Reset;
      --  unspecified
      Reserved_7_15 : HAL.UInt9 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_2 use record
      Reserved_0_3  at 0 range 0 .. 3;
      MMS           at 0 range 4 .. 6;
      Reserved_7_15 at 0 range 7 .. 15;
   end record;

   --  TIM6 DMA/Interrupt enable register
   type DIER_Register_2 is record
      --  Update interrupt enable
      UIE           : Boolean := False;
      --  unspecified
      Reserved_1_7  : HAL.UInt7 := 16#0#;
      --  Update DMA request enable
      UDE           : Boolean := False;
      --  unspecified
      Reserved_9_15 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_2 use record
      UIE           at 0 range 0 .. 0;
      Reserved_1_7  at 0 range 1 .. 7;
      UDE           at 0 range 8 .. 8;
      Reserved_9_15 at 0 range 9 .. 15;
   end record;

   --  TIM6 status register
   type SR_Register_2 is record
      --  Update interrupt flag 	This bit is set by hardware on an update
      --  event. It is cleared by software. 	At overflow or underflow regarding
      --  the repetition counter value and if UDIS = 0 in the TIMx_CR1
      --  register. 	When CNT is reinitialized by software using the UG bit in
      --  the TIMx_EGR register, if URS1=10 and UDIS1=10 in the TIMx_CR1
      --  register.
      UIF           : Boolean := False;
      --  unspecified
      Reserved_1_15 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SR_Register_2 use record
      UIF           at 0 range 0 .. 0;
      Reserved_1_15 at 0 range 1 .. 15;
   end record;

   --  TIM6 event generation register
   type EGR_Register_2 is record
      --  Write-only. Update generation 	This bit can be set by software, it is
      --  automatically cleared by hardware.
      UG            : Boolean := False;
      --  unspecified
      Reserved_1_15 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_2 use record
      UG            at 0 range 0 .. 0;
      Reserved_1_15 at 0 range 1 .. 15;
   end record;

   --  TIM15 control register 1
   type CR1_Register_2 is record
      --  Counter enable 	
      CEN            : Boolean := False;
      --  Update disable 	
      UDIS           : Boolean := False;
      --  Update request source 	
      URS            : Boolean := False;
      --  One-pulse mode
      OPM            : Boolean := False;
      --  unspecified
      Reserved_4_6   : HAL.UInt3 := 16#0#;
      --  Auto-reload preload enable
      ARPE           : Boolean := False;
      --  Clock division This bit-field indicates the division ratio between
      --  the timer clock (CK_INT) frequency and the dead-time and sampling
      --  clock (tDTS)used by the dead-time generators and the digital filters
      --  (ETR, TIx): Note: tDTS = 1/fDTS, tCK_INT = 1/fCK_INT. 	
      CKD            : CR1_CKD_Field := STM32_SVD.TIM.Div_1;
      --  unspecified
      Reserved_10_10 : HAL.Bit := 16#0#;
      --  UIF status bit remapping
      UIFREMAP       : Boolean := False;
      --  unspecified
      Reserved_12_15 : HAL.UInt4 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CR1_Register_2 use record
      CEN            at 0 range 0 .. 0;
      UDIS           at 0 range 1 .. 1;
      URS            at 0 range 2 .. 2;
      OPM            at 0 range 3 .. 3;
      Reserved_4_6   at 0 range 4 .. 6;
      ARPE           at 0 range 7 .. 7;
      CKD            at 0 range 8 .. 9;
      Reserved_10_10 at 0 range 10 .. 10;
      UIFREMAP       at 0 range 11 .. 11;
      Reserved_12_15 at 0 range 12 .. 15;
   end record;

   --  Master mode selection 	
   type CR2_MMS_Field_2 is
     (--  Reset - the UG bit from the TIMx_EGR register is used as trigger output
--  (TRGO). If the reset is generated by the trigger input (slave mode
--  controller configured in reset mode) then the signal on TRGO is delayed
--  compared to the actual reset.
      Reset,
      --  Enable - the Counter Enable signal CNT_EN is used as trigger output (TRGO).
--  It is useful to start several timers at the same time or to control a
--  window in which a slave timer is enable. The Counter Enable signal is
--  generated by a logic AND between CEN control bit and the trigger input when
--  configured in gated mode. When the Counter Enable signal is controlled by
--  the trigger input, there is a delay on TRGO, except if the master/slave
--  mode is selected (see the MSM bit description in TIMx_SMCR register).
      Enable,
      --  Update - The update event is selected as trigger output (TRGO). For
--  instance a master timer can then be used as a prescaler for a slave timer.
      Update,
      --  Compare Pulse - The trigger output send a positive pulse when the CC1IF
--  flag is to be set (even if it was already high), as soon as a capture or a
--  compare match occurred. (TRGO).
      Compare_Pulse,
      --  Compare - OC1REFC signal is used as trigger output (TRGO)
      Compare_OC1,
      --  Compare - OC2REFC signal is used as trigger output (TRGO)
      Compare_OC2)
     with Size => 3;
   for CR2_MMS_Field_2 use
     (Reset => 0,
      Enable => 1,
      Update => 2,
      Compare_Pulse => 3,
      Compare_OC1 => 4,
      Compare_OC2 => 5);

   --  TIM15 control register 2
   type CR2_Register_3 is record
      --  Capture/compare preloaded control 	
      CCPC           : Boolean := False;
      --  unspecified
      Reserved_1_1   : HAL.Bit := 16#0#;
      --  Capture/compare control update selection 	
      CCUS           : Boolean := False;
      --  Capture/compare DMA selection
      CCDS           : Boolean := False;
      --  Master mode selection 	
      MMS            : CR2_MMS_Field_2 := STM32_SVD.TIM.Reset;
      --  TI1 selection
      TI1S           : Boolean := False;
      --  Output Idle state 1 (OC1 output) 	
      OIS1           : Boolean := False;
      --  Output Idle state 1 (OC1N output) 	
      OIS1N          : Boolean := False;
      --  Output idle state 2 (OC2 output) 	
      OIS2           : Boolean := False;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_3 use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      MMS            at 0 range 4 .. 6;
      TI1S           at 0 range 7 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      OIS2           at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  TIM15 TS[2:0]: Trigger selection 	
   type SMCR_TS_2_0_Field_2 is
     (--  Internal Trigger 0 (ITR0)
      Internal_0,
      --  Internal Trigger 1 (ITR1)
      Internal_1,
      --  Internal Trigger 2 (ITR2)
      Internal_2,
      --  Internal Trigger 3 (ITR3)
      Internal_3,
      --  TI1 Edge Detector (TI1F_ED)
      TI1_Edge_Detector,
      --  Filtered Timer Input 1 (TI1FP1)
      Filtered_Timer_Input_1,
      --  Filtered Timer Input 2 (TI2FP2)
      Filtered_Timer_Input_2)
     with Size => 3;
   for SMCR_TS_2_0_Field_2 use
     (Internal_0 => 0,
      Internal_1 => 1,
      Internal_2 => 2,
      Internal_3 => 3,
      TI1_Edge_Detector => 4,
      Filtered_Timer_Input_1 => 5,
      Filtered_Timer_Input_2 => 6);

   --  TIM15 slave mode control register
   type SMCR_Register_3 is record
      --  TIM15 SMS[2:0]: Slave mode selection 	
      SMS_2_0        : SMCR_SMS_2_0_Field := 16#0#;
      --  unspecified
      Reserved_3_3   : HAL.Bit := 16#0#;
      --  TIM15 TS[2:0]: Trigger selection 	
      TS_2_0         : SMCR_TS_2_0_Field_2 := STM32_SVD.TIM.Internal_0;
      --  Master/slave mode
      MSM            : Boolean := False;
      --  unspecified
      Reserved_8_15  : HAL.UInt8 := 16#0#;
      --  SMS[3]
      SMS_3          : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for SMCR_Register_3 use record
      SMS_2_0        at 0 range 0 .. 2;
      Reserved_3_3   at 0 range 3 .. 3;
      TS_2_0         at 0 range 4 .. 6;
      MSM            at 0 range 7 .. 7;
      Reserved_8_15  at 0 range 8 .. 15;
      SMS_3          at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  TIM15 DMA/interrupt enable register
   type DIER_Register_3 is record
      --  Update interrupt enable
      UIE            : Boolean := False;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : Boolean := False;
      --  Capture/Compare 2 interrupt enable
      CC2IE          : Boolean := False;
      --  unspecified
      Reserved_3_4   : HAL.UInt2 := 16#0#;
      --  COM interrupt enable
      COMIE          : Boolean := False;
      --  Trigger interrupt enable
      TIE            : Boolean := False;
      --  Break interrupt enable
      BIE            : Boolean := False;
      --  Update DMA request enable
      UDE            : Boolean := False;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : Boolean := False;
      --  unspecified
      Reserved_10_12 : HAL.UInt3 := 16#0#;
      --  COM DMA request enable
      COMDE          : Boolean := False;
      --  Trigger DMA request enable
      TDE            : Boolean := False;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_3 use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      CC2IE          at 0 range 2 .. 2;
      Reserved_3_4   at 0 range 3 .. 4;
      COMIE          at 0 range 5 .. 5;
      TIE            at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      Reserved_10_12 at 0 range 10 .. 12;
      COMDE          at 0 range 13 .. 13;
      TDE            at 0 range 14 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
   end record;

   --  TIM15 status register
   type SR_Register_3 is record
      --  Update interrupt flag 	
      UIF            : Boolean := False;
      --  Capture/Compare 1 interrupt flag 	
      CC1IF          : Boolean := False;
      --  Capture/Compare 2 interrupt flag 	
      CC2IF          : Boolean := False;
      --  unspecified
      Reserved_3_4   : HAL.UInt2 := 16#0#;
      --  COM interrupt flag 	
      COMIF          : Boolean := False;
      --  Trigger interrupt flag 	
      TIF            : Boolean := False;
      --  Break interrupt flag 	
      BIF            : Boolean := False;
      --  unspecified
      Reserved_8_8   : HAL.Bit := 16#0#;
      --  Capture/Compare 1 overcapture flag 	
      CC1OF          : Boolean := False;
      --  Capture/Compare 2 overcapture flag 	
      CC2OF          : Boolean := False;
      --  unspecified
      Reserved_11_15 : HAL.UInt5 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SR_Register_3 use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      CC2IF          at 0 range 2 .. 2;
      Reserved_3_4   at 0 range 3 .. 4;
      COMIF          at 0 range 5 .. 5;
      TIF            at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      CC2OF          at 0 range 10 .. 10;
      Reserved_11_15 at 0 range 11 .. 15;
   end record;

   --  TIM15 event generation register
   type EGR_Register_3 is record
      --  Write-only. Update generation 	
      UG            : Boolean := False;
      --  Write-only. Capture/Compare 1 generation 	
      CC1G          : Boolean := False;
      --  Write-only. Capture/Compare 2 generation 	
      CC2G          : Boolean := False;
      --  unspecified
      Reserved_3_4  : HAL.UInt2 := 16#0#;
      --  Capture/Compare control update generation 	
      COMG          : Boolean := False;
      --  Write-only. Trigger generation 	
      TG            : Boolean := False;
      --  Write-only. Break generation 	
      BG            : Boolean := False;
      --  unspecified
      Reserved_8_15 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_3 use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      CC2G          at 0 range 2 .. 2;
      Reserved_3_4  at 0 range 3 .. 4;
      COMG          at 0 range 5 .. 5;
      TG            at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   --  TIM15 capture/compare mode register 1
   type CCMR1_ALTERNATE1_Register_1 is record
      --  Capture/Compare 1 selection 	
      CC1S           : CCMR1_ALTERNATE1_CC1S_Field := STM32_SVD.TIM.B_0x0;
      --  Output Compare 1 fast enable 	
      OC1FE          : Boolean := False;
      --  Output Compare 1 preload enable 	
      OC1PE          : Boolean := False;
      --  OC1M[2:0]: Output Compare 1 mode 	
      OC1M           : CCMR1_ALTERNATE1_OC1M_Field := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_7_7   : HAL.Bit := 16#0#;
      --  Capture/Compare 2 selection 	
      CC2S           : CCMR1_ALTERNATE1_CC2S_Field := STM32_SVD.TIM.B_0x0;
      --  Output Compare 2 fast enable
      OC2FE          : Boolean := False;
      --  Output Compare 2 preload enable
      OC2PE          : Boolean := False;
      --  OC2M[2:0]: Output Compare 2 mode
      OC2M           : CCMR1_ALTERNATE1_OC2M_Field := 16#0#;
      --  unspecified
      Reserved_15_15 : HAL.Bit := 16#0#;
      --  OC1M[3]
      OC1M_1         : Boolean := False;
      --  unspecified
      Reserved_17_23 : HAL.UInt7 := 16#0#;
      --  OC2M[3]
      OC2M_1         : Boolean := False;
      --  unspecified
      Reserved_25_31 : HAL.UInt7 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_ALTERNATE1_Register_1 use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      Reserved_7_7   at 0 range 7 .. 7;
      CC2S           at 0 range 8 .. 9;
      OC2FE          at 0 range 10 .. 10;
      OC2PE          at 0 range 11 .. 11;
      OC2M           at 0 range 12 .. 14;
      Reserved_15_15 at 0 range 15 .. 15;
      OC1M_1         at 0 range 16 .. 16;
      Reserved_17_23 at 0 range 17 .. 23;
      OC2M_1         at 0 range 24 .. 24;
      Reserved_25_31 at 0 range 25 .. 31;
   end record;

   --  TIM15 capture/compare enable register
   type CCER_Register_2 is record
      --  Capture/Compare 1 output enable 	
      CC1E          : Boolean := False;
      --  Capture/Compare 1 output polarity 	
      CC1P          : Boolean := False;
      --  Capture/Compare 1 complementary output enable
      CC1NE         : Boolean := False;
      --  Capture/Compare 1 complementary output polarity 	
      CC1NP         : Boolean := False;
      --  Capture/Compare 2 output enable 	
      CC2E          : Boolean := False;
      --  Capture/Compare 2 output polarity 	
      CC2P          : Boolean := False;
      --  unspecified
      Reserved_6_6  : HAL.Bit := 16#0#;
      --  Capture/Compare 2 complementary output polarity 	
      CC2NP         : Boolean := False;
      --  unspecified
      Reserved_8_15 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CCER_Register_2 use record
      CC1E          at 0 range 0 .. 0;
      CC1P          at 0 range 1 .. 1;
      CC1NE         at 0 range 2 .. 2;
      CC1NP         at 0 range 3 .. 3;
      CC2E          at 0 range 4 .. 4;
      CC2P          at 0 range 5 .. 5;
      Reserved_6_6  at 0 range 6 .. 6;
      CC2NP         at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   subtype RCR_REP_Field is HAL.UInt8;

   --  TIM15 repetition counter register
   type RCR_Register is record
      --  Repetition counter value 	
      REP           : RCR_REP_Field := 16#0#;
      --  unspecified
      Reserved_8_15 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for RCR_Register use record
      REP           at 0 range 0 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   --  TIM15 break and dead-time register
   type BDTR_Register_1 is record
      --  Dead-time generator setup 	
      DTG            : BDTR_DTG_Field := 16#0#;
      --  Lock configuration 	
      LOCK           : BDTR_LOCK_Field := STM32_SVD.TIM.B_0x0;
      --  Off-state selection for Idle mode 	
      OSSI           : Boolean := False;
      --  Off-state selection for Run mode 	
      OSSR           : Boolean := False;
      --  Break enable 	
      BKE            : Boolean := False;
      --  Break polarity 	
      BKP            : Boolean := False;
      --  Automatic output enable 	
      AOE            : Boolean := False;
      --  Main output enable 	
      MOE            : Boolean := False;
      --  Break filter 	
      BKF            : BDTR_BKF_Field := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_20_25 : HAL.UInt6 := 16#0#;
      --  Break Disarm 	
      BKDSRM         : Boolean := False;
      --  unspecified
      Reserved_27_27 : HAL.Bit := 16#0#;
      --  Break Bidirectional 	
      BKBID          : Boolean := False;
      --  unspecified
      Reserved_29_31 : HAL.UInt3 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for BDTR_Register_1 use record
      DTG            at 0 range 0 .. 7;
      LOCK           at 0 range 8 .. 9;
      OSSI           at 0 range 10 .. 10;
      OSSR           at 0 range 11 .. 11;
      BKE            at 0 range 12 .. 12;
      BKP            at 0 range 13 .. 13;
      AOE            at 0 range 14 .. 14;
      MOE            at 0 range 15 .. 15;
      BKF            at 0 range 16 .. 19;
      Reserved_20_25 at 0 range 20 .. 25;
      BKDSRM         at 0 range 26 .. 26;
      Reserved_27_27 at 0 range 27 .. 27;
      BKBID          at 0 range 28 .. 28;
      Reserved_29_31 at 0 range 29 .. 31;
   end record;

   --  TIM15 alternate register 1
   type AF1_Register_2 is record
      --  BRK BKIN input enable 	
      BKINE          : Boolean := True;
      --  BRK COMP1 enable 	
      BKCMP1E        : Boolean := False;
      --  BRK COMP2 enable 	
      BKCMP2E        : Boolean := False;
      --  unspecified
      Reserved_3_8   : HAL.UInt6 := 16#0#;
      --  BRK BKIN input polarity 	
      BKINP          : Boolean := False;
      --  BRK COMP1 input polarity 	
      BKCMP1P        : Boolean := False;
      --  BRK COMP2 input polarity 	
      BKCMP2P        : Boolean := False;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for AF1_Register_2 use record
      BKINE          at 0 range 0 .. 0;
      BKCMP1E        at 0 range 1 .. 1;
      BKCMP2E        at 0 range 2 .. 2;
      Reserved_3_8   at 0 range 3 .. 8;
      BKINP          at 0 range 9 .. 9;
      BKCMP1P        at 0 range 10 .. 10;
      BKCMP2P        at 0 range 11 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  selects TI1[0] to TI1[15] input 	
   type TISEL_TI1SEL_Field_1 is
     (--  TIM15_CH1 input
      B_0x0,
      --  TIM2_IC1
      B_0x1,
      --  TIM3_IC1
      B_0x2)
     with Size => 4;
   for TISEL_TI1SEL_Field_1 use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2);

   --  selects TI2[0] to TI2[15] input 	
   type TISEL_TI2SEL_Field_1 is
     (--  TIM15_CH2 input
      B_0x0,
      --  TIM2_IC2
      B_0x1,
      --  TIM3_IC2
      B_0x2)
     with Size => 4;
   for TISEL_TI2SEL_Field_1 use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2);

   --  TIM15 input selection register
   type TISEL_Register_2 is record
      --  selects TI1[0] to TI1[15] input 	
      TI1SEL         : TISEL_TI1SEL_Field_1 := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  selects TI2[0] to TI2[15] input 	
      TI2SEL         : TISEL_TI2SEL_Field_1 := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_12_31 : HAL.UInt20 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TISEL_Register_2 use record
      TI1SEL         at 0 range 0 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      TI2SEL         at 0 range 8 .. 11;
      Reserved_12_31 at 0 range 12 .. 31;
   end record;

   --  TIM16 control register 2
   type CR2_Register_4 is record
      --  Capture/compare preloaded control 	
      CCPC           : Boolean := False;
      --  unspecified
      Reserved_1_1   : HAL.Bit := 16#0#;
      --  Capture/compare control update selection 	
      CCUS           : Boolean := False;
      --  Capture/compare DMA selection
      CCDS           : Boolean := False;
      --  unspecified
      Reserved_4_7   : HAL.UInt4 := 16#0#;
      --  Output Idle state 1 (OC1 output) 	
      OIS1           : Boolean := False;
      --  Output Idle state 1 (OC1N output) 	
      OIS1N          : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CR2_Register_4 use record
      CCPC           at 0 range 0 .. 0;
      Reserved_1_1   at 0 range 1 .. 1;
      CCUS           at 0 range 2 .. 2;
      CCDS           at 0 range 3 .. 3;
      Reserved_4_7   at 0 range 4 .. 7;
      OIS1           at 0 range 8 .. 8;
      OIS1N          at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  TIM16 DMA/interrupt enable register
   type DIER_Register_4 is record
      --  Update interrupt enable
      UIE            : Boolean := False;
      --  Capture/Compare 1 interrupt enable
      CC1IE          : Boolean := False;
      --  unspecified
      Reserved_2_4   : HAL.UInt3 := 16#0#;
      --  COM interrupt enable
      COMIE          : Boolean := False;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      --  Break interrupt enable
      BIE            : Boolean := False;
      --  Update DMA request enable
      UDE            : Boolean := False;
      --  Capture/Compare 1 DMA request enable
      CC1DE          : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for DIER_Register_4 use record
      UIE            at 0 range 0 .. 0;
      CC1IE          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      COMIE          at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      BIE            at 0 range 7 .. 7;
      UDE            at 0 range 8 .. 8;
      CC1DE          at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  TIM16 status register
   type SR_Register_4 is record
      --  Update interrupt flag 	
      UIF            : Boolean := False;
      --  Capture/Compare 1 interrupt flag 	
      CC1IF          : Boolean := False;
      --  unspecified
      Reserved_2_4   : HAL.UInt3 := 16#0#;
      --  COM interrupt flag 	
      COMIF          : Boolean := False;
      --  unspecified
      Reserved_6_6   : HAL.Bit := 16#0#;
      --  Break interrupt flag 	
      BIF            : Boolean := False;
      --  unspecified
      Reserved_8_8   : HAL.Bit := 16#0#;
      --  Capture/Compare 1 overcapture flag 	
      CC1OF          : Boolean := False;
      --  unspecified
      Reserved_10_15 : HAL.UInt6 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for SR_Register_4 use record
      UIF            at 0 range 0 .. 0;
      CC1IF          at 0 range 1 .. 1;
      Reserved_2_4   at 0 range 2 .. 4;
      COMIF          at 0 range 5 .. 5;
      Reserved_6_6   at 0 range 6 .. 6;
      BIF            at 0 range 7 .. 7;
      Reserved_8_8   at 0 range 8 .. 8;
      CC1OF          at 0 range 9 .. 9;
      Reserved_10_15 at 0 range 10 .. 15;
   end record;

   --  TIM16 event generation register
   type EGR_Register_4 is record
      --  Write-only. Update generation 	
      UG            : Boolean := False;
      --  Write-only. Capture/Compare 1 generation 	
      CC1G          : Boolean := False;
      --  unspecified
      Reserved_2_4  : HAL.UInt3 := 16#0#;
      --  Write-only. Capture/Compare control update generation 	
      COMG          : Boolean := False;
      --  unspecified
      Reserved_6_6  : HAL.Bit := 16#0#;
      --  Write-only. Break generation 	
      BG            : Boolean := False;
      --  unspecified
      Reserved_8_15 : HAL.UInt8 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for EGR_Register_4 use record
      UG            at 0 range 0 .. 0;
      CC1G          at 0 range 1 .. 1;
      Reserved_2_4  at 0 range 2 .. 4;
      COMG          at 0 range 5 .. 5;
      Reserved_6_6  at 0 range 6 .. 6;
      BG            at 0 range 7 .. 7;
      Reserved_8_15 at 0 range 8 .. 15;
   end record;

   subtype CCMR1_CC1S_Field_1 is HAL.UInt2;

   --  TIM16 capture/compare mode register 1
   type CCMR1_Register_1 is record
      --  Capture/Compare 1 Selection 	
      CC1S          : CCMR1_CC1S_Field_1 := 16#0#;
      --  Input capture 1 prescaler 	
      IC1PSC        : CCMR1_IC1PSC_Field := STM32_SVD.TIM.B_0x0;
      --  Input capture 1 filter 	
      IC1F          : CCMR1_IC1F_Field := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_8_31 : HAL.UInt24 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_Register_1 use record
      CC1S          at 0 range 0 .. 1;
      IC1PSC        at 0 range 2 .. 3;
      IC1F          at 0 range 4 .. 7;
      Reserved_8_31 at 0 range 8 .. 31;
   end record;

   subtype CCMR1_ALTERNATE1_CC1S_Field_1 is HAL.UInt2;

   --  TIM16 capture/compare mode register 1
   type CCMR1_ALTERNATE1_Register_2 is record
      --  Capture/Compare 1 selection 	
      CC1S           : CCMR1_ALTERNATE1_CC1S_Field_1 := 16#0#;
      --  Output Compare 1 fast enable 	
      OC1FE          : Boolean := False;
      --  Output Compare 1 preload enable 	
      OC1PE          : Boolean := False;
      --  OC1M[2:0]: Output Compare 1 mode 	
      OC1M           : CCMR1_ALTERNATE1_OC1M_Field := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_7_15  : HAL.UInt9 := 16#0#;
      --  OC1M[3]
      OC1M_1         : Boolean := False;
      --  unspecified
      Reserved_17_31 : HAL.UInt15 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for CCMR1_ALTERNATE1_Register_2 use record
      CC1S           at 0 range 0 .. 1;
      OC1FE          at 0 range 2 .. 2;
      OC1PE          at 0 range 3 .. 3;
      OC1M           at 0 range 4 .. 6;
      Reserved_7_15  at 0 range 7 .. 15;
      OC1M_1         at 0 range 16 .. 16;
      Reserved_17_31 at 0 range 17 .. 31;
   end record;

   --  TIM16 capture/compare enable register
   type CCER_Register_3 is record
      --  Capture/Compare 1 output enable 	
      CC1E          : Boolean := False;
      --  Capture/Compare 1 output polarity 	
      CC1P          : Boolean := False;
      --  Capture/Compare 1 complementary output enable
      CC1NE         : Boolean := False;
      --  Capture/Compare 1 complementary output polarity 	
      CC1NP         : Boolean := False;
      --  unspecified
      Reserved_4_15 : HAL.UInt12 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 16,
          Bit_Order => System.Low_Order_First;

   for CCER_Register_3 use record
      CC1E          at 0 range 0 .. 0;
      CC1P          at 0 range 1 .. 1;
      CC1NE         at 0 range 2 .. 2;
      CC1NP         at 0 range 3 .. 3;
      Reserved_4_15 at 0 range 4 .. 15;
   end record;

   --  selects TI1[0] to TI1[15] input 	
   type TISEL_TI1SEL_Field_2 is
     (--  TIM16_CH1 input
      B_0x0,
      --  LSI
      B_0x1,
      --  LSE
      B_0x2,
      --  RTC wakeup
      B_0x3,
      --  MCO2
      B_0x4)
     with Size => 4;
   for TISEL_TI1SEL_Field_2 use
     (B_0x0 => 0,
      B_0x1 => 1,
      B_0x2 => 2,
      B_0x3 => 3,
      B_0x4 => 4);

   --  TIM16 input selection register
   type TISEL_Register_3 is record
      --  selects TI1[0] to TI1[15] input 	
      TI1SEL        : TISEL_TI1SEL_Field_2 := STM32_SVD.TIM.B_0x0;
      --  unspecified
      Reserved_4_31 : HAL.UInt28 := 16#0#;
   end record
     with Volatile_Full_Access, Object_Size => 32,
          Bit_Order => System.Low_Order_First;

   for TISEL_Register_3 use record
      TI1SEL        at 0 range 0 .. 3;
      Reserved_4_31 at 0 range 4 .. 31;
   end record;

   -----------------
   -- Peripherals --
   -----------------

   --  TIM1 address block description
   type TIM1_Input_Peripheral is record
      --  TIM1 control register 1
      CR1          : aliased CR1_Register;
      --  TIM1 control register 2
      CR2          : aliased CR2_Register;
      --  TIM1 slave mode control register
      SMCR         : aliased SMCR_Register;
      --  TIM1 DMA/interrupt enable register
      DIER         : aliased DIER_Register;
      --  TIM1 status register
      SR           : aliased SR_Register;
      --  TIM1 event generation register
      EGR          : aliased EGR_Register;
      --  TIM1 capture/compare enable register
      CCER         : aliased CCER_Register;
      --  TIM1 counter
      CNT          : aliased CNT_Register;
      --  TIM1 prescaler
      PSC          : aliased HAL.UInt16;
      --  TIM1 auto-reload register
      ARR          : aliased HAL.UInt16;
      --  TIM1 repetition counter register
      RCR          : aliased HAL.UInt16;
      --  TIM1 capture/compare register 1
      CCR1         : aliased HAL.UInt16;
      --  TIM1 capture/compare register 2
      CCR2         : aliased HAL.UInt16;
      --  TIM1 capture/compare register 3
      CCR3         : aliased HAL.UInt16;
      --  TIM1 capture/compare register 4
      CCR4         : aliased HAL.UInt16;
      --  TIM1 break and dead-time register
      BDTR         : aliased BDTR_Register;
      --  TIM1 DMA control register
      DCR          : aliased DCR_Register;
      --  TIM1 DMA address for full transfer
      DMAR         : aliased HAL.UInt32;
      --  TIM1 option register 1
      OR1          : aliased OR1_Register;
      --  TIM1 capture/compare mode register 3
      CCMR3        : aliased CCMR3_Register;
      --  TIM1 capture/compare register 5
      CCR5         : aliased CCR5_Register;
      --  TIM1 capture/compare register 6
      CCR6         : aliased HAL.UInt16;
      --  TIM1 alternate function option register 1
      AF1          : aliased AF1_Register;
      --  TIM1 Alternate function register 2
      AF2          : aliased AF2_Register;
      --  TIM1 timer input selection register
      TISEL        : aliased TISEL_Register;
      --  TIM1 capture/compare mode register 1
      CCMR1        : aliased CCMR1_INPUT_Register;
      --  TIM1 capture/compare mode register 2
      CCMR2        : aliased CCMR2_INPUT_Register;
   end record with Volatile;

   for TIM1_Input_Peripheral use record
      CR1          at 16#0# range 0 .. 15;
      CR2          at 16#4# range 0 .. 31;
      SMCR         at 16#8# range 0 .. 31;
      DIER         at 16#C# range 0 .. 15;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 15;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 15;
      ARR          at 16#2C# range 0 .. 15;
      RCR          at 16#30# range 0 .. 15;
      CCR1         at 16#34# range 0 .. 15;
      CCR2         at 16#38# range 0 .. 15;
      CCR3         at 16#3C# range 0 .. 15;
      CCR4         at 16#40# range 0 .. 15;
      BDTR         at 16#44# range 0 .. 31;
      DCR          at 16#48# range 0 .. 15;
      DMAR         at 16#4C# range 0 .. 31;
      OR1          at 16#50# range 0 .. 31;
      CCMR3        at 16#54# range 0 .. 31;
      CCR5         at 16#58# range 0 .. 31;
      CCR6         at 16#5C# range 0 .. 15;
      AF1          at 16#60# range 0 .. 31;
      AF2          at 16#64# range 0 .. 31;
      TISEL        at 16#68# range 0 .. 31;
      CCMR1        at 16#18# range 0 .. 31;
      CCMR2        at 16#1C# range 0 .. 31;
   end record;

   --  TIM1 address block description
   type TIM1_Output_Peripheral is record
      --  TIM1 control register 1
      CR1          : aliased CR1_Register;
      --  TIM1 control register 2
      CR2          : aliased CR2_Register;
      --  TIM1 slave mode control register
      SMCR         : aliased SMCR_Register;
      --  TIM1 DMA/interrupt enable register
      DIER         : aliased DIER_Register;
      --  TIM1 status register
      SR           : aliased SR_Register;
      --  TIM1 event generation register
      EGR          : aliased EGR_Register;
      --  TIM1 capture/compare enable register
      CCER         : aliased CCER_Register;
      --  TIM1 counter
      CNT          : aliased CNT_Register;
      --  TIM1 prescaler
      PSC          : aliased HAL.UInt16;
      --  TIM1 auto-reload register
      ARR          : aliased HAL.UInt16;
      --  TIM1 repetition counter register
      RCR          : aliased HAL.UInt16;
      --  TIM1 capture/compare register 1
      CCR1         : aliased HAL.UInt16;
      --  TIM1 capture/compare register 2
      CCR2         : aliased HAL.UInt16;
      --  TIM1 capture/compare register 3
      CCR3         : aliased HAL.UInt16;
      --  TIM1 capture/compare register 4
      CCR4         : aliased HAL.UInt16;
      --  TIM1 break and dead-time register
      BDTR         : aliased BDTR_Register;
      --  TIM1 DMA control register
      DCR          : aliased DCR_Register;
      --  TIM1 DMA address for full transfer
      DMAR         : aliased HAL.UInt32;
      --  TIM1 option register 1
      OR1          : aliased OR1_Register;
      --  TIM1 capture/compare mode register 3
      CCMR3        : aliased CCMR3_Register;
      --  TIM1 capture/compare register 5
      CCR5         : aliased CCR5_Register;
      --  TIM1 capture/compare register 6
      CCR6         : aliased HAL.UInt16;
      --  TIM1 alternate function option register 1
      AF1          : aliased AF1_Register;
      --  TIM1 Alternate function register 2
      AF2          : aliased AF2_Register;
      --  TIM1 timer input selection register
      TISEL        : aliased TISEL_Register;
      --  TIM1 capture/compare mode register 1
      CCMR1        : aliased CCMR1_OUTPUT_Register;
      --  TIM1 capture/compare mode register 1
      CCMR2        : aliased CCMR2_OUTPUT_Register;
   end record with Volatile;

   for TIM1_Output_Peripheral use record
      CR1          at 16#0# range 0 .. 15;
      CR2          at 16#4# range 0 .. 31;
      SMCR         at 16#8# range 0 .. 31;
      DIER         at 16#C# range 0 .. 15;
      SR           at 16#10# range 0 .. 31;
      EGR          at 16#14# range 0 .. 15;
      CCER         at 16#20# range 0 .. 31;
      CNT          at 16#24# range 0 .. 31;
      PSC          at 16#28# range 0 .. 15;
      ARR          at 16#2C# range 0 .. 15;
      RCR          at 16#30# range 0 .. 15;
      CCR1         at 16#34# range 0 .. 15;
      CCR2         at 16#38# range 0 .. 15;
      CCR3         at 16#3C# range 0 .. 15;
      CCR4         at 16#40# range 0 .. 15;
      BDTR         at 16#44# range 0 .. 31;
      DCR          at 16#48# range 0 .. 15;
      DMAR         at 16#4C# range 0 .. 31;
      OR1          at 16#50# range 0 .. 31;
      CCMR3        at 16#54# range 0 .. 31;
      CCR5         at 16#58# range 0 .. 31;
      CCR6         at 16#5C# range 0 .. 15;
      AF1          at 16#60# range 0 .. 31;
      AF2          at 16#64# range 0 .. 31;
      TISEL        at 16#68# range 0 .. 31;
      CCMR1        at 16#18# range 0 .. 31;
      CCMR2        at 16#1C# range 0 .. 31;
   end record;

   --  TIM1 address block description
   TIM1_Input_Periph : aliased TIM1_Input_Peripheral
     with Import, Address => TIM1_Base;

   TIM1_Output_Periph : aliased TIM1_Output_Peripheral
     with Import, Address => TIM1_Base;

   --  TIM2 address block description
   type TIM2_Input_Peripheral is record
      --  TIM2 control register 1
      CR1              : aliased CR1_Register;
      --  TIM2 control register 2
      CR2              : aliased CR2_Register_1;
      --  TIM2 slave mode control register
      SMCR             : aliased SMCR_Register_1;
      --  TIM2 DMA/Interrupt enable register
      DIER             : aliased DIER_Register_1;
      --  TIM2 status register
      SR               : aliased SR_Register_1;
      --  TIM2 event generation register
      EGR              : aliased EGR_Register_1;
      --  TIM2 capture/compare enable register
      CCER             : aliased CCER_Register_1;
      --  TIM2 counter
      CNT              : aliased HAL.UInt32;
      --  TIM2 prescaler
      PSC              : aliased HAL.UInt16;
      --  TIM2 auto-reload register
      ARR              : aliased HAL.UInt32;
      --  TIM2 capture/compare register 1
      CCR1             : aliased HAL.UInt32;
      --  TIM2 capture/compare register 2
      CCR2             : aliased HAL.UInt32;
      --  TIM2 capture/compare register 3
      CCR3             : aliased HAL.UInt32;
      --  TIM2 capture/compare register 4
      CCR4             : aliased HAL.UInt32;
      --  TIM2 DMA control register
      DCR              : aliased DCR_Register;
      --  TIM2 DMA address for full transfer
      DMAR             : aliased HAL.UInt16;
      --  TIM2 option register 1
      OR1              : aliased OR1_Register;
      --  TIM2 alternate function option register 1
      AF1              : aliased AF1_Register_1;
      --  TIM2 timer input selection register
      TISEL            : aliased TISEL_Register_1;
      --  TIM2 capture/compare mode register 1
      CCMR1            : aliased CCMR1_Register;
      --  TIM2 capture/compare mode register 2
      CCMR2            : aliased CCMR2_Register;
   end record with Volatile;

   for TIM2_Input_Peripheral use record
      CR1              at 16#0# range 0 .. 15;
      CR2              at 16#4# range 0 .. 15;
      SMCR             at 16#8# range 0 .. 31;
      DIER             at 16#C# range 0 .. 15;
      SR               at 16#10# range 0 .. 15;
      EGR              at 16#14# range 0 .. 15;
      CCER             at 16#20# range 0 .. 15;
      CNT              at 16#24# range 0 .. 31;
      PSC              at 16#28# range 0 .. 15;
      ARR              at 16#2C# range 0 .. 31;
      CCR1             at 16#34# range 0 .. 31;
      CCR2             at 16#38# range 0 .. 31;
      CCR3             at 16#3C# range 0 .. 31;
      CCR4             at 16#40# range 0 .. 31;
      DCR              at 16#48# range 0 .. 15;
      DMAR             at 16#4C# range 0 .. 15;
      OR1              at 16#50# range 0 .. 31;
      AF1              at 16#60# range 0 .. 31;
      TISEL            at 16#68# range 0 .. 31;
      CCMR1            at 16#18# range 0 .. 31;
      CCMR2            at 16#1C# range 0 .. 31;
   end record;

   --  TIM2 address block description
   type TIM2_Output_Peripheral is record
      --  TIM2 control register 1
      CR1              : aliased CR1_Register;
      --  TIM2 control register 2
      CR2              : aliased CR2_Register_1;
      --  TIM2 slave mode control register
      SMCR             : aliased SMCR_Register_1;
      --  TIM2 DMA/Interrupt enable register
      DIER             : aliased DIER_Register_1;
      --  TIM2 status register
      SR               : aliased SR_Register_1;
      --  TIM2 event generation register
      EGR              : aliased EGR_Register_1;
      --  TIM2 capture/compare enable register
      CCER             : aliased CCER_Register_1;
      --  TIM2 counter
      CNT              : aliased HAL.UInt32;
      --  TIM2 prescaler
      PSC              : aliased HAL.UInt16;
      --  TIM2 auto-reload register
      ARR              : aliased HAL.UInt32;
      --  TIM2 capture/compare register 1
      CCR1             : aliased HAL.UInt32;
      --  TIM2 capture/compare register 2
      CCR2             : aliased HAL.UInt32;
      --  TIM2 capture/compare register 3
      CCR3             : aliased HAL.UInt32;
      --  TIM2 capture/compare register 4
      CCR4             : aliased HAL.UInt32;
      --  TIM2 DMA control register
      DCR              : aliased DCR_Register;
      --  TIM2 DMA address for full transfer
      DMAR             : aliased HAL.UInt16;
      --  TIM2 option register 1
      OR1              : aliased OR1_Register;
      --  TIM2 alternate function option register 1
      AF1              : aliased AF1_Register_1;
      --  TIM2 timer input selection register
      TISEL            : aliased TISEL_Register_1;
      --  TIM2 capture/compare mode register 1
      CCMR1            : aliased CCMR1_ALTERNATE1_Register;
      --  TIM2 capture/compare mode register 2
      CCMR2            : aliased CCMR2_ALTERNATE1_Register;
   end record with Volatile;

   for TIM2_Output_Peripheral use record
      CR1              at 16#0# range 0 .. 15;
      CR2              at 16#4# range 0 .. 15;
      SMCR             at 16#8# range 0 .. 31;
      DIER             at 16#C# range 0 .. 15;
      SR               at 16#10# range 0 .. 15;
      EGR              at 16#14# range 0 .. 15;
      CCER             at 16#20# range 0 .. 15;
      CNT              at 16#24# range 0 .. 31;
      PSC              at 16#28# range 0 .. 15;
      ARR              at 16#2C# range 0 .. 31;
      CCR1             at 16#34# range 0 .. 31;
      CCR2             at 16#38# range 0 .. 31;
      CCR3             at 16#3C# range 0 .. 31;
      CCR4             at 16#40# range 0 .. 31;
      DCR              at 16#48# range 0 .. 15;
      DMAR             at 16#4C# range 0 .. 15;
      OR1              at 16#50# range 0 .. 31;
      AF1              at 16#60# range 0 .. 31;
      TISEL            at 16#68# range 0 .. 31;
      CCMR1            at 16#18# range 0 .. 31;
      CCMR2            at 16#1C# range 0 .. 31;
   end record;


   --  TIM2 address block description
   TIM2_Input_Periph : aliased TIM2_Input_Peripheral
     with Import, Address => TIM2_Base;

   TIM2_Output_Periph : aliased TIM2_Output_Peripheral
     with Import, Address => TIM2_Base;

   --  TIM3 address block description
   type TIM3_Input_Peripheral is record
      --  TIM3 control register 1
      CR1              : aliased CR1_Register;
      --  TIM3 control register 2
      CR2              : aliased CR2_Register_1;
      --  TIM3 slave mode control register
      SMCR             : aliased SMCR_Register_2;
      --  TIM3 DMA/Interrupt enable register
      DIER             : aliased DIER_Register_1;
      --  TIM3 status register
      SR               : aliased SR_Register_1;
      --  TIM3 event generation register
      EGR              : aliased EGR_Register_1;
      --  TIM3 capture/compare enable register
      CCER             : aliased CCER_Register_1;
      --  TIM3 counter
      CNT              : aliased HAL.UInt32;
      --  TIM3 prescaler
      PSC              : aliased HAL.UInt16;
      --  TIM3 auto-reload register
      ARR              : aliased HAL.UInt32;
      --  TIM3 capture/compare register 1
      CCR1             : aliased HAL.UInt32;
      --  TIM3 capture/compare register 2
      CCR2             : aliased HAL.UInt32;
      --  TIM3 capture/compare register 3
      CCR3             : aliased HAL.UInt32;
      --  TIM3 capture/compare register 4
      CCR4             : aliased HAL.UInt32;
      --  TIM3 DMA control register
      DCR              : aliased DCR_Register;
      --  TIM3 DMA address for full transfer
      DMAR             : aliased HAL.UInt16;
      --  TIM3 option register 1
      OR1              : aliased OR1_Register;
      --  TIM3 alternate function option register 1
      AF1              : aliased AF1_Register_1;
      --  TIM3 timer input selection register
      TISEL            : aliased TISEL_Register_1;
      --  TIM3 capture/compare mode register 1
      CCMR1            : aliased CCMR1_Register;
      --  TIM3 capture/compare mode register 2
      CCMR2            : aliased CCMR2_Register;
   end record with Volatile;

   for TIM3_Input_Peripheral use record
      CR1              at 16#0# range 0 .. 15;
      CR2              at 16#4# range 0 .. 15;
      SMCR             at 16#8# range 0 .. 31;
      DIER             at 16#C# range 0 .. 15;
      SR               at 16#10# range 0 .. 15;
      EGR              at 16#14# range 0 .. 15;
      CCER             at 16#20# range 0 .. 15;
      CNT              at 16#24# range 0 .. 31;
      PSC              at 16#28# range 0 .. 15;
      ARR              at 16#2C# range 0 .. 31;
      CCR1             at 16#34# range 0 .. 31;
      CCR2             at 16#38# range 0 .. 31;
      CCR3             at 16#3C# range 0 .. 31;
      CCR4             at 16#40# range 0 .. 31;
      DCR              at 16#48# range 0 .. 15;
      DMAR             at 16#4C# range 0 .. 15;
      OR1              at 16#50# range 0 .. 31;
      AF1              at 16#60# range 0 .. 31;
      TISEL            at 16#68# range 0 .. 31;
      CCMR1            at 16#18# range 0 .. 31;
      CCMR2            at 16#1C# range 0 .. 31;
   end record;

   --  TIM3 address block description
   type TIM3_Output_Peripheral is record
      --  TIM3 control register 1
      CR1              : aliased CR1_Register;
      --  TIM3 control register 2
      CR2              : aliased CR2_Register_1;
      --  TIM3 slave mode control register
      SMCR             : aliased SMCR_Register_2;
      --  TIM3 DMA/Interrupt enable register
      DIER             : aliased DIER_Register_1;
      --  TIM3 status register
      SR               : aliased SR_Register_1;
      --  TIM3 event generation register
      EGR              : aliased EGR_Register_1;
      --  TIM3 capture/compare enable register
      CCER             : aliased CCER_Register_1;
      --  TIM3 counter
      CNT              : aliased HAL.UInt32;
      --  TIM3 prescaler
      PSC              : aliased HAL.UInt16;
      --  TIM3 auto-reload register
      ARR              : aliased HAL.UInt32;
      --  TIM3 capture/compare register 1
      CCR1             : aliased HAL.UInt32;
      --  TIM3 capture/compare register 2
      CCR2             : aliased HAL.UInt32;
      --  TIM3 capture/compare register 3
      CCR3             : aliased HAL.UInt32;
      --  TIM3 capture/compare register 4
      CCR4             : aliased HAL.UInt32;
      --  TIM3 DMA control register
      DCR              : aliased DCR_Register;
      --  TIM3 DMA address for full transfer
      DMAR             : aliased HAL.UInt16;
      --  TIM3 option register 1
      OR1              : aliased OR1_Register;
      --  TIM3 alternate function option register 1
      AF1              : aliased AF1_Register_1;
      --  TIM3 timer input selection register
      TISEL            : aliased TISEL_Register_1;
      --  TIM3 capture/compare mode register 1
      CCMR1            : aliased CCMR1_ALTERNATE1_Register;
      --  TIM3 capture/compare mode register 2
      CCMR2            : aliased CCMR2_ALTERNATE1_Register;
   end record with Volatile;

   for TIM3_Output_Peripheral use record
      CR1              at 16#0# range 0 .. 15;
      CR2              at 16#4# range 0 .. 15;
      SMCR             at 16#8# range 0 .. 31;
      DIER             at 16#C# range 0 .. 15;
      SR               at 16#10# range 0 .. 15;
      EGR              at 16#14# range 0 .. 15;
      CCER             at 16#20# range 0 .. 15;
      CNT              at 16#24# range 0 .. 31;
      PSC              at 16#28# range 0 .. 15;
      ARR              at 16#2C# range 0 .. 31;
      CCR1             at 16#34# range 0 .. 31;
      CCR2             at 16#38# range 0 .. 31;
      CCR3             at 16#3C# range 0 .. 31;
      CCR4             at 16#40# range 0 .. 31;
      DCR              at 16#48# range 0 .. 15;
      DMAR             at 16#4C# range 0 .. 15;
      OR1              at 16#50# range 0 .. 31;
      AF1              at 16#60# range 0 .. 31;
      TISEL            at 16#68# range 0 .. 31;
      CCMR1            at 16#18# range 0 .. 31;
      CCMR2            at 16#1C# range 0 .. 31;
   end record;

   --  TIM3 address block description
   TIM3_Input_Periph : aliased TIM3_Input_Peripheral
     with Import, Address => TIM3_Base;

   --  TIM3 address block description
   TIM3_Output_Periph : aliased TIM3_Output_Peripheral
     with Import, Address => TIM3_Base;

   --  TIM6 address block description
   type TIM6_Peripheral is record
      --  TIM6 control register 1
      CR1  : aliased CR1_Register_1;
      --  TIM6 control register 2
      CR2  : aliased CR2_Register_2;
      --  TIM6 DMA/Interrupt enable register
      DIER : aliased DIER_Register_2;
      --  TIM6 status register
      SR   : aliased SR_Register_2;
      --  TIM6 event generation register
      EGR  : aliased EGR_Register_2;
      --  TIM6 counter
      CNT  : aliased CNT_Register;
      --  TIM6 prescaler
      PSC  : aliased HAL.UInt16;
      --  TIM6 auto-reload register
      ARR  : aliased HAL.UInt16;
   end record
     with Volatile;

   for TIM6_Peripheral use record
      CR1  at 16#0# range 0 .. 15;
      CR2  at 16#4# range 0 .. 15;
      DIER at 16#C# range 0 .. 15;
      SR   at 16#10# range 0 .. 15;
      EGR  at 16#14# range 0 .. 15;
      CNT  at 16#24# range 0 .. 31;
      PSC  at 16#28# range 0 .. 15;
      ARR  at 16#2C# range 0 .. 15;
   end record;

   --  TIM6 address block description
   TIM6_Periph : aliased TIM6_Peripheral
     with Import, Address => TIM6_Base;

   --  TIM7 address block description
   TIM7_Periph : aliased TIM6_Peripheral
     with Import, Address => TIM7_Base;


   --  TIM15 address block description
   type TIM15_Input_Peripheral is record
      --  TIM15 control register 1
      CR1              : aliased CR1_Register_2;
      --  TIM15 control register 2
      CR2              : aliased CR2_Register_3;
      --  TIM15 slave mode control register
      SMCR             : aliased SMCR_Register_3;
      --  TIM15 DMA/interrupt enable register
      DIER             : aliased DIER_Register_3;
      --  TIM15 status register
      SR               : aliased SR_Register_3;
      --  TIM15 event generation register
      EGR              : aliased EGR_Register_3;
      --  TIM15 capture/compare enable register
      CCER             : aliased CCER_Register_2;
      --  TIM15 counter
      CNT              : aliased CNT_Register;
      --  TIM15 prescaler
      PSC              : aliased HAL.UInt16;
      --  TIM15 auto-reload register
      ARR              : aliased HAL.UInt16;
      --  TIM15 repetition counter register
      RCR              : aliased RCR_Register;
      --  TIM15 capture/compare register 1
      CCR1             : aliased HAL.UInt16;
      --  TIM15 capture/compare register 2
      CCR2             : aliased HAL.UInt16;
      --  TIM15 break and dead-time register
      BDTR             : aliased BDTR_Register_1;
      --  TIM15 DMA control register
      DCR              : aliased DCR_Register;
      --  TIM15 DMA address for full transfer
      DMAR             : aliased HAL.UInt16;
      --  TIM15 alternate register 1
      AF1              : aliased AF1_Register_2;
      --  TIM15 input selection register
      TISEL            : aliased TISEL_Register_2;
      --  TIM15 capture/compare mode register 1
      CCMR1            : aliased CCMR1_Register;
   end record with Volatile;

   for TIM15_Input_Peripheral use record
      CR1              at 16#0# range 0 .. 15;
      CR2              at 16#4# range 0 .. 15;
      SMCR             at 16#8# range 0 .. 31;
      DIER             at 16#C# range 0 .. 15;
      SR               at 16#10# range 0 .. 15;
      EGR              at 16#14# range 0 .. 15;
      CCER             at 16#20# range 0 .. 15;
      CNT              at 16#24# range 0 .. 31;
      PSC              at 16#28# range 0 .. 15;
      ARR              at 16#2C# range 0 .. 15;
      RCR              at 16#30# range 0 .. 15;
      CCR1             at 16#34# range 0 .. 15;
      CCR2             at 16#38# range 0 .. 15;
      BDTR             at 16#44# range 0 .. 31;
      DCR              at 16#48# range 0 .. 15;
      DMAR             at 16#4C# range 0 .. 15;
      AF1              at 16#60# range 0 .. 31;
      TISEL            at 16#68# range 0 .. 31;
      CCMR1            at 16#18# range 0 .. 31;
   end record;

   --  TIM15 address block description
   type TIM15_Output_Peripheral is record
      --  TIM15 control register 1
      CR1              : aliased CR1_Register_2;
      --  TIM15 control register 2
      CR2              : aliased CR2_Register_3;
      --  TIM15 slave mode control register
      SMCR             : aliased SMCR_Register_3;
      --  TIM15 DMA/interrupt enable register
      DIER             : aliased DIER_Register_3;
      --  TIM15 status register
      SR               : aliased SR_Register_3;
      --  TIM15 event generation register
      EGR              : aliased EGR_Register_3;
      --  TIM15 capture/compare enable register
      CCER             : aliased CCER_Register_2;
      --  TIM15 counter
      CNT              : aliased CNT_Register;
      --  TIM15 prescaler
      PSC              : aliased HAL.UInt16;
      --  TIM15 auto-reload register
      ARR              : aliased HAL.UInt16;
      --  TIM15 repetition counter register
      RCR              : aliased RCR_Register;
      --  TIM15 capture/compare register 1
      CCR1             : aliased HAL.UInt16;
      --  TIM15 capture/compare register 2
      CCR2             : aliased HAL.UInt16;
      --  TIM15 break and dead-time register
      BDTR             : aliased BDTR_Register_1;
      --  TIM15 DMA control register
      DCR              : aliased DCR_Register;
      --  TIM15 DMA address for full transfer
      DMAR             : aliased HAL.UInt16;
      --  TIM15 alternate register 1
      AF1              : aliased AF1_Register_2;
      --  TIM15 input selection register
      TISEL            : aliased TISEL_Register_2;
      --  TIM15 capture/compare mode register 1
      CCMR1            : aliased CCMR1_ALTERNATE1_Register_1;
   end record with Volatile;

   for TIM15_Output_Peripheral use record
      CR1              at 16#0# range 0 .. 15;
      CR2              at 16#4# range 0 .. 15;
      SMCR             at 16#8# range 0 .. 31;
      DIER             at 16#C# range 0 .. 15;
      SR               at 16#10# range 0 .. 15;
      EGR              at 16#14# range 0 .. 15;
      CCER             at 16#20# range 0 .. 15;
      CNT              at 16#24# range 0 .. 31;
      PSC              at 16#28# range 0 .. 15;
      ARR              at 16#2C# range 0 .. 15;
      RCR              at 16#30# range 0 .. 15;
      CCR1             at 16#34# range 0 .. 15;
      CCR2             at 16#38# range 0 .. 15;
      BDTR             at 16#44# range 0 .. 31;
      DCR              at 16#48# range 0 .. 15;
      DMAR             at 16#4C# range 0 .. 15;
      AF1              at 16#60# range 0 .. 31;
      TISEL            at 16#68# range 0 .. 31;
      CCMR1            at 16#18# range 0 .. 31;
   end record;

   --  TIM15 address block description
   TIM15_Input_Periph : aliased TIM15_Input_Peripheral
     with Import, Address => TIM15_Base;

   --  TIM15 address block description
   TIM15_Output_Periph : aliased TIM15_Output_Peripheral
     with Import, Address => TIM15_Base;

   --  TIM16 address block description
   type TIM16_Input_Peripheral is record
      --  TIM16 control register 1
      CR1              : aliased CR1_Register_2;
      --  TIM16 control register 2
      CR2              : aliased CR2_Register_4;
      --  TIM16 DMA/interrupt enable register
      DIER             : aliased DIER_Register_4;
      --  TIM16 status register
      SR               : aliased SR_Register_4;
      --  TIM16 event generation register
      EGR              : aliased EGR_Register_4;
      --  TIM16 capture/compare enable register
      CCER             : aliased CCER_Register_3;
      --  TIM16 counter
      CNT              : aliased CNT_Register;
      --  TIM16 prescaler
      PSC              : aliased HAL.UInt16;
      --  TIM16 auto-reload register
      ARR              : aliased HAL.UInt16;
      --  TIM16 repetition counter register
      RCR              : aliased RCR_Register;
      --  TIM16 capture/compare register 1
      CCR1             : aliased HAL.UInt16;
      --  TIM16 break and dead-time register
      BDTR             : aliased BDTR_Register_1;
      --  TIM16 DMA control register
      DCR              : aliased DCR_Register;
      --  TIM16 DMA address for full transfer
      DMAR             : aliased HAL.UInt16;
      --  TIM16 alternate function register 1
      AF1              : aliased AF1_Register_2;
      --  TIM16 input selection register
      TISEL            : aliased TISEL_Register_3;
      --  TIM16 capture/compare mode register 1
      CCMR1            : aliased CCMR1_Register_1;
   end record with Volatile;

   for TIM16_Input_Peripheral use record
      CR1              at 16#0# range 0 .. 15;
      CR2              at 16#4# range 0 .. 15;
      DIER             at 16#C# range 0 .. 15;
      SR               at 16#10# range 0 .. 15;
      EGR              at 16#14# range 0 .. 15;
      CCER             at 16#20# range 0 .. 15;
      CNT              at 16#24# range 0 .. 31;
      PSC              at 16#28# range 0 .. 15;
      ARR              at 16#2C# range 0 .. 15;
      RCR              at 16#30# range 0 .. 15;
      CCR1             at 16#34# range 0 .. 15;
      BDTR             at 16#44# range 0 .. 31;
      DCR              at 16#48# range 0 .. 15;
      DMAR             at 16#4C# range 0 .. 15;
      AF1              at 16#60# range 0 .. 31;
      TISEL            at 16#68# range 0 .. 31;
      CCMR1            at 16#18# range 0 .. 31;
   end record;

      --  TIM16 address block description
   type TIM16_Output_Peripheral is record
      --  TIM16 control register 1
      CR1              : aliased CR1_Register_2;
      --  TIM16 control register 2
      CR2              : aliased CR2_Register_4;
      --  TIM16 DMA/interrupt enable register
      DIER             : aliased DIER_Register_4;
      --  TIM16 status register
      SR               : aliased SR_Register_4;
      --  TIM16 event generation register
      EGR              : aliased EGR_Register_4;
      --  TIM16 capture/compare enable register
      CCER             : aliased CCER_Register_3;
      --  TIM16 counter
      CNT              : aliased CNT_Register;
      --  TIM16 prescaler
      PSC              : aliased HAL.UInt16;
      --  TIM16 auto-reload register
      ARR              : aliased HAL.UInt16;
      --  TIM16 repetition counter register
      RCR              : aliased RCR_Register;
      --  TIM16 capture/compare register 1
      CCR1             : aliased HAL.UInt16;
      --  TIM16 break and dead-time register
      BDTR             : aliased BDTR_Register_1;
      --  TIM16 DMA control register
      DCR              : aliased DCR_Register;
      --  TIM16 DMA address for full transfer
      DMAR             : aliased HAL.UInt16;
      --  TIM16 alternate function register 1
      AF1              : aliased AF1_Register_2;
      --  TIM16 input selection register
      TISEL            : aliased TISEL_Register_3;
      --  TIM16 capture/compare mode register 1
      CCMR1            : aliased CCMR1_ALTERNATE1_Register_2;
   end record with Volatile;

   for TIM16_Output_Peripheral use record
      CR1              at 16#0# range 0 .. 15;
      CR2              at 16#4# range 0 .. 15;
      DIER             at 16#C# range 0 .. 15;
      SR               at 16#10# range 0 .. 15;
      EGR              at 16#14# range 0 .. 15;
      CCER             at 16#20# range 0 .. 15;
      CNT              at 16#24# range 0 .. 31;
      PSC              at 16#28# range 0 .. 15;
      ARR              at 16#2C# range 0 .. 15;
      RCR              at 16#30# range 0 .. 15;
      CCR1             at 16#34# range 0 .. 15;
      BDTR             at 16#44# range 0 .. 31;
      DCR              at 16#48# range 0 .. 15;
      DMAR             at 16#4C# range 0 .. 15;
      AF1              at 16#60# range 0 .. 31;
      TISEL            at 16#68# range 0 .. 31;
      CCMR1            at 16#18# range 0 .. 31;
   end record;

   --  TIM16 address block description
   TIM16_Input_Periph : aliased TIM16_Input_Peripheral
     with Import, Address => TIM16_Base;

   --  TIM16 address block description
   TIM16_Output_Periph : aliased TIM16_Output_Peripheral
     with Import, Address => TIM16_Base;

end STM32_SVD.TIM;
