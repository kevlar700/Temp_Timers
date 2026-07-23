--  with STM32_SVD.LPTIM;
with STM32.NVIC;

--  This child package simply facilitates a nice way to select a timer device
--  within an IDE whilst allowing the user to avoid importing the SVD whilst
--  maintaining a tight and straight forward coupling to the SVD. They are
--  named as described in the reference manual

package STM32.Devices.Timers is

   --  TIM2_Base : constant System.Address := System'To_Address (16#40000000#);
   --  TIM3_Base : constant System.Address := System'To_Address (16#40000400#);
   --  TIM4_Base : constant System.Address := System'To_Address (16#40000800#);
   --  TIM5_Base : constant System.Address := System'To_Address (16#40000C00#);
   --  TIM15_Base : constant System.Address := System'To_Address
   --  (16#40014000#); TIM16_Base : constant System.Address :=
   --  System'To_Address (16#40014400#); TIM17_Base : constant System.Address
   --  := System'To_Address (16#40014800#); TIM1_Base : constant System.Address
   --  := System'To_Address (16#40012C00#); TIM8_Base : constant System.Address
   --  := System'To_Address (16#40013400#); TIM6_Base : constant System.Address
   --  := System'To_Address (16#40001000#); TIM7_Base : constant System.Address
   --  := System'To_Address (16#40001400#); LPTIM1_Base : constant
   --  System.Address := System'To_Address (16#40007C00#); LPTIM2_Base
   --  : constant System.Address := System'To_Address (16#40009400#);

   --  type Timer_T is
   --    (General_2,
   --     General_5,
   --     Advanced_1,
   --     General_3,
   --     General_4,
   --     Advanced_8,
   --     Basic_6,
   --     Basic_7,
   --     Low_Power_1,
   --     Low_Power_2,
   --     General_15,
   --     General_16,
   --     General_17);
   --
   --  subtype Counter_Mode_16 is Timer_T range Advanced_1 .. Advanced_8;
   --  subtype Counter_Mode_32 is Timer_T range General_2 .. General_5;
   --
   --  subtype Counter_16_Bit is Timer_T range Advanced_1 .. General_17;
   --
   --  subtype General_Modeless is Timer_T range General_15 .. General_17;
   --
   --  subtype Basic_Pulse is Timer_T range Basic_6 .. Basic_7;
   --
   --  subtype Low_Power is Timer_T range Low_Power_1 .. Low_Power_2; -- TODO
   --
   --  subtype All_Counter_Mode_Timers is Timer_T range General_2 ..
   --  Advanced_8;

   type Timer_T is
     (General_2,
      General_3,
      Basic_6,
      Basic_7,
      Advanced_1,
      General_15,
      General_16);

   type Timer_IRQ_T is record
      Number : Timer_T := General_16;
      IRQ    : STM32.NVIC.Timer_IRQ_Number := STM32.NVIC.TIM_1_CC;
   end record;

   General_2_IRQ : constant Timer_IRQ_T :=
     (Number => General_2, IRQ => STM32.NVIC.TIM_2);

   General_3_IRQ : constant Timer_IRQ_T :=
     (Number => General_3, IRQ => STM32.NVIC.Tim_3_4);

   Basic_6_IRQ : constant Timer_IRQ_T :=
     (Number => Basic_6, IRQ => STM32.NVIC.TIM_6_DAC_LPTIM1);

   Basic_7_IRQ : constant Timer_IRQ_T :=
     (Number => Basic_7, IRQ => STM32.NVIC.TIM_7_LPTIM2);

   Advanced_1_IRQ : constant Timer_IRQ_T :=
     (Number => Advanced_1, IRQ => STM32.NVIC.TIM_1_BRK_UP_TRG_COM);

   Advanced_1_IRQ_CC : constant Timer_IRQ_T :=
     (Number => Advanced_1, IRQ => STM32.NVIC.TIM_1_CC);

   General_15_IRQ : constant Timer_IRQ_T :=
     (Number => General_15, IRQ => STM32.NVIC.TIM_15);

   General_16_IRQ : constant Timer_IRQ_T :=
     (Number => General_16, IRQ => STM32.NVIC.TIM_16_FDCAN_IT_0);

   --  for Timer_T use
   --    (General_2   => 16#4000_0000#,
   --     General_3   => 16#4000_0400#,
   --     General_4   => 16#4000_0800#,
   --     General_5   => 16#4000_0C00#,
   --     Basic_6     => 16#4000_1000#,
   --     Basic_7     => 16#4000_1400#,
   --     Low_Power_1 => 16#4000_7C00#,
   --     Low_Power_2 => 16#4000_9400#,
   --     Advanced_1  => 16#4001_2C00#,
   --     Advanced_8  => 16#4001_3400#,
   --     General_15  => 16#4001_4000#,
   --     General_16  => 16#4001_4400#,
   --     General_17  => 16#4001_4800#);

   subtype General_4_Channel is Timer_T range General_2 .. General_3;

   subtype General_2_Channel is Timer_T
   with Static_Predicate => General_2_Channel in General_15;

   subtype General_1_Channel is Timer_T
   with Static_Predicate => General_1_Channel in General_16;

   subtype Advanced is Timer_T with Static_Predicate => Advanced in Advanced_1;

   --  Timers with a mode (CR1.CMS) that are 16 bit. If you want all 16 Bit
   --  timers then see Counter_16_Bit
   subtype Counter_Mode_16 is Timer_T
   with Static_Predicate => Counter_Mode_16 in Advanced_1 | General_3;

   --  Timers with a mode (CR1.CMS) that are 32 bit. If you want all 32 Bit
   --  timers then see Counter_16_Bit
   subtype Counter_Mode_32 is Timer_T
   with Static_Predicate => Counter_Mode_32 in General_2;

   subtype Counter_Mode is Timer_T
   with Static_Predicate => Counter_Mode in Counter_Mode_16 | Counter_Mode_32;

   subtype Configurable_Direction is Timer_T
   with
     Static_Predicate =>
       Configurable_Direction in Advanced_1 | General_2 | General_3;

   subtype Counter_16_Bit is Timer_T
   with Static_Predicate => Counter_16_Bit not in Counter_Mode_32;

   subtype Basic is Timer_T range Basic_6 .. Basic_7;

   subtype General_Modeless is Timer_T range General_15 .. General_16;

   --  See RCC_APBENR1
   subtype PCLK1 is Timer_T
   with
     Static_Predicate =>
       PCLK1
       in Advanced_1
        | General_2
        | General_3
        | Basic_6
        | Basic_7
        | General_15
        | General_16;

   --  Advanced_1 : aliased STM32_SVD.TIM.TIM1_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM1_Base;
   --     --  Advanced-control timers(TIM1/TIM8)
   --
   --  Advanced_8 : aliased STM32_SVD.TIM.TIM8_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM8_Base;
   --     --  Advanced-control timers(TIM1/TIM8)
   --
   --  General_2 : aliased STM32_SVD.TIM.TIM2_Peripheral with
   --     Import,
   --     Volatile,
   --     Address          => STM32_SVD.TIM2_Base,
   --     Async_Readers    => True,
   --     Async_Writers    => True,
   --     Effective_Reads  => True,
   --     Effective_Writes => True;
   --     --  General-purpose timers (TIM2/TIM3/TIM4/TIM5)
   --
   --  General_3 : aliased STM32_SVD.TIM.TIM3_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM3_Base;
   --     --  General-purpose timers (TIM2/TIM3/TIM4/TIM5)
   --
   --  General_4 : aliased STM32_SVD.TIM.TIM3_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM4_Base;
   --     --  General-purpose timers (TIM2/TIM3/TIM4/TIM5)
   --
   --  General_5 : aliased STM32_SVD.TIM.TIM2_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM5_Base;
   --     --  General-purpose timers (TIM2/TIM3/TIM4/TIM5)
   --
   --  General_15 : aliased STM32_SVD.TIM.TIM15_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM15_Base;
   --     --  General-purpose timer 15 (TIM15)
   --
   --  General_16 : aliased STM32_SVD.TIM.TIM16_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM16_Base;
   --     --  General-purpose timers (TIM16/TIM17)
   --
   --  General_17 : aliased STM32_SVD.TIM.TIM17_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM17_Base;
   --     --  General-purpose timers (TIM16/TIM17)
   --
   --  Basic_6 : aliased STM32_SVD.TIM.TIM6_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM6_Base;
   --     --  Basic timers (TIM6/TIM7)
   --
   --     --  Note driver already provided for sys_timer
   --  Basic_7 : aliased STM32_SVD.TIM.TIM6_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.TIM7_Base;
   --     --  Basic timers (TIM6/TIM7)
   --
   --  Low_Power_1 : aliased STM32_SVD.LPTIM.LPTIM_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.LPTIM1_Base;
   --     --  Low power timers (LPTIM1/LPTIM2)
   --
   --  Low_Power_2 : aliased STM32_SVD.LPTIM.LPTIM_Peripheral with
   --     Import,
   --     Volatile,
   --     Address => STM32_SVD.LPTIM2_Base;
   --     --  Low power timers (LPTIM1/LPTIM2)

end STM32.Devices.Timers;
