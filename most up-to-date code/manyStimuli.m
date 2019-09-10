
% twoStimuli
% randomStimuli(stimuliNum, stimuliSize, ISI, clr,  itr)
% plot number (stimuliNum ) of rectangles in random postions of size
% stimuliSize. Repeaet this itr time with ISI between them
% example:
% randomStimuli(10, 3, 5, 100, 100, 500, 255, 5, [500 400 700
% 800],'test1.txt')

debugOn = 1;

try	
	% If there are multiple displays guess that one without the menu bar is the
	% best choice.  Dislay 0 has the menu bar.  
	screens=Screen('Screens');
	screenNumber=max(screens);
        
	% Open a window.  Note the new argument to OpenWindow with value 2,
	% specifying the number of buffers to the onscreen window.  
	[window,windowRect] = Screen(screenNumber,'OpenWindow',0,[],[],2);
	
	% Give the display a moment to recover from the change of display mode when
	% opening a window. It takes some monitors and LCD scan converters a few seconds to resync.
	WaitSecs(2);
		
	% Show the movie, first forwards, then backwards.  We don't need offscreen
	% windows as in OS 9.  FillOval is now fast enough to draw ovals during the
	% animation.

	
	black=BlackIndex(window);
	white=WhiteIndex(window);
	
	priorityLevel=MaxPriority(window);
	HideCursor;
	Priority(priorityLevel);

    Screen(window,'FillRect', black);

    res=1;

    manyStimuli_Core;

    Priority(0);
    ShowCursor;
	
	
	% In OS 9 we checked for missed frames by comparing the actual movie play
	% duration to the expected duration as predicted by the number of frames
	% shown and the frame rate  reported by Screen('FrameRate'). However,
	% FrameRate on PTB-3 returns the nominal frame rate reported by the video
	% card driver.  That is imprecise.  So instead, we use the median frame
	% period, which will work except for in case of egregious synching failure.
	
	% Close the on- and off-screen windows
	Screen('CloseAll');
	
catch
    %this "catch" section executes in case of an error in the "try" section
    %above.  Importantly, it closes the onscreen window if its open.
    Screen('CloseAll');
    
    Priority(0);
    psychrethrow(psychlasterror);
end % try..catch
