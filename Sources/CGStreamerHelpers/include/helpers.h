#include <gstreamer-1.0/gst/gst.h>
#include <gstreamer-1.0/gst/gstsample.h>
#include <gstreamer-1.0/gst/app/app.h>
#include <gstreamer-1.0/gst/app/app-prelude.h>
#include <gstreamer-1.0/gst/app/app-enumtypes.h>
#include <gstreamer-1.0/gst/app/gstappsink.h>
#include <glib-2.0/glib.h>
#include <glib-2.0/glib-object.h>
#include <stdbool.h>
#include "types.h"

GstBin* bin_cast(GstElement* el);

GstObject* object_cast(GstElement* el);

GObject* gobject_cast(GstElement *object);

GValue new_gvalue();

GValue new_gvalue_string(const gchararray content);

GValue new_gvalue_int(const int content);

GValue new_gvalue_bool(const bool value);

GValue new_gvalue_fraction(const int numerator, const int denominator);

void set_gst_element_struct_field(GstElement* el, const char* name, struct any_object* value);

GstSample* get_gst_sample(GstElement* sink);