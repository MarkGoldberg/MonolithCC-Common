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
  INCLUDE('ctReaderWriter_Base.inc'),ONCE
  
!region Base  
ctReaderWriter_Base.Construct     PROCEDURE
  CODE
  SELF.RWLock &= NewReaderWriterLock()

ctReaderWriter_Base.Destruct PROCEDURE  
  CODE
  IF ~(SELF.RWLock &= NULL)
       SELF.RWLock.Kill
  END 
!endRegion Base

!Region Reader
ctReaderWriter_Reader.Wait     PROCEDURE(*IReaderWriterLock xaRWLock)  
  CODE
  SELF.Reader &= xaRWLock.Reader()
  SELF.Reader.Wait()
  
ctReaderWriter_Reader.Destruct PROCEDURE
  CODE
  IF ~SELF.Reader &= NULL
      SELF.Reader.Release()
  END
!endRegion Reader

!Region Writer
ctReaderWriter_Writer.Wait     PROCEDURE(*IReaderWriterLock xaRWLock)  
  CODE
  SELF.Writer &= xaRWLock.Writer()
  SELF.Writer.Wait()
  
ctReaderWriter_Writer.Destruct PROCEDURE
  CODE
  IF ~SELF.Writer &= NULL
      SELF.Writer.Release()
  END
!endRegion Reader
