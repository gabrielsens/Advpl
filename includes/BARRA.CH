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
!short: COMBOBOX */

#xcommand @ <nRow>, <nCol> COMBOBOX [ <oCbx> VAR ] <cVar> ;
     [ <items: ITEMS, PROMPTS> <aItems> ] ;
     [ SIZE <nWidth>, <nHeight> ] ;
     [ <dlg:OF,WINDOW,DIALOG> <oWnd> ] ;
     [ <help:HELPID, HELP ID> <nHelpId> ] ;
     [ ON CHANGE <uChange> ] ;
     [ VALID <uValid> ] ;
     [ <color: COLOR,COLORS> <nClrText> [,<nClrBack>] ] ;
     [ <pixel: PIXEL> ] ;
     [ FONT <oFont> ] ;
     [ <update: UPDATE> ] ;
     [ MESSAGE <cMsg> ] ;
     [ WHEN <uWhen> ] ;
     [ <design: DESIGN> ] ;
     [ BITMAPS <acBitmaps> ] ;
     [ ON DRAWITEM <uBmpSelect> ] ;
     => ;
   [ <oCbx> := ] TComboBox():New( <nRow>, <nCol>, bSETGET(<cVar>),;
     <aItems>, <nWidth>, <nHeight>, <oWnd>, <nHelpId>,;
     [{|Self|<uChange>}], <{uValid}>, <nClrText>, <nClrBack>,;
     <.pixel.>, <oFont>, <cMsg>, <.update.>, <{uWhen}>,;
     <.design.>, <acBitmaps>, [{|nItem|<uBmpSelect>}] )

/*----------------------------------------------------------------------------//
!short: RADIOBUTTONS */

