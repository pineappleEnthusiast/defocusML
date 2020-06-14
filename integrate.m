function integrate(h)
 
    %% Example: download settings
    % best to set "Transfer" mode in bottom left of GUI to Camera and Computer
    C = CameraController;
    C.session.folder = 'C:\DSLR';
    C.session.filenametemplate = '[Camera Name]\[Date yyyy-MM-dd-hh-mm-ss]';
    C.session.useoriginalfilename = 0; %ignores "filenametemplate"
    C.session.downloadthumbonly = 0; %not working (v2.0.72.9)
    C.session.downloadonlyjpg = 0; %only used if "PC+CAM"
    C.session.deletefileaftertransfer = 1; %only has affect if Transfer="Cam+PC" and affectively converts it to "PC only"
    C.session.asksavepath = 0; %dialogue pop-up for after capture
    C.session.allowoverwrite = 0; %overwrite if file exists
    C.session.lowercaseextension = 1; %use "*.jpg" instead of "*.JPG"

    %% Example: camera settings
    C = CameraController;
    C.camera.isonumber = 400;
    C.camera.fnumber = 4;
    C.camera.shutterspeed = 1/15;
    C.camera.eccompensation = 2.0;
    C.camera.compressionsetting = 'Large Fine JPEG';
    C.camera.drive_mode = 'Single-Frame Shooting';

    %% Example: timed capture, with timelapse option
    C = CameraController;
    C.lag = 0.25; %adjust camera lag (sec)
    duation = 4; %capture every n seconds
    
    for k = 1:2000 %timelapse (optional)
        time = ceil(now*86400/duation)*duation/86400; %upcoming whole 10 seconds
        file = datestr(time,'yyyymmdd_HHMMSS.FFF'); %timestamp
        pause(1)
        C.Capture(file,time); %capture
        pause(4)
        h.MoveJog(0,1);
    end

   

