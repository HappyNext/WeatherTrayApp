{
  description = "Python venv environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    devShells.x86_64-linux.default = pkgs.mkShell {
      packages = [
        pkgs.python3
        pkgs.stdenv.cc.cc.lib # Важно для компиляции C-зависимостей
        pkgs.zlib
      ];

      shellHook = ''
        # Указываем пути к разделяемым библиотекам, чтобы pip мог собирать пакеты
        export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib:${pkgs.zlib}/lib:$LD_LIBRARY_PATH"
        
        # Автоматическое создание и активация venv при входе
        if [ ! -d ".venv" ]; then
          python -m venv .venv
        fi
        source .venv/bin/activate
      '';
    };
  };
}