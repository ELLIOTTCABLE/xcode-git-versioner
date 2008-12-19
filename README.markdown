xcode-git-versioner
===================
This is an Xcode auto-versioning script, written in Ruby which updates your
`Info.plist`'s `CFBundleVersion` to the latest git revision number.

See [the wiki][wiki-home] for more information.

  [wiki-home]: <http://github.com/elliottcable/xcode-git-versioner/wikis/home> "Xcode git versioner's wiki on GitHub"

Usage
-----
1. Right-click the target you want to add the versioning phase to (usually the
    target that builds your app)
2. Select: Add -> New Build Phase -> New Run Script Build Phase
3. Specify `/usr/bin/env macruby` as the Shell for the script
4. Paste the script body into the Script text area
5. Ensure that the build phase is at the end of the target's list of build
    phases

Credits
-------
The script is based on [an original Perl][perl] script by Marcus S. Zarra and
Matt Long, subsequently [adapted to Ruby][ruby] by Jason Sallis.

Finally, it was [converted to MacRuby][macruby] and cleaned up by
[elliottcable][], using tips and [snippets][s1] [from][s2] [many][s3] [sources][s4].

  [perl]: <http://www.cimgf.com/2008/04/13/git-and-xcode-a-git-build-number-script/> "Git and Xcode: A git build number script"
  [ruby]: <http://github.com/jsallis/xcode-git-versioner> "jsallis' xcode-git-versioner on GitHub"
  [macruby]: <http://github.com/elliottcable/xcode-git-versioner> "elliottcable's xcode-git-versioner on GitHub"
  [elliottcable]: <http://elliottcable.name/> "elliottcable's home page"
  [s1]: <http://www.stompy.org/2008/08/14/xcode-and-git-another-build-script/>
  [s2]: <http://www.furmanek.net/36/using-macruby-to-set-xcode-project-version-from-git/>
  [s3]: <http://www.codecollector.net/view/D2330B49-A01F-420F-B2FC-EFE8937D6DB1>
  [s4]: <http://github.com/indirect/xcode-git-build-scripts/tree/master/git-version.sh>