#xcommand @ <nRow>, <nCol> RADIO [ <oRadMenu> VAR ] <nVar> ;
     [ <prm: PROMPT, ITEMS> <cItems,...> ] ;
     [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
     [ <help:HELPID, HELP ID> <nHelpId,...> ] ;
     [ <change: ON CLICK, ON CHANGE> <uChange> ] ;
     [ COLOR <nClrFore> [,<nClrBack>] ] ;
     [ MESSAGE <cMsg> ] ;
     [ <update: UPDATE> ] ;
     [ WHEN <uWhen> ] ;
     [ SIZE <nWidth>, <nHeight> ] ;
     [ VALID <uValid> ] ;
     [ <lDesign: DESIGN> ] ;
     [ <lLook3d: 3D> ] ;
     [ <lPixel: PIXEL> ] ;
     => ;
   [ <oRadMenu> := ] TRadMenu():New( <nRow>, <nCol>, {<cItems>},;
     [bSETGET(<nVar>)], <oWnd>, [{<nHelpId>}], <{uChange}>,;
     <nClrFore>, <nClrBack>, <cMsg>, <.update.>, <{uWhen}>,;
     <nWidth>, <nHeight>, <{uValid}>, <.lDesign.>, <.lLook3d.>,;
     <.lPixel.> )

/*----------------------------------------------------------------------------//
!short: ACCESSING / SETTING Variables */

#xtranslate bSETGET(<uVar>) => ;
    { | u | If( PCount() == 0, <uVar>, <uVar> := u ) }

/*----------------------------------------------------------------------------//
!short: CHECKBOX */

#xcommand @ <nRow>, <nCol> CHECKBOX [ <oCbx> VAR ] <lVar> ;
     [ PROMPT <cCaption> ] ;
     [ <of:OF, WINDOW, DIALOG> <oWnd> ] ;
     [ SIZE <nWidth>, <nHeight> ] ;
     [ <help:HELPID, HELP ID> <nHelpId> ] ;
     [ FONT <oFont> ] ;
     [ <change: ON CLICK, ON CHANGE> <uClick> ] ;
     [ VALID   <ValidFunc> ] ;
     [ <color: COLOR, COLORS> <nClrFore> [,<nClrBack>] ] ;
     [ <design: DESIGN> ] ;
     [ <pixel: PIXEL> ] ;
     [ MESSAGE <cMsg> ] ;
     [ <update: UPDATE> ] ;
     [ WHEN <WhenFunc> ] ;
    => ;
  [ <oCbx> := ] TCheckBox():New( <nRow>, <nCol>, <cCaption>,;
     [bSETGET(<lVar>)], <oWnd>, <nWidth>, <nHeight>, <nHelpId>,;
     [<{uClick}>], <oFont>, <{ValidFunc}>, <nClrFore>, <nClrBack>,;
     <.design.>, <.pixel.>, <cMsg>, <.update.>, <{WhenFunc}> )

/*----------------------------------------------------------------------------//
!short: SAY  */

#xcommand @ <nRow>, <nCol> SAY [ <oSay> <label: PROMPT,VAR > ] <cText> ;
     [ PICTURE <cPict> ] ;
     [ <dlg: OF,WINDOW,DIALOG > <oWnd> ] ;
     [ FONT <oFont> ]  ;
     [ <lCenter: CENTERED, CENTER > ] ;
     [ <lRight:  RIGHT >  ] ;
     [ <lBorder: BORDER > ] ;
     [ <lPixel: PIXEL, PIXELS > ] ;
     [ <color: COLOR,COLORS > <nClrText> [,<nClrBack> ] ] ;
     [ SIZE <nWidth>, <nHeight> ] ;
     [ <design: DESIGN >  ] ;
     [ <update: UPDATE >  ] ;
     [ <lShaded: SHADED, SHADOW > ] ;
     [ <lBox:  BOX   >  ] ;
     [ <lRaised: RAISED > ] ;
    => ;
   [ <oSay> := ] TSay():New( <nRow>, <nCol>, <{cText}>,;
     [<oWnd>], [<cPict>], <oFont>, <.lCenter.>, <.lRight.>, <.lBorder.>,;
     <.lPixel.>, <nClrText>, <nClrBack>, <nWidth>, <nHeight>,;
     <.design.>, <.update.>, <.lShaded.>, <.lBox.>, <.lRaised.> )

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

/*----------------------------------------------------------------------------//
!short: BITMAP */

#xcommand @ <nRow>, <nCol> BITMAP [ <oBmp> ] ;
     [ <resource: NAME, RESNAME, RESOURCE> <cResName> ] ;
     [ <file: FILE, FILENAME, DISK> <cBmpFile> ] ;
     [ <NoBorder:NOBORDER, NO BORDER> ] ;
     [ SIZE <nWidth>, <nHeight> ] ;
     [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
     [ <lClick: ON CLICK, ON LEFT CLICK> <uLClick> ] ;
     [ <rClick: ON RIGHT CLICK> <uRClick> ] ;
     [ <scroll: SCROLL> ] ;
     [ <adjust: ADJUST> ] ;
     [ CURSOR <oCursor> ] ;
     [ <pixel: PIXEL>   ] ;
     [ MESSAGE <cMsg>   ] ;
     [ <update: UPDATE> ] ;
     [ WHEN <uWhen> ] ;
     [ VALID <uValid> ] ;
     [ <lDesign: DESIGN> ] ;
     => ;
   [ <oBmp> := ] TBitmap():New( <nRow>, <nCol>, <nWidth>, <nHeight>,;
     <cResName>, <cBmpFile>, <.NoBorder.>, <oWnd>,;
     [\{ |nRow,nCol,nKeyFlags| <uLClick> \} ],;
     [\{ |nRow,nCol,nKeyFlags| <uRClick> \} ], <.scroll.>,;
     <.adjust.>, <oCursor>, <cMsg>, <.update.>,;
     <{uWhen}>, <.pixel.>, <{uValid}>, <.lDesign.> )

#xcommand DEFINE BITMAP [<oBmp>] ;
     [ <resource: NAME, RESNAME, RESOURCE> <cResName> ] ;
     [ <file: FILE, FILENAME, DISK> <cBmpFile> ] ;
     [ <of: OF, WINDOW, DIALOG> <oWnd> ] ;
     => ;
   [ <oBmp> := ] TBitmap():Define( <cResName>, <cBmpFile>, <oWnd> )

/*----------------------------------------------------------------------------//
!short: PUSHBUTTON */

#xcommand @ <nRow>, <nCol> BUTTON [ <oBtn> PROMPT ] <cCaption> ;
     [ SIZE <nWidth>, <nHeight> ] ;
     [ ACTION <uAction> ] ;
     [ <default: DEFAULT> ] ;
     [ <of:OF, WINDOW, DIALOG> <oWnd> ] ;
     [ <help:HELP, HELPID, HELP ID> <nHelpId> ] ;
     [ FONT <oFont> ] ;
     [ <pixel: PIXEL> ] ;
     [ <design: DESIGN> ] ;
     [ MESSAGE <cMsg> ] ;
     [ <update: UPDATE> ] ;
     [ WHEN <WhenFunc> ] ;
     [ VALID <uValid> ] ;
     [ <lCancel: CANCEL> ] ;
    => ;
  [ <oBtn> := ] TButton():New( <nRow>, <nCol>, <cCaption>, <oWnd>,;
    <{uAction}>, <nWidth>, <nHeight>, <nHelpId>, <oFont>, <.default.>,;
    <.pixel.>, <.design.>, <cMsg>, <.update.>, <{WhenFunc}>,;
    <{uValid}>, <.lCancel.> )

/*----------------------------------------------------------------------------//
!short: WORKTIME */

#xcommand @ <nRow>, <nCol> WORKTIME [ <oWorktime> ] ;
     [ SIZE <nWidth>, <nHeight> ] ;
     [ RESOLUTION <nResolution> ] ;
     [ VALUE <cValue> ] ;
     [ <of:OF, WINDOW, DIALOG> <oWnd> ] ;
     [ WHEN <WhenFunc> ] ;
     [ <change: ON CLICK, ON CHANGE> <uClick> ] ;
    => ;
  [ <oWorktime> := ] MsWorkTime():New( <oWnd>, <nRow>, <nCol>, <nWidth>, <nHeight>,;
  [<nResolution>], [<cValue>], <{WhenFunc}>, [<{uClick}>] )

