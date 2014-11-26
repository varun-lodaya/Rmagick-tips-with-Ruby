def crop_large_oval
    manipulate! do |source|

        source = source.resize_to_fill(500,500)
        canvas = Magick::Image.new 500, 500
        gc = Magick::Draw.new
        gc.fill 'black'
        gc.ellipse(250,250,250,220,0,360)
        gc.draw canvas

        canvas = canvas.rotate(-25)
        mask = canvas.negate
        mask.matte = false
        source.matte = true

        gl = Magick::Draw.new
        gl.fill color
        gl.stroke color
        gl.rectangle(0,340,500,500)
        gl.draw(source)
        source.composite!(mask, Magick::CenterGravity, Magick::CopyOpacityCompositeOp)
    end  
end
