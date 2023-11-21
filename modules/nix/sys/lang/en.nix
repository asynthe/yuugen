{ config, pkgs, ... }: {

  time.timeZone = "Australia/Perth";

  i18n = {
    defaultLocale = "en_US.UTF-8/UTF-8";
    supportedLocales = [
      "ja_JP.UTF-8/UTF-8"
      "ja_JP.EUC-JP/EUC-JP"
    ];

   #extraLocaleSettings = {
   #  LC_ALL = "en_US.UTF-8"; # This replaces all the other ones.
   #  LC_MESSAGES = "en_US.UTF-8";
   #  LC_TIME = "en_US.UTF-8";
   #  LC_ADDRESS = "en_US.UTF-8";
   #  LC_IDENTIFICATION = "en_US.UTF-8";
   #  LC_MEASUREMENT = "en_US.UTF-8";
   #  LC_MONETARY = "en_US.UTF-8";
   #  LC_NAME = "en_US.UTF-8";
   #  LC_NUMERIC = "en_US.UTF-8";
   #  LC_PAPER = "en_US.UTF-8";
   #  LC_TELEPHONE = "en_US.UTF-8";
   };
  };

}