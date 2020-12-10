import CGStreamer

public class X264Enc: Element {
    public convenience init(bitrate: Int, name: String? = nil) {
        self.init(internalElement: gst_element_factory_make("x264enc", name))
        setProperty("bitrate", Int32(bitrate))
    }
}