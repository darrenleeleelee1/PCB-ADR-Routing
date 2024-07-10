; Allegro sub-drawing file
; Created by Allegro Venture PCB Designer Suite; version= 17.4-2019 P001

_clp_lay_drw = axlDesignType(nil)
_clp_sym = nil
_clp_pbuf  = nil
_clpFormid = nil
(when (equal axlDesignType(nil) "LAYOUT") _clpFormid = _clpMSOpenAssign())
_clp_cinfo = make_clp_coord_info()
_clp_cinfo->f_rotation = 0.0
_clp_cinfo->l_origin = '(0.0 0.0)
_clp_text_orient = make_axlTextOrientation()
_clp_pin_text = make_axlPinText()
_clp_cinfo->t_from_units = "mils"
_clp_cinfo->t_to_units = car(axlDBGetDesignUnits())
_clp_cinfo->preserve_shape_net = t
_clp_cinfo->preserve_via_net = t
_clp_cinfo->snapToObject = nil
_clp_cinfo->createNCLayers = nil
_clp_group_info = make_clp_group_info()
_clp_cinfo->group_info = _clp_group_info
_clp_accuracy =2
_clpCheckAccuracy(_clp_accuracy _clp_cinfo->t_from_units	 	_clp_cinfo->t_to_units)
(putprop _clp_cinfo (list (_clpAdjustPt 4349.18:2542.35 _clp_cinfo)	
	(_clpAdjustPt 5333.06:3678.74 _clp_cinfo)) 'l_extents)
(putprop _clp_cinfo (_clpAdjustPt '(0.0 0.0) _clp_cinfo) 'l_zeropt)
(unless (_clpSelectRotOrg _clp_cinfo)
	(error "CANCEL"))
_clp_clip_prop_value = _clpGetClipPropValue()

(if _clpFormid  then
	clpFormValue = _clpFormid->curValue
else
	clpFormValue  = nil)
printf(" 10 percent completed")
newline()

printf(" 20 percent completed")
newline()

printf(" 30 percent completed")
newline()

printf(" 40 percent completed")
newline()

printf(" 50 percent completed")
newline()

printf(" 60 percent completed")
newline()

printf(" 70 percent completed")
newline()

printf(" 80 percent completed")
newline()

printf(" 90 percent completed")
newline()

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4593.38:2769.37 _clp_cinfo) 	
	"DDR_DQ[25]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4615.82:2791.8 _clp_cinfo) 	
	"DDR_DQ[27]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4495.54:3490.39 _clp_cinfo) 	
	"DDR_DQS2N" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4521.13:3490.39 _clp_cinfo) 	
	"DDR_DQS3" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA18C10D" _clpAdjustPt(4495:3460 _clp_cinfo) 	
	"DDR_DQ[19]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA18C10D" _clpAdjustPt(4545:3515 _clp_cinfo) 	
	"DDR_DQ[19]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4597.9:3592.74 _clp_cinfo) 	
	"DDR_DQ[11]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4597.9:3567.16 _clp_cinfo) 	
	"DDR_DQ[9]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4546.72:3567.16 _clp_cinfo) 	
	"DDR_DQ[24]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4444.36:3592.74 _clp_cinfo) 	
	"DDR_DQ[25]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4546.72:3592.74 _clp_cinfo) 	
	"DDR_DQ[26]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4444.36:3567.16 _clp_cinfo) 	
	"DDR_DQ[27]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4521.13:3592.74 _clp_cinfo) 	
	"DDR_DQ[28]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4469.95:3592.74 _clp_cinfo) 	
	"DDR_DQ[29]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4521.13:3567.16 _clp_cinfo) 	
	"DDR_DQ[30]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4469.95:3567.16 _clp_cinfo) 	
	"DDR_DQ[31]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4469.95:3517.16 _clp_cinfo) 	
	"DDR_DQS2" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4521.13:3517.16 _clp_cinfo) 	
	"DDR_DQS3N" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4727.16:2680.46 _clp_cinfo) 	
	"DDR_DQS2" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4637.92:2724.83 _clp_cinfo) 	
	"DDR_DQ[29]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4749.43:2658.19 _clp_cinfo) 	
	"DDR_DQS2N" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA18C10D" _clpAdjustPt(4790:2635 _clp_cinfo) 	
	"DDR_DQ[22]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA18C10D" _clpAdjustPt(4680:2565 _clp_cinfo) 	
	"DDR_DQ[22]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4749.27:2836.18 _clp_cinfo) 	
	"DDR_DQS3" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4771.53:2813.92 _clp_cinfo) 	
	"DDR_DQ[24]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4771.53:2858.44 _clp_cinfo) 	
	"DDR_DQ[26]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4704.73:2880.72 _clp_cinfo) 	
	"DDR_DQ[28]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4749.25:2880.72 _clp_cinfo) 	
	"DDR_DQ[30]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4660.36:2747.26 _clp_cinfo) 	
	"DDR_DQ[31]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4726.99:2858.46 _clp_cinfo) 	
	"DDR_DQS3N" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4674.68:3490.39 _clp_cinfo) 	
	"DDR_DQS0N" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4700:3515 _clp_cinfo) 	
	"DDR_DQS1N" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4695:3450 _clp_cinfo) 	
	"DDR_DQS1" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4649.08:3517.16 _clp_cinfo) 	
	"DDR_DQS0" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4725.86:3567.16 _clp_cinfo) 	
	"DDR_DQ[10]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4674.68:3592.74 _clp_cinfo) 	
	"DDR_DQ[12]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4623.49:3567.16 _clp_cinfo) 	
	"DDR_DQ[13]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4674.68:3567.16 _clp_cinfo) 	
	"DDR_DQ[14]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4649.08:3567.16 _clp_cinfo) 	
	"DDR_DQ[15]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4751.44:3567.16 _clp_cinfo) 	
	"DDR_DQ[8]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5011.49:3187.47 _clp_cinfo) 	
	"DDR_DQ[11]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5033.59:3120.5 _clp_cinfo) 	
	"DDR_DQ[13]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5056.03:3142.93 _clp_cinfo) 	
	"DDR_DQ[15]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(4989.05:3165.04 _clp_cinfo) 	
	"DDR_DQ[9]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5122.66:3254.13 _clp_cinfo) 	
	"DDR_DQS1N" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5140:3075 _clp_cinfo) 	
	"DDR_DQS0" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA18C10D" _clpAdjustPt(5140:3135 _clp_cinfo) 	
	"DDR_DQM[0]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5100.4:3276.39 _clp_cinfo) 	
	"DDR_DQ[12]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5144.94:3231.85 _clp_cinfo) 	
	"DDR_DQS1" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5167.2:3254.11 _clp_cinfo) 	
	"DDR_DQ[10]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5167.2:3209.59 _clp_cinfo) 	
	"DDR_DQ[8]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5145.1:3053.86 _clp_cinfo) 	
	"DDR_DQS0N" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA18C10D" _clpAdjustPt(5170:3155 _clp_cinfo) 	
	"DDR_DQM[0]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_dbid = _clpDBCreateVia( "VIA15C8D" _clpAdjustPt(5144.92:3276.39 _clp_cinfo) 	
	"DDR_DQ[14]" nil _clp_cinfo->f_rotation _clp_sym)

