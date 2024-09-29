; Skript zabezpečí, že sa nebudú spúšťať viaceré inštancie tohto skriptu
#SingleInstance, Force

; Definícia skratky Ctrl+Shift+E na spustenie Total Commander
^+e::
{
    Run, C:\Program Files\totalcmd\tcrun64.exe
}
return


