!-Rely On Once due to IDE Navigation Bugs-!  OMIT('*** ifdef ctReadWriter_Base ***',IFDEF_ctReadWriter_Base)
!-Rely On Once due to IDE Navigation Bugs-!IFDEF_ctReadWriter_Base EQUATE(1)

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

  INCLUDE('cwSynchM.inc'),ONCE
  
ctReaderWriter_Base CLASS,TYPE,MODULE('ctReaderWriter_Base.clw'),Link('ctReaderWriter_Base.clw')!,_LINKMode),DLL(_DLLMode)
RWLock                  &IReaderWriterLock,PROTECTED
Construct               PROCEDURE
Destruct                PROCEDURE
                      END

!!!Usage: oReader     ctReaderWriter_Reader
!!!       CODE
!!!       oReader.Wait( SELF.Shared_ReaderWriterLock )
!!!       !do stuff
!!!       !DISPOSE(oReader) !or just let it occur
ctReaderWriter_Reader CLASS,TYPE,MODULE('ctReaderWriter_Base.clw'),Link('ctReaderWriter_Base.clw')!,_LINKMode),DLL(_DLLMode)
Reader                  &ISyncObject
Wait                    PROCEDURE(*IReaderWriterLock xaRWLock)  
Destruct                PROCEDURE
                      END

!!!Usage: oWriter     ctReaderWriter_Writer
!!!       CODE
!!!       oWriter.Wait( SELF.Shared_ReaderWriterLock )
!!!       !do stuff
!!!       !DISPOSE(oWriter) !or just let it occur
ctReaderWriter_Writer CLASS,TYPE,MODULE('ctReaderWriter_Base.clw'),Link('ctReaderWriter_Base.clw')!,_LINKMode),DLL(_DLLMode)
Writer                  &ISyncObject
Wait                    PROCEDURE(*IReaderWriterLock xaRWLock)
Destruct                PROCEDURE
                      END
                      
                      
  !END-OMIT('*** ifdef ctReadWriter_Base ***',IFDEF_ctReadWriter_Base)


