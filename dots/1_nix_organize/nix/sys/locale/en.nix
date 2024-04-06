{ config, pkgs, ... }: {

  time.timeZone = "Australia/Perth";

  #environment.variables = {
    #LOCALE_ARCHIVE = lib.mkForce true; "${pkgs.glibcLocales}/lib/locale/locale-archive";
  #};

  i18n = {
    defaultLocale = "en_US.UTF-8";

    #extraLocaleSettings = {
      #LANGUAGE = "en_US.UTF-8";
      #LANG = "en_US.UTF-8";
      #LC_MESSAGES = "en_US.UTF-8";
      #LC_IDENTIFICATION = "en_US.UTF-8";
      #LC_ALL = "en_US.UTF-8"; # This replaces all the other ones.
      #LC_ALL = "";

      #LC_CTYPE = "en_US.UTF-8/UTF-8";
      #LC_NUMERIC = "en_US.UTF-8/UTF-8";
      #LC_TIME = "en_US.UTF-8/UTF-8";
      #LC_COLLATE = "en_US.UTF-8/UTF-8";
      #LC_NAME = "en_US.UTF-8/UTF-8";
      #LC_MONETARY = "en_US.UTF-8/UTF-8";
      #LC_PAPER = "en_US.UTF-8/UTF-8";
      #LC_ADDRESS = "en_US.UTF-8/UTF-8";
      #LC_TELEPHONE = "en_US.UTF-8/UTF-8";
      #LC_MEASUREMENT = "en_US.UTF-8/UTF-8";
    #};
  };
}