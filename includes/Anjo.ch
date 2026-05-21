/*----------------------------------------------------------------------------//
!short: ButtonBar Commands */

#xcommand DEFINE BUTTONBAR [ <oBar> ] ;
     [ <size: SIZE, BUTTONSIZE, SIZEBUTTON > <nWidth>, <nHeight> ] ;
     [ <_3d: 3D, 3DLOOK> ] ;
     [ <mode: TOP, LEFT, RIGHT, BOTTOM, FLOAT> ] ;
     [ <wnd: OF, WINDOW, DIALOG> <oWnd> ] ;
     [ CURSOR <oCursor> ] ;
    => ;
  [ <oBar> := ] TBar():New( <oWnd>, <nWidth>, <nHeight>, <._3d.>,;
     [ Upper(<(mode)>) ], <oCursor> )

#xcommand @ <nRow>, <nCol> BUTTONBAR [ <oBar> ] ;
     [ SIZE <nWidth>, <nHeight> ] ;
     [ BUTTONSIZE <nBtnWidth>, <nBtnHeight> ] ;
     [ <_3d: 3D, 3DLOOK> ] ;
     [ <mode: TOP, LEFT, RIGHT, BOTTOM, FLOAT> ] ;
     [ <wnd: OF, WINDOW, DIALOG> <oWnd> ] ;
     [ CURSOR <oCursor> ] ;
    => ;
  [ <oBar> := ] TBar():NewAt( <nRow>, <nCol>, <nWidth>, <nHeight>,;
     <nBtnWidth>, <nBtnHeight>, <oWnd>, <._3d.>, [ Upper(<(mode)>) ],;
     <oCursor> )

#xcommand DEFINE BUTTON [ <oBtn> ] ;
     [ <bar: OF, BUTTONBAR > <oBar> ] ;
     [ <resource: NAME, RESNAME, RESOURCE> <cResName1> ;
   [,<cResName2>[,<cResName3>] ] ] ;
     [ <file: FILE, FILENAME, DISK> <cBmpFile1> ;
   [,<cBmpFile2>[,<cBmpFile3>] ] ] ;
     [ <action:ACTION,EXEC> <uAction,...> ] ;
     [ <group: GROUP > ] ;
     [ MESSAGE <cMsg> ] ;
     [ <adjust: ADJUST > ] ;
     [ WHEN <WhenFunc> ] ;
     [ TOOLTIP <cToolTip> ] ;
     [ <lPressed: PRESSED> ] ;
     [ ON DROP <bDrop> ] ;
     [ AT <nPos> ] ;
     [ PROMPT <cPrompt> ] ;
     [ FONT <oFont> ] ;
     [ <lNoBorder: NOBORDER> ] ;
    => ;
  [ <oBtn> := ] TBtnBmp():NewBar( <cResName1>, <cResName2>,;
    <cBmpFile1>, <cBmpFile2>, <cMsg>, [{|This|<uAction>}],;
    <.group.>, <oBar>, <.adjust.>, <{WhenFunc}>,;
    <cToolTip>, <.lPressed.>, [\{||<bDrop>\}], [\"<uAction>\"], <nPos>,;
    <cPrompt>, <oFont>, [<cResName3>], [<cBmpFile3>], [!<.lNoBorder.>] )

#xcommand @ <nRow>, <nCol> BTNBMP [<oBtn>] ;
     [ <resource: NAME, RESNAME, RESOURCE> <cResName1> [,<cResName2>] ] ;
     [ <file: FILE, FILENAME, DISK> <cBmpFile1> [,<cBmpFile2>] ] ;
     [ SIZE <nWidth>, <nHeight> ] ;
     [ ACTION <uAction,...> ] ;
     [ <of:OF, WINDOW, DIALOG> <oWnd> ] ;
     [ MESSAGE <cMsg> ] ;
     [ WHEN <uWhen> ] ;
     [ <adjust: ADJUST> ] ;
     [ <lUpdate: UPDATE> ] ;
    => ;
  [ <oBtn> := ] TBtnBmp():New( <nRow>, <nCol>, <nWidth>, <nHeight>,;
    <cResName1>, <cResName2>, <cBmpFile1>, <cBmpFile2>,;
    [{|Self|<uAction>}], <oWnd>, <cMsg>, <{uWhen}>, <.adjust.>,;
    <.lUpdate.> )

/*----------------------------------------------------------------------------//
!short: BOX - GROUPS */

#xcommand @ <nTop>, <nLeft> [ GROUP <oGroup> ] TO <nBottom>, <nRight > ;
     [ <label:LABEL,PROMPT> <cLabel> ] ;
     [ OF <oWnd> ] ;
     [ COLOR <nClrFore> [,<nClrBack>] ] ;
     [ <lPixel: PIXEL> ] ;
     [ <lDesign: DESIGN> ] ;
     => ;
   [ <oGroup> := ] TGroup():New( <nTop>, <nLeft>, <nBottom>, <nRight>,;
     <cLabel>, <oWnd>, <nClrFore>, <nClrBack>, <.lPixel.>,;
     [<.lDesign.>] )