_clp_dbid = car(_clp_dbid)
when(_clp_dbid _clpDBAddProp( _clp_dbid list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))))

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4365.18:3464.8 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4365.18:3463.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4361.7:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4361.7:2766.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4352.4:2757.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4352.4:2738.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4357.05:2734.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4366.35:2734.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2738.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2738.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2734.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2734.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2738.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.45:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:2738.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2734.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:2734.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:2738.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.85:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4536.82:2735.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4537.16:2735.78 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4546.72:3592.74 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4568.03:3592.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4572.3:3597.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4572.3:3603.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.54:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4595.64:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4600.3:3611.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4600.3:3630.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4604.96:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4611.19:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4614.3:3637.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4614.3:3658.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4609.64:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4603.41:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4600.3:3665.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4600.3:3673.11 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4596.67:3676.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4410.22:3676.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3672.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3652.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4401.7:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4383.84:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4379.18:3653.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4379.18:3659.63 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4376.07:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4355.84:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4351.18:3658.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4351.18:3584.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4355.45:3579.93 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4361.94:3579.93 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4365.18:3576.69 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4365.18:3521.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4360.52:3517.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4354.29:3517.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4351.18:3514.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4351.18:3494.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4355.43:3490.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4361.93:3490.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4365.18:3487.14 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4365.18:3480.76 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4368.37:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.58:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4379.18:3473.97 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4379.18:3464.8 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4547.7:2790 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:2697.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4660:2585 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4667.5:2585 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4681.25:2598.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4688.75:2598.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4722.19:2632.19 _clp_cinfo))
_clp_path = (_clpPathArcCenter _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.3:2639.69 _clp_cinfo) nil
 	(_clpAdjustPt 4714.71148310698:2639.685898338306 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.73:2660.26 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.73:2680.29 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4727:2613.46 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4746.54:2613.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4763.45:2596.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4763.45:2583.44 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.01:2545 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4635:2545 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.98:2664.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.9:2736.88 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4507.1:2745.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4507.1:2746.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4501.2:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:2757.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.45:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2757.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2757.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2766.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2776.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2785.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2790 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2790 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2794.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2803.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2831.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2841.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2845.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2845.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2850.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2859.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2864.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2864.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2869.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2878.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2883 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2883 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2887.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2896.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2924.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2938.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2938.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2957.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2957.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:3050.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:3050.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:3101.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:3106.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:3106.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:3110.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:3120.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:3129.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.97:3463.97 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.97:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.97:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4397.97:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.97:3497.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.97:3503.18 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4680:2565 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4675:2560 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4655:2560 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.73:2685.27 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.73:2770.77 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4510.5:2776.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4510.5:2785.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.85:2790 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2790 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:2785.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:2776.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:2776.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:2785.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2790 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.45:2790 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2785.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2776.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2776.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2794.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2799.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2799.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2803.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2831.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2836.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2836.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2841.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2850.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2859.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2869.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2873.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2873.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2878.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2887.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2892.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2892.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2896.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2924.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3078.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3078.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3082.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3092.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:3101.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:3110.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3120.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3129.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4426.8:3157.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.97:3461.83 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.97:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.97:3477.59 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4704.73:2635.74 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4680.74:2635.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4660:2615 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:2615 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4571.25:2693.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4571.25:2701.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4591.25:2721.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4591.25:2728.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570:2750 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570:2795 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580:2805 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4573.21:2811.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4573.21:2815.51 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:2850.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.85:2864.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:2864.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:2859.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4468.65:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3222.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:3445.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.56:3464.14 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.56:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.56:3477.59 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4704.73:2880.72 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4642.16:2818.14 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4642.16:2810.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4679.28:2773.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4679.28:2766.19 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4674.2:2761.11 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4674.2:2756.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4679.94:2750.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4679.94:2744.58 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4619.18:2683.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4611.76:2683.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.77:2709.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.77:2717.24 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4590.83:2722.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4590.83:2727.37 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405:2913.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405:3475.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.93:3490.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4383.43:3490.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4379.18:3494.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4379.18:3617.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4382.76:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.93:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3623.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3630.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4397.43:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4414.5:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4418.77:3639.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4418.77:3658.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4423.02:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4440.64:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4444.36:3659.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4444.36:3651.58 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4447.2:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4452.88:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4457.13:3644.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4457.13:3625.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4461.4:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4491.27:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4495.54:3625.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4495.54:3658.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4499.79:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4581.64:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4586.3:3658.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4586.3:3639.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4581.64:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4563.1:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.49:3631.13 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.49:3623.91 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4556.32:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4549.96:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4546.72:3617.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4546.72:3611.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4542.45:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4525.38:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3602.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4771.53:2858.44 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4764.12:2865.86 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.71:2865.86 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4751.75:2860.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4746.8:2860.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4730.7:2877 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4723.29:2877 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4664.6:2818.31 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4664.6:2810.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4712.85:2762.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4712.85:2755.24 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4707.77:2750.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4707.77:2745.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4734.96:2717.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4734.96:2710.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4697.31:2672.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4689.9:2672.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4684.94:2677.81 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4679.97:2677.81 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.88:2661.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4656.47:2661.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4641.62:2676.58 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4634.19:2676.58 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4607.67:2650.06 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4600.26:2650.06 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.01:2698.31 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.01:2705.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4567.22:2720.93 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4567.22:2728.36 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4548.48:2747.09 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4548.48:2752.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4519.8:2757.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4519.8:2766.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.85:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4468.65:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4440.75:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.45:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2766.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2785.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2794.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2803.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2831.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2841.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2845.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2845.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2850.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2859.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2864.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2864.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2869.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2878.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2883 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2883 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2887.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2896.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2924.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2938.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2938.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2957.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2957.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4371:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4375.65:3050.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:3050.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4379.18:3460.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4379.18:3464.8 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4593.19:2791.8 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4600.8:2784.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4600.8:2776.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4593.38:2769.37 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4431.56:3503.18 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.56:3497.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4423.56:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.97:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.97:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.97:3460.07 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.45:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:3408.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:3222.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.45:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.45:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4440.75:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2831.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4440.75:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:2803.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4440.75:2799.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2799.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4491.9:2803.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4491.9:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:2841.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:2845.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:2845.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2841.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2831.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2836.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.85:2836.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4501.2:2831.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4501.2:2803.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.85:2799.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2799.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4519.8:2803.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4519.8:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:2790 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4547.7:2790 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4548.18:2789.52 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4550.94:2789.52 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4495:3460 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.45:3460 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4510.5:3454.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4510.5:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.75:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:2887.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:2883 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:2883 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4641.62:2883.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.34:2883.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4652.88:2876.37 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4660.42:2876.37 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4669.84:2885.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.38:2885.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4681.38:2881.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4681.38:2854 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.38:2850 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4669:2850 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4665:2846 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4665:2839 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4669:2835 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4676:2835 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4680:2831 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4680:2825 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715:2790 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715:2775 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4720:2770 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771:2770 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775:2774 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775:2775 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.67:2789.67 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4795.33:2789.67 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4810:2775 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4832.73:2775 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4838.36:2769.37 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4379.18:3464.8 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4379.18:3460.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4380.3:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4384.95:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2748.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2757.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4440.75:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4468.65:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.85:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.75:2743.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:2752.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4548.48:2752.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4548.48:2747.09 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4615.82:2814.88 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4615.82:2814.43 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4457.13:3464.8 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4457.13:3462.03 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3129.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3120.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:3110.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:3101.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3092.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3082.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:3078.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3078.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2924.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2896.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2892.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2892.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2887.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2878.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2873.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2873.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2869.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2859.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2850.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2841.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2836.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2836.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2831.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4445.4:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4450.05:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4464:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4468.65:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4491.9:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4491.9:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4519.8:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4519.8:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:2808.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:2827.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4615.82:2814.88 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4682.46:2702.56 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4682.46:2727.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.25:2736.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.25:2743.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4595.45:2839.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4587.95:2839.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2836.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2850.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:2859.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:2896.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2896.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2878.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:2873.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:2873.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2878.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.75:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:2887.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:2883 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2883 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:2887.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4501.2:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4501.2:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4468.65:3236.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3236.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4468.65:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:3408.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4468.65:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4459.35:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4454.7:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4457.15:3462.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4457.15:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4457.15:3477.59 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4615.65:2769.37 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4615.64:2769.37 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4615.82:2791.8 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4482.74:3503.18 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4479.95:3500.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4479.95:3494.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4470:3485 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4470:3466.44 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.15:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.15:3455.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:3451.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.3:3445.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:3422.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:3422.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4501.2:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4501.2:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4482.6:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4501.2:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4501.2:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.85:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4510.5:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4510.5:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.75:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.75:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4519.8:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4510.5:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4510.5:2924.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:2924.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2924.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:2864.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.71:2863.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.71:2861.29 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4684.12:2799.88 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4684.12:2790.88 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.3:2755.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.15:2755.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4793.81:2769.36 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4593.37:2747.09 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4593.38:2769.37 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4593.37:2747.1 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4593.37:2769.36 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4593.38:2769.37 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4615.82:2814.88 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4616.26:2814.88 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.54:2903.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4712.14:2895.56 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.57:2895.56 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4734.6:2910.58 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4742.02:2910.58 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4758.04:2894.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4763.1:2894.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4768.16:2899.63 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.6:2899.63 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4801.59:2873.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4801.59:2866.22 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.24:2839.87 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.24:2832.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4801.23:2806.48 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4801.23:2799.07 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4785.41:2783.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4785.41:2777.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4790.92:2772.23 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4790.92:2766.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4785.15:2760.69 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4785.15:2755.76 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4790.1:2750.81 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4790.1:2743.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4764.81:2718.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4757.4:2718.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4742.54:2732.96 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4742.54:2740.38 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4767.83:2765.67 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4767.83:2773.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.97:2787.94 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.97:2795.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.53:2813.92 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4615.82:2791.8 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4604.5:2803.12 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4586.89:2803.12 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4578.77:2795 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4578.77:2774.83 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4573.47:2769.53 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4568.17:2769.53 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2776.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:2780.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:2780.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.75:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:2780.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515.15:2780.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4505.85:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4496.55:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4487.25:2780.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.95:2780.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4468.65:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4440.75:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:2776.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4436.1:2785.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.45:2790 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2790 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2780.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2780.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2785.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2794.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2799.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2799.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2803.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2813.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2817.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2822.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2831.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2836.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2836.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2841.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2850.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2855.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2859.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2869.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2873.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2873.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2878.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2887.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2892.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2892.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2896.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2924.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4398.9:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.55:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4412.85:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4417.5:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3082.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4408.2:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3461.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3464.8 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4593.38:2769.37 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4593.38:2754.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4588.08:2748.71 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4565.09:2748.71 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.79:2754.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.79:2759.31 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.45:2762.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4422.15:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4394.25:2771.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:2776.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.6:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3463.18 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3464.8 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4749.43:2658.19 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4749.43:2672.31 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.31:2679.19 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.31:2724.96 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4616.5:2864.77 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4616.5:3294.77 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4448.92:3462.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4448.92:3462.36 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4473.92:3487.36 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.49:3490.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4477.52:3490.81 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4495.54:3490.39 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4727.16:2680.46 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4741.3:2680.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4744.81:2683.97 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4744.81:2720.19 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4605:2860 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4605:3290 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4437.42:3457.58 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4437.42:3467.13 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4465.87:3495.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4465.97:3495.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.54:3499.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.95:3517.16 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4637.92:2724.83 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4619.35:2743.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4611.93:2743.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4606.96:2738.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4602.01:2738.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4460:2880.44 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4460:2895 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4435:2920 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4435:3430.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4418.77:3446.24 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4418.77:3551.18 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4415.61:3554.34 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4409.27:3554.34 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3557.66 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3564.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4403.11:3567.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4397.43:3567.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3571.41 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3603.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4396.35:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4402.71:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3609.98 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3616.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4410.22:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4428.3:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.54:3617.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.54:3611.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4435.81:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4465.68:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.95:3602.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.95:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4660.36:2747.26 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4630.66:2776.96 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4623.25:2776.96 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4618.17:2771.89 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4613.11:2771.89 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4593.19:2791.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.13:2791.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.54:2902.21 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.54:2907.51 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2915.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2901.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:2906.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:2924.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:2966.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3022.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3078.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3078.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3082.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3092.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3101.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3110.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3120.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3129.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3157.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3185.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3222.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3227.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3227.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3231.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3250.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3371.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3399.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:3408.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.15:3435 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4455:3435 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.54:3458.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.54:3473.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4435.79:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4435.79:3528.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4448.61:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4465.7:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.95:3545.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.95:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4749.25:2880.72 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.13:2891.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4726.99:2902.98 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.68:2914.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.68:2919.62 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.1:2920.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.1:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710.45:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:2948.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:2929.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:2957.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:2957.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3050.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3050.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3082.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3087.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3087.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3092.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3101.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3106.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3106.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3110.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3120.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3124.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3124.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3129.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3157.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3185.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3199.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3199.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3222.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3231.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3236.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3236.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3250.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3371.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3399.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3408.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.49:3462.09 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.49:3464.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.49:3536.77 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4554.69:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4525.38:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3545.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4533.92:3477.59 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.92:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.92:3459.77 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:3454.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.1:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.75:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4519.8:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4519.8:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4524.45:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.75:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4538.4:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4543.05:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:2934.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:2910.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.72:2910.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4694.22:2910.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700:2905 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4720:2905 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4740:2925 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770:2925 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4886.25:2808.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4886.25:2796.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4832.84:2742.84 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4820.34:2742.84 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4816.08:2747.1 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4559.51:3503.18 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.51:3497.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4551.51:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4545.92:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4545.92:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4545.92:3461.38 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4547.7:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4552.35:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4566.3:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3250.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3231.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3227.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3227.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3222.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3185.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3157.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3129.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3120.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3110.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3101.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3092.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3082.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:3087.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3087.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3082.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4603.5:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4603.5:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3050.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3050.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:3036.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4682.55:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:2999.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:2994.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:2976 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:2971.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:2962.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:2957.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:2957.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:2952.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:2943.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4694.47:2936.18 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4783.82:2936.18 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915:2805 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915:2779.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4855:2719.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4855:2708.17 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4860.62:2702.55 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4882.9:2724.82 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4890:2731.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4912.32:2731.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4930:2749.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4930:2806.09 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.09:2835 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.09:2858.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4804.33:2955.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4716.82:2955.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.1:2957.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.1:2980.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:2985.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:2989.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3013.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.1:3017.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.1:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3031.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4743:3027.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4743:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4747.65:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3003.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3008.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3059.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3055.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3041.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:3045.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:3064.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3082.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3087.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3087.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3082.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3069 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3073.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3092.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3101.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3110.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3115.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3110.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3101.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3096.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4603.5:3101.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4603.5:3120.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3124.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3124.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3129.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3399.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3399.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3399.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4570.95:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.65:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3408.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4557:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.51:3462.11 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.51:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.51:3477.59 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5100.4:3276.39 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5026.51:3202.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5026.51:3195.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5031.46:3190.13 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5031.46:3185.18 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5025.56:3179.28 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5025.56:3173.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5031.02:3167.94 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5031.02:3162.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5025.3:3156.76 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5025.3:3151.04 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5033.59:3142.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5052.14:3124.19 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5052.14:3116.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5044.73:3109.36 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5026.16:3090.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5018.75:3090.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5013.79:3095.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.84:3095.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4992.39:3079.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4984.98:3079.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4977.57:3086.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.13:3094.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.13:3101.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4985.33:3116.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4985.33:3124.21 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.48:3139.06 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.48:3146.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4975.43:3151.42 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4975.43:3156.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4966.58:3165.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4966.58:3170.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4966.2:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4961.55:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4929:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4929:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.1:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.1:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4766.25:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710.45:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4682.55:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3185.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3222.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3227.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3227.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3231.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3250.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3371.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.08:3459.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.08:3464.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.08:3487.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580:3492.63 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580:3595.94 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4569.2:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4562.97:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4558.31:3611.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4558.31:3631.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4561.89:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4569.06:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4572.31:3637.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4572.31:3644.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4576.56:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4593.63:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.9:3644.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.9:3623.91 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4601.07:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4607.43:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.67:3617.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.67:3611.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4614.94:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.83:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3603.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3596.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4653.33:3592.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4674.68:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4623.49:3567.16 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4623.49:3521.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4619.22:3517.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4602.15:3517.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.9:3512.91 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.9:3481.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4602.15:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4607.83:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.67:3474.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.67:3464.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.67:3461.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3408.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3389.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:3389.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:3399.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:3399.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:3222.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3222.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4603.5:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4603.5:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4747.65:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4863.9:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4863.9:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4891.8:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4891.8:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4919.7:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4919.7:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4947.6:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4947.6:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.85:3217.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4975.5:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4975.5:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4980.15:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4984.8:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4987.23:3187.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4988.86:3187.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.84:3167.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.84:3162.56 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5003.89:3157.61 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5003.89:3150.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5033.59:3120.5 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4989.05:3165.04 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.48:3146.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4963.07:3146.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4955.46:3154.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4955.46:3158.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4947.6:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4947.6:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4919.7:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4919.7:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4891.8:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4891.8:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4863.9:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4863.9:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4747.65:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3175.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3157.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3157.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:3408.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4594.2:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3431.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3431.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4572.31:3462.89 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4572.31:3464.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4572.31:3474.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.15:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.83:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.08:3481.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.08:3514.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4582.24:3517.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4576.56:3517.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4572.31:3521.41 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4572.31:3562.91 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4576.56:3567.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.9:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4431.54:3464.8 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.54:3473.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4427.29:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4397.43:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3481.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3550.09 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4388.93:3554.34 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4369.45:3554.34 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4365.18:3558.61 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4365.18:3630.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4369.84:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4389.93:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3631.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4393.18:3624.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4397.43:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4414.5:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4418.77:3625.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4418.77:3645.89 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4415.92:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4410.22:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3653.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4405.95:3672.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4410.22:3676.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4516.86:3676.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3672.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3651.58 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4523.97:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.65:3648.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.9:3644.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.9:3624.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4529.65:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4511.56:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4508.31:3617.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4508.31:3610.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4504.06:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4448.61:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4444.36:3602.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4444.36:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4444.36:3464.8 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4444.36:3538.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4441.51:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4435.79:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.54:3545.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4431.54:3562.89 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4435.81:3567.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4444.36:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5122.67:3009.14 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.67:2987.66 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5101.82:2966.81 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5072.84:2966.81 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5043.1:2996.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5025.43:2996.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5021.43:3000.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5014.44:3000.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4902.78:3112.21 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4902.78:3141.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.1:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3143.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4766.25:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710.45:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4682.55:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3152.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3148.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3134.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3138.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3408.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4603.5:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4603.5:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4598.85:3431.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4580.25:3431.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4575.6:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4573.1:3462.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4573.1:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4573.1:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4577.1:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.1:3497.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.1:3503.18 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4585.1:3477.59 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.1:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4585.1:3459.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4584.9:3445.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4589.55:3441 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4608.15:3441 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3422.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3422.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:3166.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4682.55:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710.45:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3162 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4919.7:3171.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4925.4:3165.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4925.4:3124.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5039.99:3010 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5055:3010 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5070:3025 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5085:3025 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5096.25:3013.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5103.75:3013.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5118.75:3028.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5126.25:3028.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5145.87:3009.13 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5167.21:3009.13 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4457.15:3503.18 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.95:3517.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4482.74:3477.59 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4495.54:3490.39 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4508.33:3503.18 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3517.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4508.33:3477.59 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3490.39 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4545:3515 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.92:3503.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4533.92:3503.18 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5100.4:3075.95 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5094.45:3070 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5074.65:3070 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5061.08:3056.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5053.57:3056.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4955.75:3154.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4955.73:3176.07 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4946.62:3185.18 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4946.62:3186.23 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4766.25:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3189.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4747.65:3199.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3199.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3185.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:3185.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3199.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3199.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3194.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3185.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3180.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3185.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3431.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3431.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4622.1:3445.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4617.45:3450.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4604.65:3450.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4600:3454.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4600:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.1:3462.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.1:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.1:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4602.69:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.69:3497.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.69:3503.18 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4966.2:3208.5 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3441 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3441 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3445.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3454.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4626.75:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4612.8:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.69:3461.71 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.69:3477.59 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4546.72:3567.16 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4565:3548.88 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4565:3505.83 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.49:3500.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4559.49:3481.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4555.24:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4549.56:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4546.72:3474.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4546.72:3464.8 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4749.27:2836.18 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4735.15:2836.18 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4722.47:2823.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4685.23:2823.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4638.5:2870.23 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4638.5:3300.23 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4530:3408.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4530:3485.44 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4525.05:3490.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3490.39 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4495:3460 _clp_cinfo))
	(_clpMKSConvert 4.800000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4500:3465 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4515:3465 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4545:3495 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4545:3515 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4726.99:2858.46 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4726.99:2844.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4717.69:2835 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4690:2835 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:2875 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3305 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4541.5:3413.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4541.5:3490.21 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4535.27:3496.44 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4535.27:3499.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4535.28:3499.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3513.87 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3517.16 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4585.1:3579.95 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.9:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4610.69:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4623.49:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4533.92:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4546.72:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4431.56:3579.95 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4444.36:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4533.92:3579.95 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4546.72:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4431.56:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4444.36:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4508.33:3579.95 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4457.15:3579.95 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.95:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4508.33:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4521.13:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4457.15:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4469.95:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4585.1:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.9:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5011.49:3187.47 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5030.04:3168.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5030.04:3161.51 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5024.96:3156.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5024.96:3151.37 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5052.14:3124.19 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5052.14:3116.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5028.03:3092.63 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5028.03:3086.97 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5059.39:3055.61 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5059.39:3050.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5096.68:3012.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5113.23:3012.88 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5117.01:3009.11 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.68:3009.12 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5141.24:3027.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5148.65:3027.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5153.6:3022.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5158.53:3022.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5187.17:3051.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5187.17:3057.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5171.45:3072.77 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5171.45:3080.21 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5179.04:3087.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5186.64:3095.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5194.07:3095.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5199.04:3090.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5203.99:3090.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5219.2:3105.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5226.61:3105.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5231.56:3100.69 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5236.49:3100.69 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5242.26:3106.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5248.03:3106.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5256.29:3098.21 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5263.7:3090.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5271.11:3090.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5312.13:3131.81 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5323.45:3143.12 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5331.06:3150.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5331.06:3158.14 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5271.67:3217.53 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5264.24:3217.53 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5249.03:3202.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5241.62:3202.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5223.05:3220.89 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5211.93:3232.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5204.49:3239.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5204.49:3246.88 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5209.56:3251.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5209.56:3257.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5149:3317.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5149:3324.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5154.07:3330.06 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5154.07:3335.13 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5145.29:3343.91 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5145.29:3345.61 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5142.9:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5142.9:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5138.25:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5128.95:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5124.3:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5124.3:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5119.65:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5101.05:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5096.4:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5096.4:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5091.75:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5073.15:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5068.5:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5068.5:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5063.85:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5045.25:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5040.6:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5040.6:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5035.95:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5012.7:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5012.7:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.05:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4989.45:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4984.8:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4984.8:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4980.15:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4961.55:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4956.9:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4956.9:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4929:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4929:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.1:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.1:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3380.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3371.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3371.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770.9:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770.9:3399.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3403.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3399.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3389.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3385.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3389.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3431.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3431.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3413.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770.9:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770.9:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3445.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4779.44:3460.36 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4779.44:3464.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4779.44:3487.14 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4779.44:3602.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.44:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770.1:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4765.44:3611.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4765.44:3631.63 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4762.33:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.1:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4751.44:3639.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4751.44:3672.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4747.17:3676.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4730.11:3676.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.86:3672.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.86:3637.58 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4728.7:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4734.38:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.63:3630.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.63:3610.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4734.38:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4717.31:3606.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4713.04:3611.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4713.04:3631.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710.2:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.52:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700.27:3638.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700.27:3672.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696:3676.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4665.1:3676.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4661.85:3673.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4661.85:3666.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4657.6:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.53:3662.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.26:3658.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.26:3637.76 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4633.24:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4627.2:3634.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4623.49:3631.03 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4623.49:3623.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4620.64:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4614.94:3620.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.67:3616.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4610.67:3596.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4606.42:3592.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4597.9:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4637.92:2724.83 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4637.91:2702.55 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4660.19:2724.83 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4660.19:2724.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4660.36:2747.26 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4749.27:2635.73 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4749.35:2646.96 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4749.43:2658.19 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4749.35:2646.96 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4749.35:2646.96 _clp_cinfo))
	(_clpMKSConvert 3.750000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4749.35:2635.81 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4749.28:2635.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4726.99:2658.01 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4727.08:2670.34 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4727.16:2680.46 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4727.08:2670.34 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4727.08:2670.34 _clp_cinfo))
	(_clpMKSConvert 3.750000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4727.08:2658.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4727:2658.02 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4637.91:2702.56 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4637.91:2724.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4637.92:2724.83 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4790:2635 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4790:2631.94 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.54:2613.48 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4790:2635 _clp_cinfo))
	(_clpMKSConvert 4.800000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715:2560 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4685:2560 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4680:2565 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4749.27:2813.9 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4749.27:2813.91 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4749.27:2813.91 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4749.27:2836.18 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4749.27:2858.44 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4749.25:2880.72 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4704.73:2880.72 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.73:2871.46 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4704.72:2858.45 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.73:2871.46 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4704.73:2871.46 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.73:2858.45 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4727:2836.17 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4726.99:2848.9 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4726.99:2858.46 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4726.99:2848.9 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4726.99:2848.9 _clp_cinfo))
	(_clpMKSConvert 3.750000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4726.99:2836.19 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4727:2836.18 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4771.53:2858.44 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.53:2848.41 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4771.54:2836.18 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.53:2848.41 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4771.53:2848.41 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.53:2836.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.54:2836.19 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4771.53:2791.65 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.53:2805 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.53:2813.92 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4771.54:2791.64 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.53:2791.65 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4771.53:2791.65 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4771.53:2791.63 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4636.28:3477.59 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.28:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.28:3463.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:3459.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4640.7:3454.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4645.35:3450.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3450.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3445.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4668.6:3231.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4673.25:3227.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4975.5:3227.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4979.59:3223.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5016.99:3223.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5091.8:3148.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5091.8:3111.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5078.13:3098.23 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5144.94:3231.85 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5130.82:3231.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5123.92:3224.96 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.77:3224.96 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705:3393.73 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705:3445.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700.05:3450 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4695:3450 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5122.66:3254.13 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.66:3239.97 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5119.15:3236.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4878.54:3236.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4720:3395 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4720:3505 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710:3515 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700:3515 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5145.1:3053.86 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5149.74:3058.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5168.54:3058.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5173.5:3053.54 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5173.5:3044.77 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5155.23:3026.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4969.77:3026.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4936.5:3059.77 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4936.5:3139.77 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4667.63:3408.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4667.63:3483.34 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4674.68:3490.39 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5140:3075 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5145:3070 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5173.31:3070 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5185:3058.31 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5185:3040 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5160:3015 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4965:3015 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4925:3055 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4925:3135 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4656.13:3403.87 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4656.13:3483.34 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3490.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3517.16 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5056.03:3142.93 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5074.58:3124.38 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5074.58:3116.97 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5059.55:3101.94 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5059.55:3094.53 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5064.52:3089.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5064.52:3084.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5058.73:3078.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5058.73:3073.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5107.81:3023.98 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5115.22:3023.98 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5130.08:3038.84 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5130.08:3046.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5125.13:3051.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5125.13:3085.11 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5141.58:3101.56 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5141.58:3108.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5115:3135.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5115:3136.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5093.5:3158.14 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5086.08:3158.14 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5078.65:3165.56 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5071.24:3172.98 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5063.83:3172.98 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5058.75:3167.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5053.69:3167.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5037.64:3183.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5037.64:3191.36 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5042.72:3196.43 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5042.72:3201.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5034.11:3210.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5022.8:3221.42 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5022.8:3226.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5022:3227.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5022:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4998.75:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4994.1:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4994.1:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4989.45:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.85:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4966.2:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4966.2:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4961.55:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4938.3:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4938.3:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4910.4:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4910.4:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4882.5:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4882.5:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4854.6:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4854.6:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4826.7:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4826.7:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770.9:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770.9:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4766.25:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4747.65:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4743:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4743:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.1:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715.1:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710.45:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:3213.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4682.55:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4663.95:3245.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:3241.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3199.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3199.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3203.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4631.4:3250.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4636.05:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4654.65:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4659.3:3417.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3427.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3460.52 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3464.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3486.12 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4644.81:3490.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4627.74:3490.39 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4623.49:3494.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4623.49:3537.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4627.74:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4644.83:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3545.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4636.28:3503.18 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3517.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4661.87:3477.59 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4674.68:3490.39 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4751.44:3567.16 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4751.44:3575.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4755.69:3579.93 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.19:3579.93 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4779.44:3575.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4779.44:3545.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.19:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4768.69:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4765.44:3538.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4765.44:3481.84 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.17:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4730.11:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.86:3473.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.86:3464.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.86:3461.06 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710.45:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.8:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710.45:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4863.9:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4863.9:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4891.8:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4891.8:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4919.7:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4919.7:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4947.6:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4947.6:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.85:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4975.5:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4975.5:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4980.15:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4998.75:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5003.4:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5003.4:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.05:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5026.65:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5031.3:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5031.3:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5026.65:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5012.7:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5012.7:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5073.15:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5077.8:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5077.8:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5073.15:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5045.25:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5040.6:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5040.6:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5045.25:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5082.45:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5087.1:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5087.1:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5091.75:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5096.4:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5099.07:3298.83 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5100.21:3298.83 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5118.96:3280.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5118.96:3272.67 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5103.28:3256.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5103.28:3251.22 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5109.05:3245.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5109.05:3240.51 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5104.1:3235.56 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5104.1:3228.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5141.23:3191.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5148.64:3191.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5167.2:3209.59 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4725.86:3567.16 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.86:3545.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4721.61:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.52:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700.27:3545.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700.27:3575.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.52:3579.93 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4721.59:3579.93 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.86:3584.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.86:3589.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4728.7:3592.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4783.14:3592.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4790:3585.88 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4790:3535 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4795:3530 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4795:3523.38 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4788.78:3517.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4782.55:3517.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4779.44:3514.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4779.44:3464.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4779.44:3460.36 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3445.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3441 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3441 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3371.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3371.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4826.7:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4826.7:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3371.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3375.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3371.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4854.6:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4854.6:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4882.5:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4882.5:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4910.4:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4910.4:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4938.3:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4938.3:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4961.55:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4966.2:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4966.2:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.85:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4989.45:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4994.1:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4994.1:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4998.75:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5022:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5022:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5026.65:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5045.25:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5049.9:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5049.9:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5054.55:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5073.15:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5077.8:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5077.8:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5082.45:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5142.9:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5145.29:3345.61 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5145.29:3343.91 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5152.84:3336.36 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5152.84:3328.83 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5137.69:3313.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5137.69:3306.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5209.4:3234.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5209.4:3229.48 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5204.32:3224.41 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5204.32:3217 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5231.27:3190.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5231.27:3184.56 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5225.77:3179.06 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5225.77:3173.28 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5231.55:3167.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5231.55:3162.56 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5226.6:3157.61 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5226.6:3150.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5241.47:3135.33 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5248.88:3135.33 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5263.73:3150.17 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5271.14:3150.17 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5297.11:3124.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5297.11:3116.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5282.27:3101.94 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5274.85:3101.94 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5260.01:3116.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5252.59:3116.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5237.73:3101.93 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5230.32:3101.93 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5215.46:3116.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5208.03:3116.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5182.76:3091.52 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5182.76:3084.08 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5208.75:3058.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5208.75:3050.67 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5170.92:3012.84 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5163.49:3012.84 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5125.54:3050.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5119.79:3050.79 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5114.02:3045.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5109.07:3045.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5104.11:3049.98 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5096.68:3049.98 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5081.83:3035.12 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5074.42:3035.12 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5058.73:3050.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5058.73:3056.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5064.5:3062.34 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5064.5:3067.28 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5059.55:3072.23 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5059.55:3079.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5085.73:3105.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5093.14:3105.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5108.76:3090.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5114.66:3090.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5120.56:3096.09 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5125.49:3096.09 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5130.44:3091.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5137.85:3091.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5199.6:3152.91 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5199.6:3160.41 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5183.91:3176.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5183.91:3181.76 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5186.59:3184.44 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5186.59:3190.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5180.82:3195.97 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5180.82:3200.91 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5185.77:3205.86 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5185.77:3213.27 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5159.78:3239.26 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5159.78:3246.69 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5167.2:3254.11 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/BOTTOM" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4687.47:3503.18 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4698.22:3514.92 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700:3515 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4713.06:3477.59 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4713.06:3465.59 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4695:3450 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.47:3457.53 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.47:3477.59 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5256.29:3098.22 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5249.69:3104.82 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5249.69:3111.41 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5256.29:3118.02 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5264.55:3126.27 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5300:3161.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5300:3170.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5141.3:3328.71 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5087.79:3328.71 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5087.1:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5082.45:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5073.15:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5063.85:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5054.55:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5045.25:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5035.95:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5026.65:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.05:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4998.75:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4989.45:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4980.15:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.85:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4961.55:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4826.7:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4826.7:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3338.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4766.25:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4750.3:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4745:3334.7 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4745:3440.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.06:3460.26 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.06:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.06:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4730.65:3489.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.65:3497.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.65:3503.18 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4713.06:3503.18 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700:3490.12 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700:3465.06 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715:3450.06 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4715:3315.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:3296.85 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4687.2:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4710.45:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4747.65:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4766.25:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.1:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.1:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4929:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4929:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4956.9:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4956.9:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4961.55:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4980.15:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4984.8:3278.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4984.8:3287.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4989.45:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.05:3292.2 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5040.6:3282.9 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5041.01:3282.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5041.01:3259 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5190.37:3109.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5203.39:3109.64 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5242.28:3148.53 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5242.28:3156.78 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5234.02:3165.04 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4661.87:3503.18 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3491.31 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4650:3461.72 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4651.72:3460 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4672.85:3460 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3454.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4677.9:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4682.55:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4691.85:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.5:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4701.15:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4719.75:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4724.4:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4729.05:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4747.65:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3259.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3268.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3273.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4961.55:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.85:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4980.15:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4989.45:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4998.75:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.05:3255 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3264.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5018.39:3263.26 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5018.39:3256.61 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5140:3135 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4738.65:3477.59 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.65:3465.59 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.65:3463.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4760:3442.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4760:3397.55 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4762.75:3394.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4762.75:3353.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4768.05:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4780.2:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4803.45:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4808.1:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4836:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4863.9:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4863.9:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4891.8:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4891.8:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4919.7:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4919.7:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4947.6:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4947.6:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.85:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4975.5:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4975.5:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4980.15:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4998.75:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5003.4:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5003.4:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.05:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5026.65:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5031.3:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5031.3:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5035.95:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5054.55:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5059.2:3352.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5059.2:3361.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5063.85:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5082.45:3366.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5091.75:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5105.7:3357.3 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5111.66:3351.34 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5135.4:3351.34 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5187.53:3299.21 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5205.78:3299.21 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5330:3174.99 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5330:3150.01 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5300.5:3120.51 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5278.59:3120.51 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5278.57:3120.49 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4733.7:3315.45 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4766.25:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4831.35:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4859.25:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4887.15:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4915.05:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4942.95:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4961.55:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4970.85:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4980.15:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4989.45:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4998.75:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.05:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5026.65:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5035.95:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5045.25:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5052.41:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5057.5:3296.41 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5057.5:3272.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5160:3170 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5170:3170 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5183.75:3183.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5191.25:3183.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5211.75:3163.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5211.75:3142.77 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4695:3450 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4695.11:3450.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4702.1:3449.74 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5144.92:3276.39 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5152.53:3284 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5152.53:3291.41 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5145.11:3298.83 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5133.98:3309.97 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.66:3321.28 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.66:3327.76 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5124.3:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5124.3:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5119.65:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5082.45:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5077.8:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5077.8:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5082.45:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5101.05:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5105.7:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5105.7:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5101.05:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5054.55:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5049.9:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5049.9:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5054.55:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5063.85:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5068.5:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5068.5:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5063.85:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5045.25:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5040.6:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5040.6:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5035.95:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5017.35:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5012.7:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5012.7:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5008.05:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4989.45:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4984.8:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4984.8:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4980.15:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4961.55:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4956.9:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4956.9:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4952.25:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4933.65:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4929:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4929:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4924.35:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4905.75:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.1:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4901.1:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4896.45:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4877.85:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4873.2:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4868.55:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4849.95:3310.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4845.3:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4840.65:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4822.05:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4817.4:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4812.75:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4789.5:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4784.85:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3348 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770.9:3343.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4770.9:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4775.55:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3320.1 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3315.45 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4798.8:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4794.15:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3301.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3306.15 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4733.7:3324.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4738.35:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4756.95:3329.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3334.05 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.6:3436.35 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3445.65 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4752.3:3459.6 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4751.44:3460.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4751.44:3464.8 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4751.44:3474.33 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4754.68:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.17:3477.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4765.44:3481.84 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4765.44:3538.32 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4768.69:3541.57 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4768.69:3568.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4765.44:3571.41 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4765.44:3588.47 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4761.17:3592.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4704.52:3592.74 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700.27:3588.49 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4700.27:3571.41 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4696.02:3567.16 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4674.68:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_82")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4713.06:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4725.86:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4661.87:3579.95 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4674.68:3592.74 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4661.87:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4674.68:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4636.28:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4649.08:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4738.65:3554.36 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4751.44:3567.16 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4815.96:3605 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4815.42:3605.54 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4700:3515 _clp_cinfo))
	(_clpMKSConvert 4.950000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.950000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4705.36:3514.6 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/V4" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5011.32:3165.03 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5011.49:3187.47 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5033.58:3098.22 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5033.59:3120.5 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5055.86:3120.49 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5056.03:3142.93 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4989.04:3142.76 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4989.05:3165.04 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5100.4:3031.41 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5100.4:3055.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5132.48:3087.48 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5114.96:3105 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5105:3105 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5081.25:3081.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5073.75:3081.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5058.75:3096.25 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5058.75:3103.75 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5080:3125 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5080:3140 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5011.5:3208.5 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4966.2:3208.5 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 4966.2:3208.5 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4967.24:3207.46 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 4968.89:3207.46 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5122.67:3231.84 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.66:3245 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5122.66:3254.13 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.66:3245 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5122.66:3245 _clp_cinfo))
	(_clpMKSConvert 3.750000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.66:3231.86 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.67:3231.85 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5078.12:3098.22 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5078.13:3098.23 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5122.67:3053.69 _clp_cinfo))
	(_clpMKSConvert 3.750000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.66:3053.68 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5122.69:3057.95 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5140:3075 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5100.4:3254.12 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5100.4:3276.39 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5100.4:3254.11 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5100.4:3254.12 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5167.21:3231.85 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5167.2:3254.11 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5167.2:3187.32 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5167.2:3195 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5167.2:3209.59 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5167.2:3187.3 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5167.2:3187.32 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5144.94:3209.58 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5144.94:3231.85 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5144.94:3209.57 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5144.94:3209.58 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5167.2:3187.32 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5167.21:3187.31 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5170:3155 _clp_cinfo))
	(_clpMKSConvert 5.300000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5175:3160 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5184.44:3160 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 5.300000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5189.48:3165.04 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5144.95:3031.41 _clp_cinfo))
	(_clpMKSConvert 3.750000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 3.750000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5144.94:3031.4 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5145.1:3053.86 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5170:3155 _clp_cinfo))
	(_clpMKSConvert 4.800000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5165:3155 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5145:3135 _clp_cinfo))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.800000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5140:3135 _clp_cinfo))
_clpPl = list(
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/S3" nil _clp_sym _clpPl)
_clpPl = nil

_clp_path  = (_clpPathStart (list (_clpAdjustPt 5144.94:3254.11 _clp_cinfo))
	(_clpMKSConvert 4.000000 _clp_cinfo->t_from_units _clp_cinfo->t_to_units))
_clp_path  = (_clpPathLine _clp_path (_clpMKSConvert 4.000000 _clp_cinfo->t_from_units
	_clp_cinfo->t_to_units) (_clpAdjustPt 5144.92:3276.39 _clp_cinfo))
_clpPl = list(
	'(CLIP_DRAWING "CLIP_83")
	list("CLIP_DRAWING" _clp_clip_prop_value))
_clp_dbid = _clpDBCreatePath(_clp_path "ETCH/TOP" nil _clp_sym _clpPl)
_clpPl = nil

printf(" 100 percent completed")
newline()

axlFlushDisplay()
