  MEMBER
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
