::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: �T�N���G�f�B�^ Grep & Replace - encoding: SJIS
::
::   sakura-gr Grep�I�v�V���� "�u���O" "�u����" "�t�@�C��" "�t�H���_"
::
:: (example)
::   sakura-gr SU "��" "��" "*.txt" ".\child"
::   sakura-gr N "��" "" "*.txt" ".\space folder"
::
:: ��P����: Grep�I�v�V����
::   S - �T�u�t�H���_���������
::   L - �啶���Ə����������
::   R - ���K�\��
::   P - �Y���s���o�́^���w�莞�͊Y�����������o��
::   W - �P��P�ʂŒT��
::   U - �����I�ɕ���
::   N - �Ȃ�
::
:: http://sakura.qp.land.to/?cmd=read&page=History%2F2.2.0.1
:: ��2.2.0.1�ɂ͈ȉ��̃o�O������܂�
::   - ���K�\����Grep�u���ōs����1�߂����u������Ȃ�
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off
setlocal enabledelayedexpansion
set PATH=C:\Windows\System32
set PATH=%PATH%;C:\Program Files\sakura;C:\Program Files (x86)\sakura;
set OPT=%1
set SRCH_STR=%2
set REPR_STR=%3
set FILE_PTN=%4
set FOLD_PTN=%5

:: �����`�F�b�N�i�A�X�^���X�N�̎g�p�������ɑz�肳��邽�� %* �J�E���g�����������j
if     "%~1"=="" goto INVALID_ARG
if     "%~2"=="" goto INVALID_ARG
::     "%~3"=="" ���u�����N�w��ɂ�镶���폜������
if     "%~4"=="" goto INVALID_ARG
if     "%~5"=="" goto INVALID_ARG
if not "%~6"=="" goto INVALID_ARG

:: �I�v�V���� N �̏���
if "%OPT%"=="N" (set OPT=)

:: �_�u���N�H�[�e�[�V��������
if not %FILE_PTN:~0,1%%FILE_PTN:~-1% == "" goto DQ_REQUIRED
if not %FOLD_PTN:~0,1%%FOLD_PTN:~-1% == "" goto DQ_REQUIRED

:: �T�N���G�f�B�^ �����v���Z�X�m�F
set TASK=""
for /f "delims=" %%A in ('tasklist ^| find /C "sakura.exe"') do set TASK=%%A
if %TASK% GTR 0 (
  echo.
  echo sakura-gr:
  echo   ���ɃT�N���G�f�B�^���J���Ă��܂��B���ׂĕ��Ă�����s���Ă��������B
  echo   �A�����Ďg���ꍇ�͎��O�� sakura-gr �����������ŌĂяo���A���ʐݒ�
  echo   �ɂāu�^�X�N�g���C���g���v�̃`�F�b�N���O���Ă��������B
  echo.
  goto OVER
)

call sakura -SX=700 -SY=500 -GREPMODE -GKEY=%SRCH_STR% -GREPR=%REPR_STR% -GFILE=%FILE_PTN% -GFOLDER=%FOLD_PTN% -GCODE=99 -GOPT=%OPT%
goto OVER

:INVALID_ARG
echo.
echo sakura-gr:
echo   �������s���ł��B
echo.
goto EXAMPLE

:DQ_REQUIRED
echo.
echo sakura-gr:
echo   �I�v�V�����ȊO�̊e�����́u"�v���p���ł������Ă��������B
echo.
goto EXAMPLE

:EXAMPLE
echo   (example)
echo     sakura-gr SU "��" "��" "*.txt" ".\child"
echo     sakura-gr N "��" "" "*.txt" ".\space folder"
echo.
echo   (you)
echo     sakura-gr %1 %2 %3 %4 %5
echo.

:OVER
endlocal
exit /b
