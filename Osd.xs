#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <xosd.h>

#define CVS_VERSION "$Id: Osd.xs,v 1.4 2002/08/26 17:05:55 gozer Exp $"

static int
not_here(char *s)
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static int
constant(char *name, int len, int arg)
{
    errno = 0;
	if (strEQ(name + 0, "XOSD_top")) {	
	return XOSD_top;
    }
	else if (strEQ(name + 0, "XOSD_bottom")) {
	return XOSD_bottom;
    }
	
    errno = EINVAL;
    return 0;
}

MODULE = X::Osd		PACKAGE = X::Osd		PREFIX = xosd_

PROTOTYPES: DISABLES
		
double
constant(sv,arg)
    PREINIT:
	STRLEN		len;
    INPUT:
	SV *		sv
	char *		s = SvPV(sv, len);
	int		arg
    CODE:
	RETVAL = constant(s,len,arg);
    OUTPUT:
	RETVAL
			
int			
xosd_string(osd,line,string)
	xosd *	osd
	int		line
	char *	string
	
	CODE:
	RETVAL = xosd_display(osd,line,XOSD_string,string);
	
	OUTPUT:
	RETVAL	
			
int
xosd_percentage(osd,line,percent)
	xosd *	osd
	int		line
	int		percent
	
	CODE:
	RETVAL = xosd_display(osd,line,XOSD_percentage,percent);

	OUTPUT:
	RETVAL		

int
xosd_slider(osd,line,percent)
	xosd *	osd
	int		line
	int		percent
	
	CODE:
	RETVAL = xosd_display(osd,line,XOSD_slider,percent);
	
	OUTPUT:
	RETVAL
			
int
xosd_is_onscreen(osd)
	xosd *	osd

int 
xosd_wait_until_no_display(osd)
	xosd *  osd

int
xosd_scroll(osd, lines)
	xosd *  osd
	int	lines
	
int
xosd_get_number_lines(osd)
	xosd * osd
	
int
xosd_get_colour(osd, red, green, blue)
	xosd *	osd
	int *	red
	int *	green
	int *	blue

int
xosd_hide(osd)
	xosd *	osd

xosd *
xosd_init(font, colour, timeout, pos, offset, shadow_offset, number_lines=1)
	char *	font
	char *	colour
	int	timeout
	int	pos
	int	offset
	int	shadow_offset
	int	number_lines

int
xosd_set_colour(osd, colour)
	xosd *	osd
	char *	colour

int
xosd_set_font(osd, font)
	xosd *	osd
	char *	font

int
xosd_set_offset(osd, offset)
	xosd *	osd
	int	offset

int
xosd_set_pos(osd, pos)
	xosd *	osd
	int	pos

int
xosd_set_shadow_offset(osd, shadow_offset)
	xosd *	osd
	int	shadow_offset

int
xosd_set_timeout(osd, timeout)
	xosd *	osd
	int	timeout

int
xosd_show(osd)
	xosd *	osd

int
xosd_uninit(osd)
	xosd *	osd
