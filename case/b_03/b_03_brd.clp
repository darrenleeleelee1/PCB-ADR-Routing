; Allegro sub-drawing file
; Created by Allegro PCB Design XL (legacy); version= 16.6-2015 S115

_clp_lay_drw = axlDesignType(nil)
_clp_sym = nil
_clp_pbuf  = nil
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
_clp_cinfo->createNCLayers = t
_clp_group_info = make_clp_group_info()
_clp_cinfo->group_info = _clp_group_info
_clp_accuracy =2
_clpCheckAccuracy(_clp_accuracy _clp_cinfo->t_from_units	 	_clp_cinfo->t_to_units)

(putprop _clp_cinfo (list (_clpAdjustPt 110.00:3767.00 _clp_cinfo) (_clpAdjustPt 1518.00:5257.00 _clp_cinfo)) 'l_extents)
(putprop _clp_cinfo (_clpAdjustPt '(0.0 0.0) _clp_cinfo) 'l_zeropt) (unless (_clpSelectRotOrg _clp_cinfo) (error "CANCEL"))
_clp_clip_prop_value = _clpGetClipPropValue()
if(_clpPinText then axlMsgPut(list("Text pasted without CLIP_DRAWING property." _clpAxlMsg.classWarn)) _clpDisplayMessage()) 
axlFlushDisplay()
