 MEMBER()

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

 MAP
 END
 INCLUDE('ctReaderWriter_Types.inc'),ONCE
 
 
!Region ctReaderWriter_Long 
ctReaderWriter_Long.Construct             PROCEDURE
  CODE
  SELF.Value = 0
  
ctReaderWriter_Long.Get                  PROCEDURE()!,LONG
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  RETURN SELF.Value
  
  
ctReaderWriter_Long.Set                  PROCEDURE(LONG xNewValue)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value = xNewValue
  
ctReaderWriter_Long.Plus1                 PROCEDURE()
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value += 1
  
ctReaderWriter_Long.Minus1                 PROCEDURE()
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value -= 1
  
  
!EndRegion ctReaderWriter_Long   


!Region ctReaderWriter_Bool
ctReaderWriter_Bool.Construct             PROCEDURE
  CODE
  SELF.Value = 0
  
ctReaderWriter_Bool.Get                  PROCEDURE()!,Byte
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  RETURN SELF.Value
  
  
ctReaderWriter_Bool.Set                  PROCEDURE(BOOL xNewValue)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value = xNewValue
!EndRegion ctReaderWriter_Bool


 
!Region ctReaderWriter_Byte 
ctReaderWriter_Byte.Construct             PROCEDURE
  CODE
  SELF.Value = 0
  
ctReaderWriter_Byte.Get                  PROCEDURE()!,Byte
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  RETURN SELF.Value
  
  
ctReaderWriter_Byte.Set                  PROCEDURE(Byte xNewValue)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value = xNewValue
  
ctReaderWriter_Byte.Plus1                 PROCEDURE()
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value += 1
  
ctReaderWriter_Byte.Minus1                 PROCEDURE()
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value -= 1
  
  
!EndRegion ctReaderWriter_Byte                                          
                                         
                                  

!Region ctReaderWriter_Real 
ctReaderWriter_Real.Construct             PROCEDURE
  CODE
  SELF.Value = 0
  
ctReaderWriter_Real.Get                  PROCEDURE()!,Real
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  RETURN SELF.Value
  
  
ctReaderWriter_Real.Set                  PROCEDURE(Real xNewValue)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value = xNewValue
  
!EndRegion ctReaderWriter_Real   


!Region ctReaderWriter_Window
ctReaderWriter_Window.Construct             PROCEDURE
  CODE
  SELF.Value &= NULL
  
ctReaderWriter_Window.Get                  PROCEDURE()!,*WINDOW
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  RETURN SELF.Value
  
  
ctReaderWriter_Window.Set                  PROCEDURE(*Window xNewValue)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value &= xNewValue
  
!EndRegion ctReaderWriter_Window


!Region ctReaderWriter_String
ctReaderWriter_String.Construct             PROCEDURE
  CODE
  SELF.Value &= NULL
  
ctReaderWriter_String.Init                 PROCEDURE(LONG xLen, <STRING xNewValue>)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value &= NEW STRING(xLen)
  IF ~OMITTED(xNewValue)
     SELF.Value = xNewValue
  END
ctReaderWriter_String.GetSize              PROCEDURE()!,LONG  
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  IF SELF.Value &= NULL
     RETURN 0
  END
  RETURN SIZE(SELF.Value)
  
  
ctReaderWriter_String.Get                  PROCEDURE()!,String
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  IF SELF.Value &= NULL
     RETURN ''
  END
  RETURN SELF.Value
  
  
ctReaderWriter_String.Set                  PROCEDURE(STRING xNewValue)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value = xNewValue
  
!EndRegion ctReaderWriter_String


!Region ctReaderWriter_CString
ctReaderWriter_CString.Construct             PROCEDURE
  CODE
  SELF.Value &= NULL
  
ctReaderWriter_CString.Init                 PROCEDURE(LONG xLen, <STRING xNewValue>)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value &= NEW CSTRING(xLen)  !<-- consdier a + 1 
  IF ~OMITTED(xNewValue)
     SELF.Value = xNewValue
  END
ctReaderWriter_CString.GetSize              PROCEDURE()!,LONG  
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  IF SELF.Value &= NULL
     RETURN 0
  END
  RETURN SIZE(SELF.Value)
  
  
ctReaderWriter_CString.Get                  PROCEDURE()!,String
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  IF SELF.Value &= NULL
     RETURN ''
  END
  RETURN SELF.Value
  
  
ctReaderWriter_CString.Set                  PROCEDURE(STRING xNewValue)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value = xNewValue
  
!EndRegion ctReaderWriter_CString


!Region ctReaderWriter_Date 
ctReaderWriter_Date.Construct             PROCEDURE
  CODE
  SELF.Value = 0
  
ctReaderWriter_Date.Get                  PROCEDURE()!,Date
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  RETURN SELF.Value
 
ctReaderWriter_Date.Set                  PROCEDURE(Date xNewValue)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value = xNewValue
  
ctReaderWriter_Date.SetNow                 PROCEDURE()
  CODE
  SELF.Set(TODAY())

  
!EndRegion ctReaderWriter_Date                                            
   
!Region ctReaderWriter_Time 
ctReaderWriter_Time.Construct             PROCEDURE
  CODE
  SELF.Value = 0
  
ctReaderWriter_Time.Get                  PROCEDURE()!,Time
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  RETURN SELF.Value
 
ctReaderWriter_Time.Set                  PROCEDURE(Time xNewValue)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.Value = xNewValue
  
ctReaderWriter_Time.SetNow                 PROCEDURE()
  CODE
  SELF.Set(Clock())
  
!EndRegion ctReaderWriter_Time                                             
   


!Region ctReaderWriter_DateTime 
ctReaderWriter_DateTime.Construct             PROCEDURE
  CODE
  SELF.ValueD = 0
  SELF.ValueT = 0
  
ctReaderWriter_DateTime.Get                  PROCEDURE(*DATE outDate, *TIME outTime)
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )  
  outDate = SELF.ValueD
  outTime = SELF.ValueT
                     
ctReaderWriter_DateTime.GetDate              PROCEDURE()!,DATE
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  RETURN SELF.ValueD
  
ctReaderWriter_DateTime.GetTime              PROCEDURE()!,TIME
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  RETURN SELF.ValueT
  
ctReaderWriter_DateTime.SetDate              PROCEDURE(DATE xNewValue)
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  SELF.ValueD = xNewValue
  
ctReaderWriter_DateTime.SetTime              PROCEDURE(TIME xNewValue)
oReader    ctReaderWriter_Reader
  CODE
  oReader.Wait( SELF.RWLock )
  SELF.ValueT = xNewValue
                     
 
ctReaderWriter_DateTime.Set                  PROCEDURE(Date xNewDate, TIME xNewTime)
oWriter     ctReaderWriter_Writer
  CODE
  oWriter.Wait( SELF.RWLock )
  SELF.ValueD = xNewDate
  SELF.ValueT = xNewTime
  
ctReaderWriter_DateTime.SetNow                 PROCEDURE()
  CODE
  SELF.Set(TODAY(), Clock())
  
!EndRegion ctReaderWriter_DateTime
                                             
   
