library i723_32;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  View-Project Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the DELPHIMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using DELPHIMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  Classes,
  I723_v20 in 'i723_v20.pas';

exports
       Inicializar,
       ApagaTodo,
       EscribeMotor,
       EscribeSalida,
       LeeMotor,
       LeeSalida,
       LeeSensor,
       out,
       inp;

begin
end.
