require 'formula'

class Ng < Formula
  homepage 'http://tt.sakura.ne.jp/~amura/ng/'
  url 'http://tt.sakura.ne.jp/~amura/archives/ng/ng-1.5beta1.tar.gz'
  sha1 '1c812a4994bde77f908a1b08cd68eb3ba120515a'
  version '1.5beta1'

  PATCH_URL = 'https://raw.githubusercontent.com/winebarrel/homebrew-ng-editor/master/tty.c.patch'

  def install
    system './configure'
    system 'make', 'tty.c'
    system "curl #{PATCH_URL} | patch"
    system 'make'
    bin.install 'ng'
  end
end
