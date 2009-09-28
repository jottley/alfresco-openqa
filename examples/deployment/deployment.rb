require 'rubygems'
require 'watir'
require 'csv'

include FireWatir

class TestStepFailed < RuntimeError
end
class InteractionFailure < RuntimeError
end

class Deployment
  def initialize(port, profile, webproject, authoring, filter, targets, timeout)
    csv_keeper = [webproject]
    
    begin
      failedSteps = 0
      passedSteps = 0
      puts "Starting test.."
      start_time = Time.now
      
      # URL start point
      #ie = Firefox.new(:port=>port, :profile=> profile, :multiple_browser_xpi => true)
      ie = Firefox.new(:profile=> profile)
      ie.goto("http://" + authoring + ":8080/alfresco/faces/jsp/login.jsp")
      
      sub_timer = Time.now
      # asserting present: [TextField: 'loginForm:user-name']
      begin
        pass = 0
        @textfield0 = ie.text_field(:id, "loginForm:user-name")
        while not @textfield0.exists? do
          if (pass > 20)
            raise TestStepFailed
          end
          sleep 0.1
          pass += 1
        end
        puts "[-PASS-]>[TextField: 'loginForm:user-name']"
        passedSteps += 1 
      rescue TestStepFailed
        puts "[-FAIL-]>[TextField: 'loginForm:user-name']"
        failedSteps += 1 
        puts "Step failed: Check present: [TextField: 'loginForm:user-name']"
      end
      STDOUT.flush
      
      # asserting present: [Password: 'loginForm:user-password']
      begin
        pass = 0
        @password0 = ie.text_field(:id, "loginForm:user-password")
        while not @password0.exists? do
          if (pass > 20)
            raise TestStepFailed
          end
          sleep 0.1
          pass += 1
        end
        puts "[-PASS-]>[Password: 'loginForm:user-password']"
        passedSteps += 1 
      rescue TestStepFailed
        puts "[-FAIL-]>[Password: 'loginForm:user-password']"
        failedSteps += 1 
        puts "Step failed: Check present: [Password: 'loginForm:user-password']"
      end
      STDOUT.flush
      
      # asserting present: [Button: 'Login']
      begin
        pass = 0
        @button0 = ie.button(:value, "Login")
        while not @button0.exists? do
          if (pass > 20)
            raise TestStepFailed
          end
          sleep 0.1
          pass += 1
        end
        puts "[-PASS-]>[Button: 'Login']"
        passedSteps += 1 
      rescue TestStepFailed
        puts "[-FAIL-]>[Button: 'Login']"
        failedSteps += 1 
        puts "Step failed: Check present: [Button: 'Login']"
      end
      STDOUT.flush
      
      # user interaction: Enter text 'admin' [TextField: 'loginForm:user-name']
      begin
        @textfield0.set("admin")
        passedSteps += 1 
      rescue
        puts "[-EXCEPTION-]>[TextField: 'loginForm:user-name'] -- " + $!
        failedSteps += 1 
        puts "Could not set admin [TextField: 'loginForm:user-name']"
        raise InteractionFailure
      end
      
      # user interaction: Enter text 'admin' [Password: 'loginForm:user-password']
      begin
        @password0.set("admin")
        passedSteps += 1 
      rescue
        puts "[-EXCEPTION-]>[Password: 'loginForm:user-password'] -- " + $!
        failedSteps += 1 
        puts "Could not set admin [Password: 'loginForm:user-password']"
        raise InteractionFailure
      end
      
      # user interaction: Click [Button: 'Login']
      begin
        @button0.click
        passedSteps += 1 
      rescue
        puts "[-EXCEPTION-]>[Button: 'Login'] -- " + $!
        failedSteps += 1 
        puts "Could not click [Button: 'Login']"
        raise InteractionFailure
      end
      #login time
      #csv_keeper << Time.now - sub_timer
      
      sub_timer = Time.now
      # asserting present: [Link: 'Company Home']
      begin
        pass = 0
        @link1 = ie.link(:text, "Company Home")
        while not @link1.exists? do
          if (pass > 20)
            raise TestStepFailed
          end
          sleep 0.1
          pass += 1
        end
        puts "[-PASS-]>[Link: 'Company Home']"
        passedSteps += 1 
      rescue TestStepFailed
        puts "[-FAIL-]>[Link: 'Company Home']"
        failedSteps += 1 
        puts "Step failed: Check present: [Link: 'Company Home']"
      end
      STDOUT.flush
      
      # user interaction: Click [Link: 'Company Home']
      begin
        @link1.click
        passedSteps += 1 
      rescue
        puts "[-EXCEPTION-]>[Link: 'Company Home'] -- " + $!
        failedSteps += 1 
        puts "Could not click [Link: 'Company Home']"
        raise InteractionFailure
      end
      
      # asserting present: [Link: 'Web Projects']
      begin
        pass = 0
        @link2 = ie.link(:text, "Web Projects")
        while not @link2.exists? do
          if (pass > 20)
            raise TestStepFailed
          end
          sleep 0.1
          pass += 1
        end
        puts "[-PASS-]>[Link: 'Web Projects']"
        passedSteps += 1 
      rescue TestStepFailed
        puts "[-FAIL-]>[Link: 'Web Projects']"
        failedSteps += 1 
        puts "Step failed: Check present: [Link: 'Web Projects']"
      end
      STDOUT.flush
      
      # user interaction: Click [Link: 'Web Projects']
      begin
        @link2.click
        passedSteps += 1 
      rescue
        puts "[-EXCEPTION-]>[Link: 'Web Projects'] -- " + $!
        failedSteps += 1 
        puts "Could not click [Link: 'Web Projects']"
        raise InteractionFailure
      end
      
      # asserting present: [Link: '{webproject']
      begin
        pass = 0
        @link3 = ie.link(:text, webproject)
        while not @link3.exists? do
          if (pass > 20)
            raise TestStepFailed
          end
          sleep 0.1
          pass += 1
        end
        puts "[-PASS-]>[Link: '"+webproject+"']"
        passedSteps += 1 
      rescue TestStepFailed
        puts "[-FAIL-]>[Link: '"+webproject+"']"
        failedSteps += 1 
        puts "Step failed: Check present: [Link: '"+webproject+"']"
      end
      STDOUT.flush
      
      # user interaction: Click [Link: '{webproject']
      begin
        @link3.click
        passedSteps += 1 
      rescue
        puts "[-EXCEPTION-]>[Link: '"+webproject+"'] -- " + $!
        failedSteps += 1 
        puts "Could not click [Link: '"+webproject+"']"
        raise InteractionFailure
      end
      #time to navigate into webproject
      #csv_keeper << Time.now - sub_timer
      
      sub_timer = Time.now
      # asserting present: [Image: 'Recent Snapshots']
      begin
        pass = 0
        @image0 = ie.image(:alt, "Recent Snapshots")
        while not @image0.exists? do
          if (pass > 20)
            raise TestStepFailed
          end
          sleep 0.1
          pass += 1
        end
        puts "[-PASS-]>[Image: 'Recent Snapshots']"
        passedSteps += 1 
      rescue TestStepFailed
        puts "[-FAIL-]>[Image: 'Recent Snapshots']"
        failedSteps += 1 
        puts "Step failed: Check present: [Image: 'Recent Snapshots']"
      end
      STDOUT.flush
      
      # user interaction: Click [Image: 'Recent Snapshots']
      begin
        @image0.click
        passedSteps += 1 
      rescue
        puts "[-EXCEPTION-]>[Image: 'Recent Snapshots'] -- " + $!
        failedSteps += 1 
        puts "Could not click [Image: 'Recent Snapshots']"
        raise InteractionFailure
      end
      #time to open snapshot list
      #csv_keeper << Time.now - sub_timer
      
      ie.links.each {
        |link|
        if (link.attribute_value('onClick') == "document.forms['website']['website:modelist'].value='website:snap-filter:"+filter.downcase+"';document.forms['website'].submit();return false;")
          link.fire_event('onClick')
        end
      }
      
      # asserting present: [Image: 'Deploy']
      begin
        pass = 0
        @image1 = ie.image(:alt, "Deploy")
        while not @image1.exists? do
          if (pass > 20)
            raise TestStepFailed
          end
          sleep 0.1
          pass += 1
        end
        puts "[-PASS-]>[Image: 'Deploy']"
        passedSteps += 1 
      rescue TestStepFailed
        puts "[-FAIL-]>[Image: 'Deploy']"
        failedSteps += 1 
        puts "Step failed: Check present: [Image: 'Deploy']"
      end
      STDOUT.flush
      
      #get initial list of all the on page 1 of today
      snapshotLinks = Array.new
      
      #find deploy snapshots
      ie.links.each {
        |link|
        if (link.id == 'snapshot_deploy_'+webproject.downcase)
          snapshotLinks.push(link)
        end
      }
      
      #In some releases of Alfresco (i.e. 3.1.1) the list of snapshots is reveresed
      if (reverse == true)
        snapshotLinks.reverse!  
      end
      
      #snapshotLinks.reverse_each {
      snapshotLinks.each {
        |link|
        ie.links.each{
          |l|
          if (l.attribute_value('onClick') == link.attribute_value('onClick'))
            begin
              l.fire_event("onclick")
              puts "[-PASS-]>[Link: 'onClick']"
              passedSteps +=1
            rescue
              puts "[-EXCEPTION-]>[Link: 'onClick'] -- " + $!
              failedSteps += 1 
              puts "Could not click Link: 'onClick']"
              raise InteractionFailure
            end
            
            sub_timer = Time.now
            # asserting present: [Text: 'Select the servers to deploy to and click OK']
            begin
              pass = 0
              while ie.text.index("Select the servers to deploy to and click OK") == nil do
                if (pass > 20)
                  raise TestStepFailed
                end
                sleep 0.1
                pass += 1
              end
              puts "[-PASS-]>[Text: 'Select the servers to deploy to and click OK']"
              passedSteps += 1 
            rescue TestStepFailed
              puts "[-FAIL-]>[Text: 'Select the servers to deploy to and click OK']"
              failedSteps += 1 
              puts "Step failed: Check present: [Text: 'Select the servers to deploy to and click OK']"
            end
            STDOUT.flush
            
            # asserting present: [Button: 'OK']
            begin
              pass = 0
              @button1 = ie.button(:value, "OK")
              while not @button1.exists? do
                if (pass > 20)
                  raise TestStepFailed
                end
                sleep 0.1
                pass += 1
              end
              puts "[-PASS-]>[Button: 'OK']"
              passedSteps += 1 
            rescue TestStepFailed
              puts "[-FAIL-]>[Button: 'OK']"
              failedSteps += 1 
              puts "Step failed: Check present: [Button: 'OK']"
            end
            STDOUT.flush
            
            # user interaction: Click [Button: 'OK']
            begin
              @button1.click
              passedSteps += 1 
            rescue
              puts "[-EXCEPTION-]>[Button: 'OK'] -- " + $!
              failedSteps += 1 
              puts "Could not click [Button: 'OK']"
              raise InteractionFailure
            end
            
            # asserting present: [Image: '/alfresco/images/icons/deploy_successful.gif']
            if (targets == 1)
              begin
                pass = 0
                @image0 = ie.image(:src, "/alfresco/images/icons/deploy_successful.gif")
                @image1 = ie.image(:src, "/alfresco/images/icons/deploy_failed.gif")
                while not @image0.exists? do
                  break if @image1.exists?
                  if (pass > timeout)
                    puts "[-FAIL-]>Deployment test timed out.  Increase number of passes."
                    raise TestStepFailed
                  end
                  sleep 1
                  pass += 1
                end          
                if @image1.exists? && (ie.text.index("Deployment in progress to default") != nil)
                  puts "[-PASS-]>Deployment Blocked: Deployment in progress to default"
                elsif @image1.exists? && (ie.text.index("Deployment in progress to default") == nil)
                  raise TestStepFailed 
                end
                puts "[-PASS-]>[Image: '/alfresco/images/icons/deploy_successful.gif']"
                passedSteps += 1 
              rescue TestStepFailed
                puts "[-FAIL-]>[Image: '/alfresco/images/icons/deploy_successful.gif']"
                failedSteps += 1 
                puts "Step failed: Check present: [Image: '/alfresco/images/icons/deploy_successful.gif.']"
              end
              STDOUT.flush
              #time to deploy
              csv_keeper << Time.now - sub_timer
            else 
              begin
                # Timeout on the number of passes to make
                totalPasses = timeout
                pass = 0
                # Succesful & Failed deployments found
                found = 0
                
                @image0 = "/alfresco/images/icons/deploy_successful.gif"
                @image1 = "/alfresco/images/icons/deploy_failed.gif"
                
                # Go until there are as many success/failures as there are targets
                while found <= targets do
                  count = 0
                  success = 0;
                  t_success = 0;
                  fail = 0;
                  
                  # Timeout
                  if (pass > totalPasses)
                    raise TestStepFailed
                  end
                  
                  # Loop the images in the DOM
                  ie.images.each {  
                    |i|
                    if (i.src == @image0)
                      success += 1
                    elsif (i.src == @image1)
                      fail += 1
                    end
                    
                    count = success + fail
                  }
                  
                  # If we found a new success or failure log it
                  if (count >= found)
                    begin
                      found += 1
                      count = 0
                      # Time to deploy
                      csv_keeper << Time.now - sub_timer
                      
                      if success > t_success
                        puts "[-PASS-]>[Image: '/alfresco/images/icons/deploy_successful.gif']"
                        t_success += 1
                        passedSteps += 1
                      elsif fail >= 1
                        raise TestStepFailed
                      end
                      fail = 0
                      success = 0
                    rescue TestStepFailed
                      puts "[-FAIL-]>[Image: '/alfresco/images/icons/deploy_successful.gif']"
                      failedSteps += 1 
                      puts "Step failed: Check present: [Image: '/alfresco/images/icons/deploy_successful.gif.']"
                    end
                  end
                  #Up the timer
                  sleep 1
                  pass += 1
                end 
              rescue TestStepFailed
                puts "[-FAIL-]>Deployment test timed out -- Increase number of passes."
                failedSteps += 1 
              end
              STDOUT.flush
            end
            # asserting present: [Button: 'Close']
            begin
              pass = 0
              @button2 = ie.button(:value, "Close")
              while not @button2.exists? do
                if (pass > 20)
                  raise TestStepFailed
                end
                sleep 0.1
                pass += 1
              end
              puts "[-PASS-]>[Button: 'Close']"
              passedSteps += 1 
            rescue TestStepFailed
              puts "[-FAIL-]>[Button: 'Close']"
              failedSteps += 1 
              puts "Step failed: Check present: [Button: 'Close']"
            end
            STDOUT.flush
            
            # user interaction: Click [Button: 'Close']
            begin
              @button2.click
              passedSteps += 1 
            rescue
              puts "[-EXCEPTION-]>[Button: 'Close'] -- " + $!
              failedSteps += 1 
              puts "Could not click [Button: 'Close']"
              raise InteractionFailure
            end
            
            sleep 5
            
            # asserting present: [Image: 'Recent Snapshots']
            begin
              pass = 0
              @image0 = ie.image(:alt, "Recent Snapshots")
              while not @image0.exists? do
                if (pass > 20)
                  raise TestStepFailed
                end
                sleep 0.1
                pass += 1
              end
              puts "[-PASS-]>[Image: 'Recent Snapshots']"
              passedSteps += 1 
            rescue TestStepFailed
              puts "[-FAIL-]>[Image: 'Recent Snapshots']"
              failedSteps += 1 
              puts "Step failed: Check present: [Image: 'Recent Snapshots']"
            end
            STDOUT.flush
            
            # user interaction: Click [Image: 'Recent Snapshots']
            begin
              @image0.click
              passedSteps += 1 
            rescue
              puts "[-EXCEPTION-]>[Image: 'Recent Snapshots'] -- " + $!
              failedSteps += 1 
              puts "Could not click [Image: 'Recent Snapshots']"
              raise InteractionFailure
            end
          end    
        }
      }
      
      # asserting present: [Link: 'Logout (admin)']
      begin
        pass = 0
        @link4 = ie.link(:text, "Logout (admin)")
        while not @link4.exists? do
          if (pass > 20)
            raise TestStepFailed
          end
          sleep 0.1
          pass += 1
        end
        puts "[-PASS-]>[Link: 'Logout (admin)']"
        passedSteps += 1 
      rescue TestStepFailed
        puts "[-FAIL-]>[Link: 'Logout (admin)']"
        failedSteps += 1 
        puts "Step failed: Check present: [Link: 'Logout (admin)']"
      end
      STDOUT.flush
      
      # user interaction: Click [Link: 'Logout (admin)']
      begin
        @link4.click
        passedSteps += 1 
      rescue
        puts "[-EXCEPTION-]>[Link: 'Logout (admin)'] -- " + $!
        failedSteps += 1 
        puts "Could not click [Link: 'Logout (admin)']"
        raise InteractionFailure
      end
      
      #log times
      #csv_keeper << Time.now - start_time
      outfile = File.open('csvout.csv', 'a')
      CSV::Writer.generate(outfile) do |csv|
        csv << csv_keeper
      end
      outfile.close
      
      puts ""
      if (failedSteps == 0)
        puts (passedSteps.to_s + " steps passed, no steps failed.")
      else
        puts ""+(passedSteps.to_s + " steps passed, " + failedSteps.to_s + " steps failed!")
      end
      puts "[Test done]"
      puts "Press enter to exit"
      STDOUT.flush
      gets
      puts "Closing browser.."
      STDOUT.flush
      ie.close
    rescue InteractionFailure
      puts "There were failures during user interactions -- Test was stopped."
    rescue
      puts "Unexpected error from Watir runner: " + $!
    end
  end
end
