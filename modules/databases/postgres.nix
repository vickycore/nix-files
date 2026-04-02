{ config, ... }:

{
  services.postgresql = {
    enable = true;
    
    # Run via local socket
    enableTCPIP = false;

    ensureDatabases = [
      nixcloud  # access layer for personal files
    ];

    ensureUsers = [
      {
        name = "nixcloud"
        ensureDBOwnership = true; # ability to create/drop tables freely
        # ensureClauses.createdb = true;
      }
    ];

    # See postgresql's pga_hba.conf format: https://www.postgresql.org/docs/current/auth-pg-hba-conf.html
    # a user gets access when their name is the same as the database's
    # postgres acts as superuser (see identMap)
    authentication = pkgs.lib.mkOverride 10 ''
      #type database DBuser   auth-method optional_ident_map
      local sameuser all      peer        map=superuser_map
    '';
    
    identMap = ''
      
    '';

    # Settings TODO: Is this host stuff?
    # TODO: Unfinished
  };
}
