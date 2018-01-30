!-Rely On Once due to IDE Navigation Bugs-!  OMIT('*** ifdef ctReadWriter_Base ***',IFDEF_ctReadWriter_Base)
!-Rely On Once due to IDE Navigation Bugs-!IFDEF_ctReadWriter_Base EQUATE(1)

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


