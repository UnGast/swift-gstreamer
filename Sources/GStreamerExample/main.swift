import CGStreamer

gst_init(nil, nil)

var loop = g_main_loop_new(nil, 0)
var pipeline = gst_pipeline_new("audio-player")
var source = gst_element_factory_make("filesrc", "file-source")
var demuxer = gst_element_factory_make("oggdemux", "ogg-demuxer")
var decoder = gst_element_factory_make("vorbisdec", "vorbis-decoder")
var conv = gst_element_factory_make("audioconvert", "converter")
var sink = gst_element_factory_make("autoaudiosink", "audio-output")
gst_element_link_many(decoder, conv, sink, nil)