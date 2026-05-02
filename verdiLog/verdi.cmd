verdiSetActWin -dock widgetDock_<Decl._Tree>
simSetSimulator "-vcssv" -exec "/home/st42/HW4/simv" -args
debImport "-dbdir" "/home/st42/HW4/simv.daidir"
debLoadSimResult /home/st42/HW4/waves.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "318" "82" "900" "700"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcSignalView -on
verdiSetActWin -dock widgetDock_<Signal_List>
srcSignalViewSelect "top.clk"
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "top.mif.dut_mp" -win $_nTrace1
srcHBSelect "top.mif.tb_mp" -win $_nTrace1
srcHBSelect "top.test.mif" -win $_nTrace1
srcHBSelect "top.test.check_transactions" -win $_nTrace1
srcDeselectAll -win $_nTrace1
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBSelect "top.dut.mif" -win $_nTrace1
srcHBSelect "top.dut.mif" -win $_nTrace1
srcSetScope "top.dut.mif" -delim "." -win $_nTrace1
srcHBSelect "top.dut.mif" -win $_nTrace1
srcSignalViewSelect "top.dut.mif.clk"
verdiSetActWin -dock widgetDock_<Signal_List>
srcSignalViewSelect "top.dut.mif.clk"
srcSignalViewAddSelectedToWave -win $_nTrace1 -clipboard
wvDrop -win $_nWave2
srcSignalViewSelect "top.dut.mif.write"
srcSignalViewSelect "top.dut.mif.write"
srcSignalViewAddSelectedToWave -win $_nTrace1 -clipboard
wvDrop -win $_nWave2
srcSignalViewSelect "top.dut.mif.read"
srcSignalViewSelect "top.dut.mif.read"
srcSignalViewAddSelectedToWave -win $_nTrace1 -clipboard
wvDrop -win $_nWave2
srcSignalViewSelect "top.dut.mif.data_in\[7:0\]"
srcSignalViewSelect "top.dut.mif.data_in\[7:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1 -clipboard
wvDrop -win $_nWave2
srcSignalViewSelect "top.dut.mif.address\[15:0\]"
srcSignalViewSelect "top.dut.mif.address\[15:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1 -clipboard
wvDrop -win $_nWave2
srcSignalViewSelect "top.dut.mif.data_out\[8:0\]"
srcSignalViewSelect "top.dut.mif.data_out\[8:0\]"
srcSignalViewAddSelectedToWave -win $_nTrace1 -clipboard
wvDrop -win $_nWave2
wvZoomAll -win $_nWave2
verdiSetActWin -win $_nWave2
