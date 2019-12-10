@echo off
title file explorer 2.0

:main
cls
echo %cd%
SET /P userInp=Do you want to make/open a directory or make a .txt file or go back a directory or show a tree of a directory(d/f/t/b/e): 
IF %userInp%==d GOTO :directory
IF %userInp%==D GOTO :directory
IF %userInp%==f GOTO :create_file
IF %userInp%==F GOTO :create_file
IF %userInp%==t GOTO :tree
IF %userInp%==T GOTO :tree
IF %userInp%==b GOTO :go_back
IF %userInp%==B GOTO :go_back
IF %userInp%==E GOTO :exit
IF %userInp%==e GOTO :exit
echo INVALID INPUT
pause
GOTO :main

:go_back
cd ..
GOTO main

:tree
cls
echo %cd%
SET /P userInp=What folder would you like to see the tree of: 
tree %userInp% /f
pause
GOTO :main

:directory
cls
echo %cd%
SET /P userInp=Do you want to open or create or delete a directory(o/c/d/b)
IF %userInp%==o GOTO :directory_exist_open
IF %userInp%==O GOTO :directory_exist_open
IF %userInp%==c GOTO :create_directory
IF %userInp%==C GOTO :create_directory
IF %userInp%==d GOTO :directory_exist_del
IF %userInp%==D GOTO :directory_exist_del
IF %userInp%==B GOTO :main
IF %userInp%==b GOTO :main
echo INVALID INPUT
pause
GOTO :directory

:file
cls
echo %cd%
SET /P userInp=Do you want to create or delete a file(c/d/b)
IF %userInp%==c GOTO :create_file
IF %userInp%==C GOTO :create_file
IF %userInp%==b GOTO :main
IF %userInp%==B GOTO :main
echo INVALID INPUT
GOTO :main

:create_directory
cls
echo %cd%
SET /P userInp=What do you want to call the directory: 
md %userInp%
cls
echo %cd%
echo Directory created!
pause
GOTO :main

:directory_exist_del
cls
echo %cd%
SET /P userInp=What directory do you want to delete
IF EXIST %userInp% GOTO :del_directory
cls
echo %cd%
echo Directory doesn't exist
pause
echo INVALID INPUT
GOTO :directory

:del_directory
cls
echo %cd%
rmdir %userInp%
echo directory deleted
pause
echo INVALID INPUT
GOTO :main

:directory_exist_open
cls
echo %cd%
SET /P userInp=What directory do you want to open: 
IF EXIST %userInp% GOTO :open_directory
cls
echo %cd%
echo Directory doesn't exist
pause
GOTO :directory

:open_directory
cls
cd .\%userInp%
echo %cd%
pause
GOTO :main

:create_file
cls
echo %cd%
SET /P userInp=What do you want to call the file: 
echo > %userInp%.txt
cls
echo File created!
pause
GOTO :main

:exit
cd u:\
cls
echo %cd%
echo Goodbye!
pause