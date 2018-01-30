!-Rely On Once due to IDE Navigation Bugs-! OMIT('*** ifdef ctReadWriter_Types ***',IFDEF_ctReadWriter_Types)
!-Rely On Once due to IDE Navigation Bugs-!IFDEF_ctReadWriter_Types EQUATE(1)

!Region Notices
! ================================================================================
! Notice : Copyright (C) 2014-2018, Monolith Custom Computing, Inc.
!          Distributed under MIT (https://opensource.org/licenses/MIT) 
! 
!    This file is part of Monolith-Common (https://github.com/MarkGoldberg/MonolithCC-Common) 
! 
!    MonolithCC-Common is free software: you can redistribute it and/or modify 
!    it under the terms of the MIT License as published by 
!    the Open Source Initiative. 
! 
!    MonolithCC-Common is distributed in the hope that it will be useful, 
!    but WITHOUT ANY WARRANTY; without even the implied warranty of 
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
!    MIT License for more details. 
! 
!    You should have received a copy of the MIT License 
!    along with MonolithCC-Common.  If not, see <https://opensource.org/licenses/MIT>. 
! ================================================================================
!EndRegion Notices

  INCLUDE('ctReaderWriter_Base.inc'),ONCE
  
ctReaderWriter_Long CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
Value                LONG,PRIVATE
Construct            PROCEDURE
Get                  PROCEDURE(),LONG
Set                  PROCEDURE(LONG xNewValue)
Plus1                PROCEDURE()
Minus1               PROCEDURE()
                    END
                    
ctReaderWriter_Signed CLASS(ctReaderWriter_Long),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
                      END
ctReaderWriter_HWND   CLASS(ctReaderWriter_Long),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
                      END
                      

ctReaderWriter_Byte CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
Value                BYTE,PRIVATE
Construct            PROCEDURE
Get                  PROCEDURE(),BYTE
Set                  PROCEDURE(BYTE xNewValue)
Plus1                PROCEDURE()
Minus1               PROCEDURE()
                    END
                      

ctReaderWriter_Bool CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
Value                BOOL,PRIVATE
Construct            PROCEDURE
Get                  PROCEDURE(),BOOL
Set                  PROCEDURE(BOOL xNewValue)
                    END
                    
                    

ctReaderWriter_Real CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
Value                REAL,PRIVATE
Construct            PROCEDURE
Get                  PROCEDURE(),REAL
Set                  PROCEDURE(REAL xNewValue)
                    END
                    

ctReaderWriter_Window CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
Value                &WINDOW,PRIVATE
Construct            PROCEDURE
Get                  PROCEDURE(),*WINDOW
Set                  PROCEDURE(*WINDOW xNewValue)
                    END

ctReaderWriter_String CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
Value                &STRING,PRIVATE   !consider ctMGStr
Init                 PROCEDURE(LONG xLen, <STRING xNewValue>)
GetSize              PROCEDURE(),LONG
Construct            PROCEDURE
Get                  PROCEDURE(),STRING
Set                  PROCEDURE(STRING xNewValue)
                    END

ctReaderWriter_CString CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
Value                &CSTRING,PRIVATE   !consider ctMGStr
Init                 PROCEDURE(LONG xLen, <STRING xNewValue>)
GetSize              PROCEDURE(),LONG
Construct            PROCEDURE
Get                  PROCEDURE(),STRING
Set                  PROCEDURE(STRING xNewValue)
                    END


ctReaderWriter_Date CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
Value                Date,PRIVATE
Construct            PROCEDURE
Get                  PROCEDURE(),Date
Set                  PROCEDURE(Date xNewValue)
SetNow               PROCEDURE()
                    END    
                    
ctReaderWriter_Time CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
Value                Time,PRIVATE
Construct            PROCEDURE
Get                  PROCEDURE(),Time
Set                  PROCEDURE(Time xNewValue)
SetNow               PROCEDURE()
                    END

ctReaderWriter_DateTime CLASS(ctReaderWriter_Base),TYPE,MODULE('ctReaderWriter_Types.clw'),LINK('ctReaderWriter_Types.clw')
ValueD                Date,PRIVATE
ValueT                Time,PRIVATE
Construct            PROCEDURE
Get                  PROCEDURE(*DATE outDate, *TIME outTime)
GetDate              PROCEDURE(),DATE
GetTime              PROCEDURE(),TIME
SetDate              PROCEDURE(DATE xNewValue)
SetTime              PROCEDURE(TIME xNewValue)
Set                  PROCEDURE(Date xNewDate, TIME xNewTime)
SetNow               PROCEDURE()
                    END    
                    
                    
                    
 !END-OMIT('*** ifdef ctReadWriter_Types ***',IFDEF_ctReadWriter_Types)                    

  
