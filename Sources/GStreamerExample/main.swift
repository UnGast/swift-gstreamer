import CGStreamer
import CGStreamerHelpers
import GStreamer

gst_init(nil, nil)

var loop = g_main_loop_new(nil, 0)

var pipeline = Pipeline()
var source = VideoTestSource()
var encoder = AVEncH263()
var sink = TcpServerSink(host: "localhost", port: 3000)

pipeline.add(source)
pipeline.add(encoder)
pipeline.add(sink)

source.link(to: encoder)
encoder.link(to: sink)

//var pipeline = gst_pipeline_new("audio-player")

/*var source = gst_element_factory_make("filesrc", "file-source")
var demuxer = gst_element_factory_make("oggdemux", "ogg-demuxer")
var decoder = gst_element_factory_make("vorbisdec", "vorbis-decoder")
var conv = gst_element_factory_make("audioconvert", "converter")*/
//var source = gst_element_factory_make("audiotestsrc", "audio-source")
//var sink = gst_element_factory_make("autoaudiosink", "audio-output")

/*var bin = bin_cast(pipeline)
gst_bin_add(bin, source)
gst_bin_add(bin, sink)*/

//gst_element_link(source, sink)

//gst_element_set_state(pipeline, GST_STATE_PLAYING)
try pipeline.play()

print("HERE1")

//g_main_loop_run(loop)

print("HERE")

while true {

}

//try pipeline.setState(.null)

//g_main_loop_unref(loop)

