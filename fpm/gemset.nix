{
  arr-pm = {
    dependencies = ["cabin"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "07yx1g1nh4zdy38i2id1xyp42fvj4vl6i196jn7szvjfm0jx98hg";
      type = "gem";
    };
    version = "0.0.10";
  };
  backports = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0rg58rd3hgk8wz4fbapn3szwgymk1q9lv4ywg37bkbcflsbi70iy";
      type = "gem";
    };
    version = "3.17.2";
  };
  cabin = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0b3b8j3iqnagjfn1261b9ncaac9g44zrx1kcg81yg4z9i513kici";
      type = "gem";
    };
    version = "0.9.0";
  };
  childprocess = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ic028k8xgm2dds9mqnvwwx3ibaz32j8455zxr9f4bcnviyahya5";
      type = "gem";
    };
    version = "3.0.0";
  };
  clamp = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0jb6l4scp69xifhicb5sffdixqkw8wgkk9k2q57kh2y36x1px9az";
      type = "gem";
    };
    version = "1.0.1";
  };
  dotenv = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "17hkd62ig9b0czv192kqdfq7gw0a8hgq07yclri6myc8y5lmfin5";
      type = "gem";
    };
    version = "2.7.5";
  };
  ffi = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "12lpwaw82bb0rm9f52v1498bpba8aj2l2q359mkwbxsswhpga5af";
      type = "gem";
    };
    version = "1.13.1";
  };
  fpm = {
    dependencies = ["arr-pm" "backports" "cabin" "childprocess" "clamp" "ffi" "json" "pleaserun" "ruby-xz" "stud"];
    groups = ["default"];
    platforms = [];
    source = {
      fetchSubmodules = false;
      rev = "c12678536f45b6ea564a07f9a0ff522215d476d1";
      sha256 = "1p8cx284i2zfyd54awankxgazp6gyrqjwq1imvb030m9qnbkxf1s";
      type = "git";
      url = "https://github.com/dezgeg/fpm.git";
    };
    version = "1.10.0";
  };
  insist = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0bw3bdwns14mapbgb8cbjmr0amvwz8y72gyclq04xp43wpp5jrvg";
      type = "gem";
    };
    version = "1.0.0";
  };
  io-like = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01l358q8smk99k6c2h5zygyw4flqg93zk4x61amp9slbs4j0gbms";
      type = "gem";
    };
    version = "0.3.1";
  };
  json = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qmj7fypgb9vag723w1a49qihxrcf5shzars106ynw2zk352gbv5";
      type = "gem";
    };
    version = "1.8.6";
  };
  mustache = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1g5hplm0k06vwxwqzwn1mq5bd02yp0h3rym4zwzw26aqi7drcsl2";
      type = "gem";
    };
    version = "0.99.8";
  };
  pleaserun = {
    dependencies = ["cabin" "clamp" "dotenv" "insist" "mustache" "stud"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ss9l6k3xasj3b2n03xs5zpaicrqx54rv7mpd6ckh05wvphcdadv";
      type = "gem";
    };
    version = "0.0.31";
  };
  ruby-xz = {
    dependencies = ["ffi" "io-like"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "11bgpvvk0098ghvlxr4i713jmi2izychalgikwvdwmpb452r3ndw";
      type = "gem";
    };
    version = "0.2.3";
  };
  stud = {
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0qpb57cbpm9rwgsygqxifca0zma87drnlacv49cqs2n5iyi6z8kb";
      type = "gem";
    };
    version = "0.0.23";
  };
}