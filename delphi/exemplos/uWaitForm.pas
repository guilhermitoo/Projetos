unit uWaitForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXCtrls;

type
  TWaitForm = class(TForm)
    WaitMessage: TLabel;
    WaitTitle: TLabel;
    Panel1: TPanel;
    ActivityIndicator1: TActivityIndicator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  strict private
    class var FException: Exception;
  private
    class var WaitForm : TWaitForm;
    class procedure OnTerminateTask(Sender: TObject);
    class procedure HandleException;
    class procedure DoHandleException;
  public
    class procedure Start(const ATitle: String; const ATask: TProc);
    class procedure Status(AMessage : String);
  end;

implementation

{$R *.dfm}

procedure TWaitForm.FormCreate(Sender: TObject);
begin
  ActivityIndicator1.Animate := True;
end;

procedure TWaitForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

class procedure TWaitForm.Start(const ATitle: String; const ATask: TProc);
var
  T : TThread;
begin
  {$IFNDEF SERVICE_APPLICATION}
    if (not Assigned(WaitForm))then
      WaitForm := TWaitForm.Create(nil);
  {$ENDIF}

  T := TThread.CreateAnonymousThread(
  procedure
  begin
    try
      ATask;
    except
      HandleException;
    end;
  end);

  T.OnTerminate := OnTerminateTask;
  T.FreeOnTerminate := True;
  T.Start;

  {$IFNDEF SERVICE_APPLICATION}
    if ( ATitle = '' ) then
      WaitForm.WaitTitle.Caption := 'Processando...Aguarde...'
    else
      WaitForm.WaitTitle.Caption := ATitle;
    WaitForm.ShowModal;
  {$ENDIF}

  DoHandleException;
end;

class procedure TWaitForm.Status(AMessage: String);
begin
  {$IFNDEF SERVICE_APPLICATION}
    TThread.Synchronize(TThread.CurrentThread,
    procedure
    begin
      if (Assigned(WaitForm)) then
      begin
        WaitForm.WaitMessage.Caption := AMessage;
        WaitForm.Update;
      end;
    end);
  {$ENDIF}
end;

class procedure TWaitForm.OnTerminateTask(Sender: TObject);
begin
  {$IFNDEF SERVICE_APPLICATION}
    if (Assigned(WaitForm)) then
    begin
      WaitForm.Close;
      WaitForm := nil;
    end;
  {$ENDIF}
end;

class procedure TWaitForm.HandleException;
begin
  FException := Exception(AcquireExceptionObject);
end;

class procedure TWaitForm.DoHandleException;
begin
  if (Assigned(FException)) then
  begin
    try
      if (FException is Exception) then
        raise FException at ReturnAddress;
    finally
      FException := nil;
      ReleaseExceptionObject;
    end;
  end;
end;

end.
